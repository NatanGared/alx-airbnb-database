-- Create User Table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX (email)  -- Index on email for faster lookups
);

-- Create Property Table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID,
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR NOT NULL,
    pricepernight DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User(user_id)  -- Foreign key to User
);

-- Create Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID,
    user_id UUID,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),  -- Foreign key to Property
    FOREIGN KEY (user_id) REFERENCES User(user_id)  -- Foreign key to User
);

-- Create Payment Table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID,
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)  -- Foreign key to Booking
);

-- Create Review Table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID,
    user_id UUID,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),  -- Foreign key to Property
    FOREIGN KEY (user_id) REFERENCES User(user_id)  -- Foreign key to User
);

-- Create Message Table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID,
    recipient_id UUID,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id),  -- Foreign key to User (sender)
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)  -- Foreign key to User (recipient)
);