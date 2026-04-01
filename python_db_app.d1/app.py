#app.py
import os
os.putenv('LIBMYSQL_ENABLE_CLEARTEXT_PLUGIN', '1')
import mysql.connector
from dotenv import load_dotenv
load_dotenv()


print("hello world")
try:
    connection = mysql.connector.connect(
    host=os.getenv('DB_HOST'),
    user=os.getenv('DB_USER'),
    password=os.getenv('DB_PASSWORD'),
    database=os.getenv('DB_NAME'))
except mysql.connector.Error as err:
    print(f"Error: {err}")
else:
    print("Connection to the database was succesful!")
