CREATE DATABASE Airbnbclone;

USE Airbnbclone;

CREATE TABLE Users(
    userID UUID,
    firstname VARCHAR(40) Not NULL,
    lastname VARCHAR(40) Not NULL,
    email VARCHAR(100) UNIQUE Not NULL,
    password_hash VARCHAR(255) Not NULL,
    specification ENUM('guest', 'host', 'admin') Not NUll
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (userID)
);

CREATE TABLE Property(
    propertyID UUID,
    hostID UUID NOT NULL,
    name VARCHAR(100) NOT NULL,
    descreption TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY(propertyID)
    FOREIGN KEY (hostID) REFERENCES Users(userID) 
);

CREATE TABLE BOOKING(
    bookingID UUID,
    propertyID UUID NOT NULL,
    userID UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(bookingID),
    FOREIGN KEY (propertyID) REFERENCES Property(propertyID),  
    FOREIGN KEY (userID) REFERENCES Users(userID)

);

CREATE TABLE Payement(
    payementID UUID,
    bookingID UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payement_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payement_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,

    PRIMARY KEY (payementID),
    FOREIGN KEY (bookingID) REFERENCES BOOKING(bookingID),
);

CREATE TABLE Review(
    reviewID UUID,
    propertyID UUID NOT NULL,
    userID UUID NOT NULL,
    rating int  NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (reviewID), 
    FOREIGN KEY (propertyID) REFERENCES Property(propertyID),
    FOREIGN KEY (userID) REFERENCES Users(userID),
);

CREATE TABLE MESSAGE(
    messageID UUID,
    senderID UUID NOT NULL,
    recieverID UUDI NOT NULL,
    messagebodey TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(messageID),
    FOREIGN KEY(senderID) REFERENCES Users(userID),
    FOREIGN KEY(recieverID) REFERENCES Users(userID),
);