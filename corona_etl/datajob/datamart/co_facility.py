"""
집단시설과 10만명당 코로나 확진자수의 상관관계
"""
from pyspark.sql.functions import col, ceil
from infra.util import cal_std_day
from infra.jdbc import DataMart, DataWarehouse, find_data, save_data

class CoFacility:
    
    @classmethod
    def save(cls):
        fac_popu = find_data(DataWarehouse, 'LOC')
        patients = find_data(DataWarehouse, 'CORONA_PATIENTS')
        fac_popu = fac_popu.select('loc', ceil(fac_popu.FACILITY_CNT/fac_popu.POPULATION*100000)
                                        .alias('fac_popu'))

        co_facility = patients.join(fac_popu, on='LOC') \
                    .select('LOC', 'FAC_POPU', 'QUR_RATE', 'STD_DAY') \
                    .where(col('std_day') == '2022-09-23')

        save_data(DataMart, co_facility, 'CO_FACILITY')
