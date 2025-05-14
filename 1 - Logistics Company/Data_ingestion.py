import os
import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

load_dotenv()

# Step 1: Database connection config
host = os.getenv("DB_HOST")
port = os.getenv("PORT") # <-- Update this to your correct port
database = os.getenv("DB_NAME")
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")

# Step 2: Create SQLAlchemy engine
engine = create_engine(f'postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}')

# Step 3: Folder containing CSVs and table mapping
csv_files = {
    'status_report.csv': 'status',
    'payment_details.csv': 'payment_details',
    'shipment_details.csv': 'shipment_details',
    'membership_data.csv': 'membership',
    'employee_shipment_management.csv': 'employee_manages_shipment',
    'customer_data.csv': 'customer',
    'employee_details.csv': 'employee_details',
}

csv_dir = '/Users/shivsk/Documents/Projects/Case studies/1 - Logistics Company'

# Step 4: Loop through and load each file
for file_name, table_name in csv_files.items():
    file_path = os.path.join(csv_dir, file_name)
    try:
        df = pd.read_csv(file_path)
        df.to_sql(table_name, con=engine, if_exists='replace', index=False)
        print(f"✅ Loaded '{file_name}' into table '{table_name}'")
    except Exception as e:
        print(f"❌ Error loading '{file_name}': {e}")