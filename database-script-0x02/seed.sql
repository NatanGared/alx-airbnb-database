-- Insert sample data into User Table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (uuid_generate_v4(), 'Alice', 'Smith', 'alice@example.com', 'hash1', '123-456-7890', 'host'),
    (uuid_generate_v4(), 'Bob', 'Johnson', 'bob@example.com', 'hash2', '234-567-8901', 'guest'),
    (uuid_generate_v4(), 'Charlie', 'Williams', 'charlie@example.com', 'hash3', '345-678-9012', 'admin'),
    (uuid_generate_v4(), 'Dana', 'Brown', 'dana@example.com', 'hash4', '456-789-0123', 'guest');

-- Insert sample data into Property Table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
    (uuid_generate_v4(), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 'Cozy Cottage', 'A cozy cottage in the countryside.', 'Countryside, USA', 100),
    (uuid_generate_v4(), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 'Beachfront Villa', 'Luxury villa with ocean views.', 'Miami, FL', 200),
    (uuid_generate_v4(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Downtown Apartment', 'Modern apartment in the city center.', 'New York, NY', 150);

-- Insert sample data into Booking Table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
VALUES
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM User WHERE email = 'bob@example.com'), '2023-07-01', '2023-07-05', 'confirmed'),
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Beachfront Villa'), (SELECT user_id FROM User WHERE email = 'bob@example.com'), '2023-08-10', '2023-08-15', 'pending'),
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Downtown Apartment'), (SELECT user_id FROM User WHERE email = 'charlie@example.com'), '2023-09-01', '2023-09-05', 'confirmed');

-- Insert sample data into Payment Table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
    (uuid_generate_v4(), (SELECT booking_id FROM Booking WHERE status = 'confirmed' AND user_id = (SELECT user_id FROM User WHERE email = 'bob@example.com')), 500, 'credit_card'),
    (uuid_generate_v4(), (SELECT booking_id FROM Booking WHERE status = 'pending' AND user_id = (SELECT user_id FROM User WHERE email = 'bob@example.com')), 1000, 'paypal'),
    (uuid_generate_v4(), (SELECT booking_id FROM Booking WHERE status = 'confirmed' AND user_id = (SELECT user_id FROM User WHERE email = 'charlie@example.com')), 750, 'stripe');

-- Insert sample data into Review Table
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 5, 'Amazing stay! Highly recommend.'),
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Beachfront Villa'), (SELECT user_id FROM User WHERE email = 'charlie@example.com'), 4, 'Great views but a bit pricey.'),
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Downtown Apartment'), (SELECT user_id FROM User WHERE email = 'dana@example.com'), 5, 'Perfect location!');

-- Insert sample data into Message Table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
    (uuid_generate_v4(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 'Hi Alice, looking forward to my stay!'),
    (uuid_generate_v4(), (SELECT user_id FROM User WHERE email = 'charlie@example.com'), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Hope you enjoyed the apartment!'),
    (uuid_generate_v4(), (SELECT user_id FROM User WHERE email = 'dana@example.com'), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 'Can I ask about the property details?');