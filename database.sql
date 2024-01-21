-- create assurance_db
CREATE DATABASE IF NOT EXISTS assurance_db;
-- use assurance_db
USE assurance_db;

-- create table client

CREATE TABLE IF NOT EXISTS client (
    id VARCHAR(36) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    birth_date DATE NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    national_id VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    tel VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    status ENUM('Active', 'Inactive', 'Suspended') NOT NULL,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);


-- crate table vehicule 

CREATE TABLE IF NOT EXISTS vehicule (
    id VARCHAR(36) PRIMARY KEY,
    current_car_value DECIMAL(10,2) NOT NULL,
    cylinder_count INT NOT NULL,
    number_of_ports INT NOT NULL,-- added new
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    empty_weight DECIMAL(8,2) NOT NULL,
    fuel_type VARCHAR(50) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    gross_vehicle_weight_rating DECIMAL(10,2) NOT NULL,
    license_plate_number VARCHAR(20) NOT NULL,
    manufacturing_date DATE NOT NULL,
    marque VARCHAR(50) NOT NULL,
    status ENUM('Active', 'Inactive', 'Suspended') NOT NULL,
    tax_horsepower INT NOT NULL,
    tax_identification_number VARCHAR(20) NOT NULL,
    type_vehicule ENUM('Car', 'Motor', 'Camion') NOT NULL,
    vehicule_identification_number VARCHAR(50) NOT NULL,
    client_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES client(id)
);


-- create table driver licence 
CREATE TABLE IF NOT EXISTS driver_license (
    id VARCHAR(36) PRIMARY KEY,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    expiration_date DATE NOT NULL,
    issue_date DATE NOT NULL,
    license_number VARCHAR(50) NOT NULL,
    status ENUM('Active', 'Inactive', 'Expired', 'Pending') NOT NULL,
    type ENUM('CarA', 'CarB', 'CarC') NOT NULL,
    client_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES client(id)
);



-- create table assurance

CREATE TABLE IF NOT EXISTS assurance (
    id VARCHAR(36) PRIMARY KEY,
    date_create  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    status ENUM('Active', 'Inactive', 'Suspended') NOT NULL,
    type ENUM('Tout risque', 'responsabilite civil') NOT NULL,
    vehicle_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicule(id)
);

-- create table notification

CREATE TABLE IF NOT EXISTS notification (
    id VARCHAR(36) PRIMARY KEY,
    date_notification  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    message VARCHAR(255) NOT NULL,
    status ENUM('Read', 'Unread','Archivied','stared') NOT NULL,
    client_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES client(id)
);


-- create table contrat

CREATE TABLE IF NOT EXISTS contrat (
    id VARCHAR(36) PRIMARY KEY,
    date_start DATE NOT NULL,
    date_fin DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    vehicle_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicule(id)
);

