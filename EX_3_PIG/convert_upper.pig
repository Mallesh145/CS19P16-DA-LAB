 -- Register the Python UDF script
REGISTER 'hdfs:///user/malle/user/Admin/home/hadoop/my_udf.py' USING jython AS udf;

-- Load the input file from HDFS
data = LOAD 'hdfs:///user/malle/user/Admin/home/hadoop/input.txt' AS (text:chararray);

-- Apply the UDF to convert each line to uppercase
uppercased_data = FOREACH data GENERATE udf.to_upper(text) AS uppercase_text;

-- Store the result in HDFS
STORE uppercased_data INTO 'hdfs:///user/malle/user/Admin/home/hadoop/out';