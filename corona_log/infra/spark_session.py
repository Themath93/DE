import findspark
from pyspark.sql import SparkSession

def get_spark_session():
    spark_version = '3.2.2'
    findspark.init()
    findspark.add_packages(['org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.2','org.apache.kafka:kafka-clients:3.2.1'])
    return SparkSession.builder.getOrCreate()
