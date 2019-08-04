# env setup + java8 + spark
```
cd ~
sudo apt install openjdk-8-jdk-headless         
which java

export JAVA_HOME="/usr"
export PATH=$PATH$JAVA_HOME/bin

wget -c https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz

mkdir spark -p && tar -zxvf spark-2.2.0-bin-hadoop* -C ~/spark/

export SPARK_HOME=~/spark/spark-2.2.0-bin-hadoop2.7
export PATH=$PATH:$SPARK_HOME/bin
```


## spark-shell 
```
cd $SPARK_HOME
spark-shell
val df = spark.read.json("examples/src/main/resources/people.json")
df.filter("age > 10" ).select("name","age").show()

      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 2.2.0
      /_/

Using Scala version 2.11.8 (OpenJDK 64-Bit Server VM, Java 1.8.0_222)
Type in expressions to have them evaluated.
Type :help for more information.

scala> val df = spark.read.json("examples/src/main/resources/people.json")
df: org.apache.spark.sql.DataFrame = [age: bigint, name: string]

scala> df.filter("age > 10" ).select("name","age").show()
+------+---+
|  name|age|
+------+---+
|  Andy| 30|
|Justin| 19|
+------+---+

```


## pySpark-shell
```
pyspark

df = spark.read.json("examples/src/main/resources/people.json")
df.filter("age > 10").select("name","age").show()

df.createOrReplaceTempView("people")
spark.sql("SELECT * FROM people where age > 21").show()


Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /__ / .__/\_,_/_/ /_/\_\   version 2.2.0
      /_/

Using Python version 2.7.15+ (default, Nov 27 2018 23:36:35)
SparkSession available as 'spark'.
>>> df = spark.read.json("examples/src/main/resources/people.json")
>>> df.filter("age > 10").select("name","age").show()
+------+---+
|  name|age|
+------+---+
|  Andy| 30|
|Justin| 19|
+------+---+

>>> df.createOrReplaceTempView("people")
>>> spark.sql("SELECT * FROM people where age > 21").show()
+---+----+
|age|name|
+---+----+
| 30|Andy|
+---+----+

```




## python3 + jupyter + toree

```
pip3 install --upgrade pip
pip3 install --upgrade --force-reinstall --no-cache-dir jupyter --user
pip3 install --upgrade --force-reinstall --no-cache-dir toree --user

pip3 install --upgrade --force-reinstall --no-cache-dir findspark --user

sudo ~/.local/bin/jupyter-toree  --spark_home $SPARK_HOME --interpreters=Scala,PySpark,SQL
 
# run it

jupyter notebook
```

# a test
```
# useful to have this code snippet to avoid getting an error in case forgeting 
# to close spark

try:
    spark.stop()
except:
    pass

# Using findspark to find automatically the spark folder
import findspark
findspark.init()

# import python libraries
import random

# initialize
from pyspark.sql import SparkSession 
spark = SparkSession.builder.master("local[*]").getOrCreate()
num_samples = 100000000

def inside(p):
    x, y = random.random(), random.random()
    return x*x + y*y < 1

count = spark.sparkContext.parallelize(range(0, num_samples)).filter(inside).count()
pi = 4 * count / num_samples
print(pi)
```

# reboot the subsystem if needed
```
Just open a cmd window as adminstrator and run these commands to restart it.

net stop LxssManager
net start LxssManager
```
