-- -- Create the database
-- CREATE DATABASE package_tracking;

-- -- Use the database
-- USE package_tracking;

-- Create the Users table
-- +goose Up
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, 
    role ENUM('business_owner', 'courier', 'admin') NOT NULL
);

-- Create the Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    pickup_location VARCHAR(255) NOT NULL,
    dropoff_location VARCHAR(255) NOT NULL,
    package_details TEXT NOT NULL,
    delivery_time DATETIME,
    status ENUM('pending', 'accepted', 'in_transit', 'delivered', 'canceled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the AssignedOrders table
CREATE TABLE assignedorders (
    assign_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    courier_id INT NOT NULL,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'accepted', 'declined') DEFAULT 'pending',
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (courier_id) REFERENCES users(user_id)
);
-- +goose Down
 DROP TABLE post;

