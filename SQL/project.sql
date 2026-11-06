/*CREATE DATABASE retail_analytics_db;*/
USE retail_analytics_db;

CREATE TABLE regions (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    city VARCHAR(100),
    region_id INT,
    signup_date DATE,
    customer_segment VARCHAR(30) DEFAULT 'Regular',
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT,
    cost DECIMAL(10,2) NOT NULL,
    selling_price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    CHECK (cost >= 0),
    CHECK (selling_price >= 0),
    CHECK (stock_quantity >= 0)
);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    region_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) DEFAULT 'Pending',
    sales_channel VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CHECK (order_status IN
    ('Delivered', 'Pending', 'Processing', 'Cancelled', 'Returned')),
    CHECK (sales_channel IN ('Online', 'Store', 'Phone'))
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(5,2) DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    CHECK (quantity > 0),
    CHECK (price >= 0),
    CHECK (discount BETWEEN 0 AND 100)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CHECK (amount >= 0),
    CHECK (payment_method IN
    ('Cash', 'Card', 'UPI', 'Net Banking')),
    CHECK (payment_status IN
    ('Paid', 'Pending', 'Failed', 'Refunded'))
);

CREATE TABLE returns (
    return_id INT AUTO_INCREMENT PRIMARY KEY,
    order_item_id INT NOT NULL,
    return_date DATE,
    quantity INT NOT NULL,
    reason VARCHAR(255),
    refund_amount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (order_item_id) REFERENCES order_items(order_item_id),
    CHECK (quantity > 0),
    CHECK (refund_amount >= 0)
);
SHOW TABLES;
SELECT COUNT(*) AS total_tables
FROM information_schema.tables
WHERE table_schema = 'RetailSalesDB';
INSERT INTO regions (region_name)
VALUES
('North'),
('South'),
('East'),
('West'),
('Central');

INSERT INTO categories (category_name)
VALUES
('Electronics'),
('Furniture'),
('Accessories'),
('Stationery'),
('Home Appliances');

SELECT * FROM regions;
SELECT * FROM categories;


INSERT INTO customers
(customer_name, email, city, region_id, signup_date, customer_segment)
VALUES
('Anu Thomas', 'anu@gmail.com', 'Kochi', 2, '2025-01-10', 'Regular'),
('Rahul Nair', 'rahul@gmail.com', 'Kannur', 2, '2025-02-15', 'Premium'),
('Meera Das', 'meera@gmail.com', 'Chennai', 3, '2025-03-20', 'Regular'),
('Arjun Kumar', 'arjun@gmail.com', 'Mumbai', 4, '2025-04-05', 'Corporate'),
('Priya Menon', 'priya@gmail.com', 'Delhi', 1, '2025-04-18', 'Premium'),
('Vishnu Raj', 'vishnu@gmail.com', 'Kozhikode', 2, '2025-05-12', 'Regular'),
('Sneha Paul', 'sneha@gmail.com', 'Bengaluru', 5, '2025-06-01', 'Corporate'),
('Akhil Mohan', 'akhil@gmail.com', 'Hyderabad', 3, '2025-06-22', 'Regular'),
('Divya Suresh', 'divya@gmail.com', 'Thrissur', 2, '2025-07-09', 'Premium'),
('Nikhil Varma', 'nikhil@gmail.com', 'Pune', 4, '2025-08-14', 'Regular');
SELECT * FROM customers;
INSERT INTO products
(product_name, category_id, cost, selling_price, stock_quantity)
VALUES
('Laptop', 1, 40000, 50000, 20),
('Smartphone', 1, 15000, 20000, 35),
('Monitor', 1, 7000, 10000, 18),
('Keyboard', 3, 500, 900, 50),
('Mouse', 3, 250, 500, 60),
('Office Chair', 2, 3000, 4500, 15),
('Office Desk', 2, 5000, 7500, 12),
('Notebook Pack', 4, 100, 180, 80),
('Printer', 1, 6000, 8500, 22),
('Headphones', 3, 1200, 2000, 28),
('Mixer Grinder', 5, 2500, 3500, 16),
('Electric Kettle', 5, 900, 1400, 30),
('Tablet', 1, 12000, 16000, 14),
('Pen Set', 4, 150, 250, 100),
('Webcam', 3, 1800, 2800, 10);
SELECT * FROM products;
SELECT product_name, selling_price, stock_quantity
FROM products
ORDER BY selling_price DESC;
INSERT INTO employees
(employee_name, job_title, region_id, salary)
VALUES
('Asha Nair', 'Sales Manager', 2, 45000),
('Rohit Sharma', 'Sales Executive', 1, 28000),
('Neha Das', 'Sales Executive', 3, 30000),
('Kiran Joseph', 'Regional Manager', 4, 50000),
('Manu Raj', 'Sales Executive', 5, 27000);
SELECT * FROM employees;
SELECT COUNT(*) AS total_customers FROM customers;

SELECT COUNT(*) AS total_products FROM products;

SELECT COUNT(*) AS total_employees FROM employees;

SELECT COUNT(*) AS total_regions FROM regions;

SELECT COUNT(*) AS total_categories FROM categories;


