-- Create Database
CREATE DATABASE ecommerce;
USE ecommerce;

-- Create Tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE
);

-- Insert Data
INSERT INTO customers VALUES
(1, 'Amit', 'India'),
(2, 'John', 'USA'),
(3, 'Sara', 'UK'),
(4, 'Priya', 'India');

INSERT INTO products VALUES
(101, 'Laptop', 50000),
(102, 'Phone', 20000),
(103, 'Headphones', 2000),
(104, 'Tablet', 30000);

INSERT INTO orders VALUES
(1, 1, 101, 1, '2024-01-10'),
(2, 2, 102, 2, '2024-02-15'),
(3, 1, 103, 3, '2024-03-20'),
(4, 3, 104, 1, '2024-04-05'),
(5, 4, 102, 1, '2024-05-12');

-- Analysis Queries

-- Total Revenue
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- Top Customers
SELECT c.name, SUM(p.price * o.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- Best Selling Product
SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Country-wise Sales
SELECT c.country, SUM(p.price * o.quantity) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.country;