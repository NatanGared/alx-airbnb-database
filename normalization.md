Entities
User
Attributes: user_id, first_name, last_name, email, password_hash, phone_number, role, created_at
Property
Attributes: property_id, host_id, name, description, location, pricepernight, created_at, updated_at
Booking
Attributes: booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
Payment
Attributes: payment_id, booking_id, amount, payment_date, payment_method
Review
Attributes: review_id, property_id, user_id, rating, comment, created_at
Message
Attributes: message_id, sender_id, recipient_id, message_body, sent_at
Potential Redundancies and Violations
User Table:

All attributes are dependent on user_id, so it complies with 1NF and 2NF. No transitive dependencies are found.
Property Table:

All attributes are dependent on property_id. No transitive dependencies are present.
Booking Table:

The total_price might depend on property_id and the duration of the stay (end_date - start_date). This could be seen as a transitive dependency.
Payment Table:

All attributes are dependent on payment_id. No transitive dependencies are present.
Review Table:

All attributes are dependent on review_id. No transitive dependencies found.
Message Table:

All attributes are dependent on message_id. No transitive dependencies are present.
Adjustments to Achieve 3NF
To achieve 3NF, we need to address the potential transitive dependency in the Booking table related to total_price.

Steps Taken
Remove total_price from the Booking Table:

Instead of storing total_price in the Booking table, we can calculate it dynamically based on the property’s price per night and the duration of the stay.
This can be done using a query whenever needed.
Revised Schema:

User: No changes needed.
Property: No changes needed.
Booking:
Attributes: booking_id, property_id, user_id, start_date, end_date, status, created_at
Payment: No changes needed.
Review: No changes needed.
Message: No changes needed.
Final Schema in 3NF
User

user_id: Primary Key
first_name: VARCHAR, NOT NULL
last_name: VARCHAR, NOT NULL
email: VARCHAR, UNIQUE, NOT NULL
password_hash: VARCHAR, NOT NULL
phone_number: VARCHAR, NULL
role: ENUM (guest, host, admin), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Property

property_id: Primary Key
host_id: Foreign Key, references User(user_id)
name: VARCHAR, NOT NULL
description: TEXT, NOT NULL
location: VARCHAR, NOT NULL
pricepernight: DECIMAL, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
Booking

booking_id: Primary Key
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
start_date: DATE, NOT NULL
end_date: DATE, NOT NULL
status: ENUM (pending, confirmed, canceled), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Payment

payment_id: Primary Key
booking_id: Foreign Key, references Booking(booking_id)
amount: DECIMAL, NOT NULL
payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
payment_method: ENUM (credit_card, paypal, stripe), NOT NULL
Review

review_id: Primary Key
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
comment: TEXT, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Message

message_id: Primary Key
sender_id: Foreign Key, references User(user_id)
recipient_id: Foreign Key, references User(user_id)
message_body: TEXT, NOT NULL
sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP