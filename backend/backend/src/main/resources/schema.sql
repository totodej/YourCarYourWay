CREATE DATABASE your_car_your_way;

USE your_car_your_way;


-- =====================================
-- USERS
-- =====================================

CREATE TABLE USERS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    birth_date DATE,
    address VARCHAR(255),
    phone_number VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP
);


-- =====================================
-- AGENCIES
-- =====================================

CREATE TABLE AGENCIES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    opening_hours VARCHAR(255),
    phone_number VARCHAR(50)
);


-- =====================================
-- RENTAL_OFFERS
-- =====================================

CREATE TABLE RENTAL_OFFERS (
    id INT AUTO_INCREMENT PRIMARY KEY,

    departure_agency_id INT NOT NULL,
    return_agency_id INT NOT NULL,

    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,

    acriss_category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_offer_departure_agency
        FOREIGN KEY (departure_agency_id)
        REFERENCES AGENCIES(id),

    CONSTRAINT fk_offer_return_agency
        FOREIGN KEY (return_agency_id)
        REFERENCES AGENCIES(id)
);


-- =====================================
-- RESERVATIONS
-- =====================================

CREATE TABLE RESERVATIONS (
    id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,
    offer_id INT NOT NULL,

    status VARCHAR(50) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_reservation_user
        FOREIGN KEY (user_id)
        REFERENCES USERS(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_reservation_offer
        FOREIGN KEY (offer_id)
        REFERENCES RENTAL_OFFERS(id)
);


-- =====================================
-- PAYMENTS
-- =====================================

CREATE TABLE PAYMENTS (
    id INT AUTO_INCREMENT PRIMARY KEY,

    reservation_id INT NOT NULL,

    provider_reference VARCHAR(255),
    payment_status VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_payment_reservation
        FOREIGN KEY (reservation_id)
        REFERENCES RESERVATIONS(id)
        ON DELETE CASCADE
);


-- =====================================
-- SUPPORT_TICKETS
-- =====================================

CREATE TABLE SUPPORT_TICKETS (
    id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,

    subject VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,


    CONSTRAINT fk_ticket_user
        FOREIGN KEY (user_id)
        REFERENCES USERS(id)
        ON DELETE CASCADE
);


-- =====================================
-- SUPPORT_MESSAGES
-- =====================================

CREATE TABLE SUPPORT_MESSAGES (
    id INT AUTO_INCREMENT PRIMARY KEY,

    ticket_id INT NOT NULL,

    sender_type VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,


    CONSTRAINT fk_message_ticket
        FOREIGN KEY (ticket_id)
        REFERENCES SUPPORT_TICKETS(id)
        ON DELETE CASCADE
);