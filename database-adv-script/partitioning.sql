-- Step 1: Create the main partitioned table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions for specific date ranges
CREATE TABLE bookings_2023 PARTITION OF bookings FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
CREATE TABLE bookings_2024 PARTITION OF bookings FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
