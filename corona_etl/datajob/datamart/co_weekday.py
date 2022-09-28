from pyspark.sql.functions import current_date, dayofweek, col, when
from infra.util import cal_std_day
from infra.jdbc import DataMart, DataWarehouse, find_data, save_data


class CoWeekday:

    @classmethod
    def save(cls):
        patients = find_data(DataWarehouse,'CORONA_PATIENTS')
        p = cls.__add_day_of_week(patients)
        p = cls.__pivot_df(p)
        p = p.withColumn('std_day', current_date().cast("string"))
        save_data(DataMart, p, 'CO_WEEKDAY')

    @classmethod
    def __pivot_df(cls, p):
        pd_p = p.to_pandas_on_spark()
        pd_p = pd_p.pivot_table(columns='day_of_week', values='patients')
        pd_p.reset_index()
        p = pd_p.to_spark()
        return p

    @classmethod
    def __add_day_of_week(cls, patients):
        p = patients \
            .withColumn('day_of_week', dayofweek(col('std_day'))) \
            .where(col('std_day').between(cal_std_day(1), cal_std_day(7)))

        p = p.groupby(p.day_of_week).agg(sum(col('loc_occ_cnt')).alias('patients')).sort(col('day_of_week'))
        p = p.withColumn('day_of_week', when(p.day_of_week == 1, 'SUN')
                                    .when(p.day_of_week == 2, 'MON')
                                    .when(p.day_of_week == 3, 'TUE')
                                    .when(p.day_of_week == 4, 'WED')
                                    .when(p.day_of_week == 5, 'THU')
                                    .when(p.day_of_week == 6, 'FRI')
                                    .when(p.day_of_week == 7, 'SAT'))
                                    
        return p
        