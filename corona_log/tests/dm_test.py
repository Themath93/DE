import unittest
from infra.spark_session import get_spark_session
from infra.util import cal_std_day

class MTest(unittest.TestCase):

    def test1(self):
        kafka_bootstrap_servers = 'localhost:9092'
        topic = 'test'

        df = get_spark_session() \
            .readStream\
            .format("kafka") \
            .option("kafka.bootstrap.servers", kafka_bootstrap_servers) \
            .option("startingOffsets", "latest") \
            .option("failOnDataLoss", "False") \
            .option("subscribe", topic) \
            .load()
        df.printSchema()

        df.writeStream \
            .format("json") \
            .outputMode("append") \
            .option('checkpointLocation', '/tmp/checkpoint') \
            .trigger(processingTime='20 seconds')  \
            .start('/corona_data/log/' + cal_std_day(0) + '.json') \
            .awaitTermination()

if __name__ == "__main__":
    unittest.main()