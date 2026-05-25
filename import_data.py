import pandas as pd
import mysql.connector

df = pd.read_csv(r'C:\Users\YourName\Downloads\archive\Sample - Superstore.csv', encoding='latin1')

df.columns = ['Row_ID','Order_ID','Order_Date','Ship_Date','Ship_Mode',
              'Customer_ID','Customer_Name','Segment','Country','City',
              'State','Postal_Code','Region','Product_ID','Category',
              'Sub_Category','Product_Name','Sales','Quantity','Discount','Profit']

conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='YourPasswordHere',
    database='superstore'
)

cursor = conn.cursor()

for _, row in df.iterrows():
    cursor.execute("""
        INSERT INTO orders VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
    """, tuple(row))

conn.commit()
cursor.close()
conn.close()
print("Done! All rows imported successfully.")