Project Summary 

A company named Sparkify wants to analyze data that it has been collecting from their streaming app. The main purpose behind the project is to view which songs are streamed the most. The data resides in a directory of JSON logs and Sparkify wants to create a Postgres database for queries that can analyze its data. The goal is to create a star database schema and ETL pipeline for data analysis. The database will be tested for errors to ensure that it works efficiently. 

How to Run Python Scripts 

1. Use CREATE, DROP, and INSERT statements in the sql_queries.py file. 
2. Run the create_tables.py file to create the sparkifydb database and tables. 
3. The etl.ipynb file is used to create ETL processes for each table within the database. 
4. The etl.py file uses code that was pulled from the etl.ipynb file to create an ETL pipeline. 
5. The test.ipnyb file checks to see if all data was correctly inserted into each table within the database. 

An Explanation of the Files in the Repository 

- sql.queries.py: contains CREATE, DROP, and INSERT statements with the necessary variables 
- create_tables.py: drops all tables if they exist and creates new tables 
- etl.ipynb: creates ETL processes for each table 
- etl.py: processes the datasets and creates an ETL pipeline 
- test.ipnyb: checks for errors to ensure that the database runs efficiently and for its intended purpose 