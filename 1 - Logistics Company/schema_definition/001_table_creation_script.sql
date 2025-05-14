-- Create table: Status_report
-- DROP TABLE IF EXISTS Employee_Details;
-- DROP TABLE IF EXISTS Membership;
-- DROP TABLE IF EXISTS Customer;
-- DROP TABLE IF EXISTS Shipment_Details;
-- DROP TABLE IF EXISTS Payment_Details;
-- DROP TABLE IF EXISTS Status;
-- DROP TABLE IF EXISTS Employee_Manages_Shipment;

-- 1. Employee_Details Table
CREATE TABLE Employee_Details (
    Emp_ID INT PRIMARY KEY,
    Emp_NAME VARCHAR(30),
    Emp_BRANCH VARCHAR(15),
    Emp_DESIGNATION VARCHAR(40),
    Emp_ADDR VARCHAR(100),
    Emp_CONT_NO BIGINT
);

-- 2. Membership Table
CREATE TABLE Membership (
    M_ID INT PRIMARY KEY,
    START_DATE DATE,
    END_DATE DATE
);

-- 3. Customer Table
CREATE TABLE Customer (
    Cust_ID INT PRIMARY KEY,
    Cust_NAME VARCHAR(30),
    Cust_EMAIL_ID VARCHAR(50),
    Cust_CONT_NO BIGINT,
    Cust_ADDR VARCHAR(100),
    Cust_TYPE VARCHAR(30),
    Membership_M_ID INT,
    FOREIGN KEY (Membership_M_ID) REFERENCES Membership(M_ID)
);

-- 4. Shipment_Details Table
CREATE TABLE Shipment_Details (
    SD_ID INT PRIMARY KEY,
    SD_CONTENT VARCHAR(40),
    SD_DOMAIN VARCHAR(15),
    SD_TYPE VARCHAR(15),
    SD_WEIGHT VARCHAR(10),
    SD_CHARGES INT,
    SD_ADDR VARCHAR(100),
    DS_ADDR VARCHAR(100),
    Customer_Cust_ID INT,
    FOREIGN KEY (Customer_Cust_ID) REFERENCES Customer(Cust_ID)
);

-- 5. Payment_Details Table
CREATE TABLE Payment_Details (
    PAYMENT_ID VARCHAR(40) PRIMARY KEY,
    AMOUNT INT,
    PAYMENT_STATUS VARCHAR(10),
    PAYMENT_DATE DATE,
    PAYMENT_MODE VARCHAR(25),
    Shipment_SH_ID INT,
    Shipment_Client_C_ID INT,
    FOREIGN KEY (Shipment_SH_ID) REFERENCES Shipment_Details(SD_ID),
    FOREIGN KEY (Shipment_Client_C_ID) REFERENCES Customer(Cust_ID)
);

-- 6. Status Table
CREATE TABLE Status (
    SH_ID INT PRIMARY KEY,
    CURRENT_ST VARCHAR(15),
    SENT_DATE DATE,
    DELIVERY_DATE DATE
);

-- 7. Employee_Manages_Shipment Table
CREATE TABLE Employee_Manages_Shipment (
    Employee_E_ID INT,
    Shipment_SH_ID INT,
    Status_SH_ID INT,
    FOREIGN KEY (Employee_E_ID) REFERENCES Employee_Details(Emp_ID),
    FOREIGN KEY (Shipment_SH_ID) REFERENCES Shipment_Details(SD_ID),
    FOREIGN KEY (Status_SH_ID) REFERENCES Status(SH_ID)
);