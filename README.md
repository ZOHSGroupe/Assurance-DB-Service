## Description

Assurance-DB-Service is an MySQL database Clinet management of ZOHS company.



## Dockerize the database
```bash
# build image
$ docker build -t my-assurance-db
# run image
$ docker run -p 3306:3306 my-assurance-db
```


## Tables : 
### Table: client

    id: VARCHAR(36) PRIMARY KEY
    first_name: VARCHAR(50) NOT NULL
    last_name: VARCHAR(50) NOT NULL
    gender: ENUM('Male', 'Female', 'Other') NOT NULL
    birth_date: DATE NOT NULL
    nationality: VARCHAR(50) NOT NULL
    national_id: VARCHAR(20) NOT NULL
    email: VARCHAR(100) NOT NULL
    tel: VARCHAR(15) NOT NULL
    address: VARCHAR(255) NOT NULL
    city: VARCHAR(50) NOT NULL
    status: ENUM('Active', 'Inactive', 'Suspended') NOT NULL
    create_date: TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL

### Table: vehicule

    id: VARCHAR(36) PRIMARY KEY
    current_car_value: DECIMAL(10,2) NOT NULL
    cylinder_count: INT NOT NULL
    number_of_ports: INT NOT NULL
    date_creation: TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
    empty_weight: DECIMAL(8,2) NOT NULL
    fuel_type: VARCHAR(50) NOT NULL
    genre: VARCHAR(50) NOT NULL
    gross_vehicle_weight_rating: DECIMAL(10,2) NOT NULL
    license_plate_number: VARCHAR(20) NOT NULL
    manufacturing_date: DATE NOT NULL
    marque: VARCHAR(50) NOT NULL
    status: ENUM('Active', 'Inactive', 'Suspended') NOT NULL
    tax_horsepower: INT NOT NULL
    tax_identification_number: VARCHAR(20) NOT NULL
    type_vehicle: ENUM('Car', 'Motor', 'Camion') NOT NULL
    vehicle_identification_number: VARCHAR(50) NOT NULL
    client_id: VARCHAR(36) NOT NULL, FOREIGN KEY (client_id) REFERENCES client(id)

### Table: driver_license

    id: VARCHAR(36) PRIMARY KEY
    date_creation: TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
    expiration_date: DATE NOT NULL
    issue_date: DATE NOT NULL
    license_number: VARCHAR(50) NOT NULL
    status: ENUM('Active', 'Inactive', 'Expired', 'Pending') NOT NULL
    type: ENUM('CarA', 'CarB', 'CarC') NOT NULL
    client_id: VARCHAR(36) NOT NULL, FOREIGN KEY (client_id) REFERENCES client(id)

### Table: assurance

    id: VARCHAR(36) PRIMARY KEY
    date_create: TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
    price: DECIMAL(10,2) NOT NULL
    status: ENUM('Active', 'Inactive', 'Suspended') NOT NULL
    type: ENUM('Tout risque', 'responsabilite civil') NOT NULL
    vehicle_id: VARCHAR(36) NOT NULL, FOREIGN KEY (vehicle_id) REFERENCES vehicule(id)

### Table: notification

    id: VARCHAR(36) PRIMARY KEY
    date_notification: TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
    message: VARCHAR(255) NOT NULL
    status: ENUM('Read', 'Unread','Archived','Stared') NOT NULL
    client_id: VARCHAR(36) NOT NULL, FOREIGN KEY (client_id) REFERENCES client(id)

### Table: contrat

    id: VARCHAR(36) PRIMARY KEY
    date_start: DATE NOT NULL
    date_fin: DATE NOT NULL
    price: DECIMAL(10, 2) NOT NULL
    vehicle_id: VARCHAR(36) NOT NULL, FOREIGN KEY (vehicle_id) REFERENCES vehicule(id)

## Stay in touch
- Author - [Ouail Laamiri](https://www.linkedin.com/in/ouaillaamiri/)


## License
Assurance-DB-Service is [GPL licensed](LICENSE).