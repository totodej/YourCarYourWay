CREATE DATABASE your_car_your_way;

USE your_car_your_way;


CREATE TABLE USERS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    password_hash VARCHAR(255),
    birth_date DATE,
    address VARCHAR(255),
    phone_number VARCHAR(20),
    created_at DATETIME,
    updated_at DATETIME
);


CREATE TABLE AGENCIES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    address VARCHAR(255),
    opening_hours VARCHAR(100),
    phone_number VARCHAR(20)
);


CREATE TABLE VEHICLES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    agency_id INT NOT NULL,
    registration_number VARCHAR(50),
    brand VARCHAR(100),
    model VARCHAR(100),
    acriss_category VARCHAR(50),
    status VARCHAR(50),
    created_at DATETIME,
    updated_at DATETIME,

    CONSTRAINT fk_vehicle_agency
    FOREIGN KEY (agency_id)
    REFERENCES AGENCIES(id)
);


CREATE TABLE RENTAL_OFFERS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    departure_agency_id INT,
    return_agency_id INT,
    start_datetime DATETIME,
    end_datetime DATETIME,
    acriss_category VARCHAR(50),
    price DECIMAL(10,2),

    FOREIGN KEY (departure_agency_id)
        REFERENCES AGENCIES(id),

    FOREIGN KEY (return_agency_id)
        REFERENCES AGENCIES(id)
);


CREATE TABLE RESERVATIONS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    offer_id INT,
    vehicle_id INT,
    status VARCHAR(50),
    total_amount DECIMAL(10,2),
    created_at DATETIME,

    FOREIGN KEY (user_id)
        REFERENCES USERS(id),

    FOREIGN KEY (offer_id)
        REFERENCES RENTAL_OFFERS(id),

    FOREIGN KEY (vehicle_id)
        REFERENCES VEHICLES(id)
);


CREATE TABLE PAYMENTS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT,
    provider_reference VARCHAR(255),
    payment_status VARCHAR(50),
    amount DECIMAL(10,2),
    created_at DATETIME,

    FOREIGN KEY (reservation_id)
        REFERENCES RESERVATIONS(id)
);


CREATE TABLE SUPPORT_TICKETS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    subject VARCHAR(255),
    status VARCHAR(50),
    created_at DATETIME,

    FOREIGN KEY(user_id)
        REFERENCES USERS(id)
);


CREATE TABLE SUPPORT_MESSAGES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT,
    sender_type VARCHAR(50),
    content TEXT,
    created_at DATETIME,

    FOREIGN KEY(ticket_id)
        REFERENCES SUPPORT_TICKETS(id)
);