import time
import unittest
from pyspark.sql.functions import udf
from pyspark.sql.functions import col, pandas_udf, split
from datajob.datamart.co_popu_density import CoPopuDensity
from datajob.datamart.co_vaccine import CoVaccine
from infra.spark_session import get_spark_session
from infra.util import cal_std_day
from selenium import webdriver
from selenium.webdriver.common.by import By

from pyvirtualdisplay import Display

class MTest(unittest.TestCase):

    def test1(self):
        CoPopuDensity.save()

    def test2(self):
        CoVaccine.save()

    def test3(self):
        display = Display(visible=0, size=(1920, 1080))
        display.start()
        path='/home/big/chromedriver'
        driver = webdriver.Chrome(path)
        driver.get("http://selenium.dev")
        text_box = driver.find_element(By.TAG_NAME, 'body')
        print(text_box.text)


if __name__ == "__main__":
    unittest.main()