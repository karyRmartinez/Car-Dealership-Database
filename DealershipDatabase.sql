
DROP DATABASE IF EXISTS car_dealership_db;

CREATE DATABASE car_dealership_db;

USE car_dealership_db;

-- 1
CREATE TABLE dealerships (
    dealership_id INTEGER NOT NULL AUTO_INCREMENT,
    dealership_name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL,
    PRIMARY KEY (dealership_id)
);

-- 2
CREATE TABLE vehicles (
    vin INTEGER NOT NULL,
    vehicle_year INTEGER NOT NULL,
    make VARCHAR(50) NOT NULL,  
    model VARCHAR(50) NOT NULL, 
    color VARCHAR(50) NOT NULL, 
    vehicle_description VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    Sold BOOLEAN NOT NULL, 
    PRIMARY KEY (VIN)
);

-- Create 3
CREATE TABLE inventory (
    inventory_id INTEGER NOT NULL AUTO_INCREMENT,
    dealership_id INTEGER NOT NULL,
    VIN INTEGER NOT NULL,
    PRIMARY KEY (inventory_id),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- 4
CREATE TABLE sales_contracts (
    sales_id INTEGER NOT NULL AUTO_INCREMENT,
    sales_date DATE NOT NULL,
    customer_name VARCHAR(50) NOT NULL,
    VIN INTEGER NOT NULL,
    PRIMARY KEY (sales_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- 5
CREATE TABLE lease_contracts (
    lease_id INTEGER NOT NULL AUTO_INCREMENT,
    lease_date DATE NOT NULL,
    customer_name VARCHAR(50) NOT NULL,
    VIN INTEGER NOT NULL,
    PRIMARY KEY (lease_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

SELECT * FROM vehicles;

INSERT INTO dealerships (dealership_name, address, phone) VALUES
    ('John Smith', '11 Main St', '123-1134'),
    ('Patrick Star', '2456 Flushing St', '505-5678'),
    ('Sandy Cheeks', '789 Bikini Bottom St', '347-9101');
    
INSERT INTO vehicles (vin, vehicle_year, make, model, color, vehicle_description, price, Sold) VALUES
    (1, 2022, 'Tesla', 'Model 3', 'Knight', 'regular', 50000.00, FALSE),
    (2, 2023, 'Honda', 'Civic', 'Red', 'Coupe', 22000.00, FALSE),
    (3, 2022, 'Ford', 'Escape', 'Green', 'SUV', 30000.00, TRUE);    