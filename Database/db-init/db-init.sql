
CREATE DATABASE IF NOT EXISTS package_tracking;

USE package_tracking;

CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, 
    role ENUM('business_owner', 'courier', 'admin') NOT NULL
);
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    pickup_location VARCHAR(255) NOT NULL,
    dropoff_location VARCHAR(255) NOT NULL,
    package_details TEXT NOT NULL,
    delivery_time DATETIME,
    status ENUM('pending', 'accepted', 'in_transit', 'delivered', 'canceled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
     courier_id INT NULL
);

CREATE TABLE IF NOT EXISTS Assignedorders (
    assign_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    courier_id INT NOT NULL,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'accepted', 'declined') DEFAULT 'pending',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (courier_id) REFERENCES Users(user_id)
);

