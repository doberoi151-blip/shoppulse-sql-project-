CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Wireless Mouse', 'Electronics', 799.00, 150),
('Mechanical Keyboard', 'Electronics', 2499.00, 45),
('Running Shoes', 'Footwear', 1999.00, 80),
('Leather Wallet', 'Accessories', 499.00, 200),
('Gaming Headset', 'Electronics', 3499.00, 30),
('Water Bottle 1L', 'Fitness', 299.00, 0);

SELECT * FROM PRODUCTS ;
SELECT PRODUCT_NAME, PRICE FROM PRODUCTS ;

select * FROM products 
where category = "electronics" and PRICE >"1000";

SELECT product_name , price FROM products
order by  PRICE desc limit 2 ;

SELECT product_name, category ,  stock_quantity FROM products 
WHERE stock_quantity <= 50 ;


SELECT product_name , price FROM products 
WHERE price between 500 and 2500;

SELECT * FROM products WHERE  category 
in ("Electronics" AND  " Accessorie");

SELECT * FROM products 
WHERE category = "electronics" OR category = "accessorie";


select * FROM products
WHERE product_name like "%board%" ;

SELECT product_name, category 
FROM products 
WHERE product_name LIKE 'W%' 
  AND product_name LIKE '%e%' 
  AND product_name NOT LIKE '%e';
  
-- off safer mode 
SET SQL_SAFE_UPDATES = 0;
-- update syntex 
UPDATE products 
SET PRICE = 899.00 
WHERE product_name ='Wireless Mouse';


UPDATE products 
set stock_quantity = 100 
WHERE  category = 'Electronics';


delete FROM PRODUCTS 
WHERE stock_quantity = 0 ;

-- Step 1: Create Customers Table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Step 2: Create Orders Table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Step 3: Insert Dummy Customers
INSERT IGNORE INTO customers (customer_id, name, email, city) 
VALUES 
(1, 'Rahul Sharma', 'rahul@gmail.com', 'Delhi'),
(2, 'Priya Singh', 'priya@gmail.com', 'Mumbai');

-- Step 4: Insert Dummy Orders
INSERT INTO orders (customer_id, product_id, quantity, order_date) 
VALUES 
(1, 1, 2, '2026-03-01'),
(2, 3, 1, '2026-03-02');


-- Step 5: Verify

SELECT orders.order_id, products.product_name, products.price ,orders.quantity
FROM orders 
INNER JOIN products
on orders.product_id = products.product_id;

SELECT orders.order_id, products.product_name, products.price,orders.quantity
FROM orders 
INNER JOIN products
ON orders.product_id = products.product_id;

SELECT 
    MAX(price) AS max_price,
    MIN(price) AS min_price,
    COUNT(product_id) AS total_products
FROM products;

SELECT 
    category,
    COUNT(product_id) AS total_items,
    MAX(price) AS max_price
FROM products
GROUP BY category;
    



SELECT product_name, price 
FROM products 
WHERE price > (SELECT AVG(price) FROM products);







