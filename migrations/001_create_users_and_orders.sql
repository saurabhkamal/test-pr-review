-- Migration: Create initial tables
-- Date: 2024-01-15

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Create index for faster email lookups
CREATE INDEX idx_users_email ON users(email);

-- Create orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT NOW()
);

-- DANGEROUS: Drop a column (for testing risk detection)
ALTER TABLE orders DROP COLUMN status;

-- DANGEROUS: Drop a table (for testing risk detection)
DROP TABLE IF EXISTS old_logs;

-- Modify column (medium risk)
ALTER TABLE users MODIFY COLUMN username VARCHAR(200);

-- Add foreign key constraint
ALTER TABLE orders ADD CONSTRAINT fk_orders_user 
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;
