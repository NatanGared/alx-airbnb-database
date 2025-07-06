-- Index for User Table
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_user_id ON users(user_id);

-- Index for Booking Table
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_dates ON bookings(start_date, end_date);

-- Index for Property Table
CREATE INDEX idx_property_id ON properties(property_id);
CREATE INDEX idx_property_name ON properties(name);
CREATE INDEX idx_property_location ON properties(location);

EXPLAIN SELECT * FROM bookings WHERE user_id = 'Abebe';
ANALYZE SELECT * FROM bookings WHERE user_id = 'some_user_id';
