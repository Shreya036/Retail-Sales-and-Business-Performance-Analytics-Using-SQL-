USE retail_analytics_db;

INSERT INTO orders
(customer_id, employee_id, order_date, order_status, sales_channel)
VALUES
(1, 1, '2025-01-05', 'Delivered', 'Online'),
(2, 2, '2025-01-10', 'Delivered', 'Store'),
(3, 3, '2025-01-15', 'Pending', 'Online'),
(4, 4, '2025-01-20', 'Delivered', 'Phone'),
(5, 5, '2025-02-02', 'Cancelled', 'Online'),
(6, 1, '2025-02-08', 'Delivered', 'Store'),
(7, 2, '2025-02-12', 'Processing', 'Online'),
(8, 3, '2025-02-18', 'Delivered', 'Phone'),
(9, 4, '2025-03-03', 'Returned', 'Store'),
(10, 5, '2025-03-09', 'Delivered', 'Online'),
(1, 2, '2025-03-15', 'Delivered', 'Online'),
(2, 3, '2025-03-20', 'Pending', 'Phone'),
(3, 4, '2025-04-01', 'Delivered', 'Store'),
(4, 5, '2025-04-07', 'Delivered', 'Online'),
(5, 1, '2025-04-12', 'Processing', 'Phone'),
(6, 2, '2025-04-18', 'Delivered', 'Online'),
(7, 3, '2025-05-02', 'Delivered', 'Store'),
(8, 4, '2025-05-08', 'Cancelled', 'Phone'),
(9, 5, '2025-05-14', 'Delivered', 'Online'),
(10, 1, '2025-05-20', 'Delivered', 'Store'),
(1, 3, '2025-06-04', 'Pending', 'Online'),
(2, 4, '2025-06-10', 'Delivered', 'Phone'),
(3, 5, '2025-06-16', 'Delivered', 'Store'),
(4, 1, '2025-06-22', 'Returned', 'Online'),
(5, 2, '2025-06-28', 'Delivered', 'Online');
SELECT * FROM orders;

SELECT COUNT(*) AS total_orders
FROM orders;

INSERT INTO order_items
(order_id, product_id, quantity, price, discount)
VALUES
(1, 1, 1, 50000, 5),
(1, 4, 2, 900, 0),
(2, 5, 1, 500, 0),
(3, 2, 1, 20000, 10),
(4, 3, 2, 10000, 5),
(5, 8, 3, 180, 0),
(6, 6, 1, 4500, 0),
(7, 10, 2, 2000, 5),
(8, 9, 1, 8500, 0),
(9, 7, 1, 7500, 10),
(10, 14, 5, 250, 0),
(11, 1, 1, 50000, 0),
(12, 11, 1, 3500, 0),
(13, 12, 2, 1400, 5),
(14, 13, 1, 16000, 10),
(15, 15, 1, 2800, 0),
(16, 2, 2, 20000, 5),
(17, 4, 3, 900, 0),
(18, 5, 2, 500, 0),
(19, 6, 2, 4500, 5),
(20, 7, 1, 7500, 0),
(21, 8, 10, 180, 0),
(22, 9, 1, 8500, 5),
(23, 10, 1, 2000, 0),
(24, 3, 1, 10000, 0),
(25, 13, 1, 16000, 5),
(2, 4, 1, 900, 0),
(4, 5, 2, 500, 0),
(6, 8, 4, 180, 0),
(10, 14, 2, 250, 0);
SELECT COUNT(*) AS total_order_items
FROM order_items;

SELECT * FROM order_items;
INSERT INTO payments
(order_id, payment_date, payment_method, payment_status, amount)
VALUES
(1, '2025-01-05', 'UPI', 'Paid', 52600),
(2, '2025-01-10', 'Card', 'Paid', 1400),
(3, NULL, 'UPI', 'Pending', 18000),
(4, '2025-01-20', 'Card', 'Paid', 20000),
(5, NULL, 'UPI', 'Failed', 540),
(6, '2025-02-08', 'Cash', 'Paid', 5220),
(7, NULL, 'Card', 'Pending', 3800),
(8, '2025-02-18', 'Net Banking', 'Paid', 8500),
(9, '2025-03-03', 'Card', 'Refunded', 6750),
(10, '2025-03-09', 'UPI', 'Paid', 1700),
(11, '2025-03-15', 'Card', 'Paid', 50000),
(12, NULL, 'UPI', 'Pending', 3500),
(13, '2025-04-01', 'Cash', 'Paid', 2660),
(14, '2025-04-07', 'Card', 'Paid', 14400),
(15, NULL, 'UPI', 'Pending', 2800),
(16, '2025-04-18', 'UPI', 'Paid', 38000),
(17, '2025-05-02', 'Cash', 'Paid', 2700),
(18, NULL, 'Card', 'Failed', 1000),
(19, '2025-05-14', 'Card', 'Paid', 8550),
(20, '2025-05-20', 'UPI', 'Paid', 7500),
(21, NULL, 'UPI', 'Pending', 1800),
(22, '2025-06-10', 'Net Banking', 'Paid', 8075),
(23, '2025-06-16', 'Cash', 'Paid', 2000),
(24, '2025-06-22', 'Card', 'Refunded', 10000),
(25, '2025-06-28', 'UPI', 'Paid', 15200);
SELECT payment_status, COUNT(*) AS total
FROM payments
GROUP BY payment_status;
SELECT COUNT(*) AS customers FROM customers;
SELECT COUNT(*) AS products FROM products;
SELECT COUNT(*) AS employees FROM employees;
SELECT COUNT(*) AS orders_count FROM orders;
SELECT COUNT(*) AS order_items_count FROM order_items;
SELECT COUNT(*) AS payments_count FROM payments;
SELECT *
FROM customers
WHERE city = 'Kochi';
SELECT product_name, selling_price
FROM products
WHERE selling_price > 1000;
SELECT *
FROM orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-03-31';
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 25;
SELECT product_name, selling_price
FROM products
ORDER BY selling_price DESC
LIMIT 5;
SELECT *
FROM customers
WHERE customer_name LIKE 'A%';
SELECT *
FROM orders
WHERE order_status IN ('Pending', 'Processing');
SELECT product_name, selling_price
FROM products
ORDER BY selling_price DESC;
SELECT *
FROM customers
ORDER BY customer_id
LIMIT 5;
SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    ROUND(SUM(oi.quantity * oi.price * (1 - oi.discount / 100)), 2)
        AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

SELECT
    p.product_name,
    ROUND(SUM(oi.quantity * oi.price * (1 - oi.discount / 100)), 2)
        AS total_sales
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC
LIMIT 5;
SELECT ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(oi.quantity * oi.price * (1 - oi.discount / 100))
            AS order_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.order_id
) AS order_totals;
SELECT
    c.category_name,
    SUM(oi.quantity) AS total_units_sold
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.category_id, c.category_name
ORDER BY total_units_sold DESC;
SELECT
    r.region_name,
    o.sales_channel,
    ROUND(SUM(oi.quantity * oi.price * (1 - oi.discount / 100)), 2)
        AS total_sales
FROM regions r
JOIN customers c ON r.region_id = c.region_id
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY r.region_name, o.sales_channel
ORDER BY total_sales DESC;
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    ROUND(SUM(oi.quantity * oi.price * (1 - oi.discount / 100)), 2)
        AS order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY o.order_id, c.customer_name, o.order_date
ORDER BY order_value DESC
LIMIT 1;
SELECT
    e.employee_id,
    e.employee_name,
    ROUND(SUM(oi.quantity * oi.price * (1 - oi.discount / 100)), 2)
        AS total_sales
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY e.employee_id, e.employee_name
ORDER BY total_sales DESC;
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_units_purchased
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_units_purchased DESC
LIMIT 1;
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.order_status
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_date;
SELECT
    p.product_name,
    c.category_name
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
ORDER BY c.category_name, p.product_name;
SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

SELECT
    product_name,
    selling_price
FROM products
WHERE selling_price > (
    SELECT AVG(selling_price)
    FROM products
)
ORDER BY selling_price DESC;

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(
        SUM(oi.quantity * oi.price * (1 - oi.discount / 100)),
        2
    ) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_sales DESC;

SELECT
    c.customer_id,
    c.customer_name,
    COALESCE(SUM(
        CASE
            WHEN o.order_status = 'Delivered'
            THEN oi.quantity * oi.price * (1 - oi.discount / 100)
            ELSE 0
        END
    ), 0) AS total_purchases
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
HAVING total_purchases > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            c2.customer_id,
            COALESCE(SUM(
                CASE
                    WHEN o2.order_status = 'Delivered'
                    THEN oi2.quantity * oi2.price *
                         (1 - oi2.discount / 100)
                    ELSE 0
                END
            ), 0) AS customer_total
        FROM customers c2
        LEFT JOIN orders o2
            ON c2.customer_id = o2.customer_id
        LEFT JOIN order_items oi2
            ON o2.order_id = oi2.order_id
        GROUP BY c2.customer_id
    ) AS customer_totals
)
ORDER BY total_purchases DESC;

SELECT
    p.payment_id,
    o.order_id,
    c.customer_name,
    o.order_date,
    p.payment_date,
    p.payment_method,
    p.payment_status,
    p.amount
FROM payments p
JOIN orders o
    ON p.order_id = o.order_id
JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_id;

SELECT
    e.employee_id,
    e.employee_name,
    e.job_title
FROM employees e
LEFT JOIN orders o
    ON e.employee_id = o.employee_id
WHERE o.order_id IS NULL;

SELECT
    r.return_id,
    p.product_name,
    o.order_id,
    r.return_date,
    r.quantity AS returned_quantity,
    r.reason,
    r.refund_amount
FROM returns r
JOIN order_items oi
    ON r.order_item_id = oi.order_item_id
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
ORDER BY r.return_date;


WITH OrderValues AS (
    SELECT
        o.order_id,
        o.order_date,
        o.order_status,
        COALESCE(
            SUM(oi.quantity * oi.price * (1 - oi.discount / 100)),
            0
        ) AS order_value
    FROM orders o
    LEFT JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        o.order_id,
        o.order_date,
        o.order_status
)
SELECT
    order_id,
    order_date,
    order_status,
    ROUND(order_value, 2) AS order_value,
    CASE
        WHEN order_value < 10000 THEN 'Low'
        WHEN order_value < 50000 THEN 'Medium'
        ELSE 'High'
    END AS value_category
FROM OrderValues
ORDER BY order_value DESC;
WITH ProductSales AS (
    SELECT
        p.product_id,
        p.product_name,
        COALESCE(
            SUM(oi.quantity * oi.price * (1 - oi.discount / 100)),
            0
        ) AS total_sales
    FROM products p
    LEFT JOIN order_items oi
        ON p.product_id = oi.product_id
    LEFT JOIN orders o
        ON oi.order_id = o.order_id
        AND o.order_status = 'Delivered'
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_id,
    product_name,
    ROUND(total_sales, 2) AS total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM ProductSales
ORDER BY sales_rank;
SELECT
    c.customer_id,
    c.customer_name,
    MIN(o.order_date) AS first_order_date,
    MAX(o.order_date) AS most_recent_order_date,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY c.customer_id;
WITH MonthlySales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(
            oi.quantity * oi.price * (1 - oi.discount / 100)
        ) AS monthly_sales
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    sales_month,
    ROUND(monthly_sales, 2) AS monthly_sales,
    ROUND(
        SUM(monthly_sales) OVER (
            ORDER BY sales_month
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ), 2
    ) AS cumulative_sales
FROM MonthlySales
ORDER BY sales_month;
WITH MonthlySales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(
            oi.quantity * oi.price * (1 - oi.discount / 100)
        ) AS monthly_sales
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    sales_month,
    ROUND(monthly_sales, 2) AS monthly_sales,
    ROUND(
        LAG(monthly_sales) OVER (ORDER BY sales_month), 2
    ) AS previous_month_sales,
    ROUND(
        monthly_sales -
        LAG(monthly_sales) OVER (ORDER BY sales_month), 2
    ) AS sales_difference
FROM MonthlySales
ORDER BY sales_month;
WITH MonthlySales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(
            oi.quantity * oi.price * (1 - oi.discount / 100)
        ) AS monthly_sales
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
),
SalesComparison AS (
    SELECT
        sales_month,
        monthly_sales,
        LAG(monthly_sales) OVER (
            ORDER BY sales_month
        ) AS previous_month_sales
    FROM MonthlySales
)
SELECT
    sales_month,
    ROUND(monthly_sales, 2) AS monthly_sales,
    ROUND(previous_month_sales, 2) AS previous_month_sales,
    ROUND(
        100.0 * (monthly_sales - previous_month_sales)
        / NULLIF(previous_month_sales, 0),
        2
    ) AS percentage_change
FROM SalesComparison
ORDER BY sales_month;
WITH ProductQuantity AS (
    SELECT
        c.category_id,
        c.category_name,
        p.product_id,
        p.product_name,
        COALESCE(
            SUM(
                CASE
                    WHEN o.order_status = 'Delivered'
                    THEN oi.quantity
                    ELSE 0
                END
            ), 0
        ) AS total_quantity
    FROM categories c
    JOIN products p
        ON c.category_id = p.category_id
    LEFT JOIN order_items oi
        ON p.product_id = oi.product_id
    LEFT JOIN orders o
        ON oi.order_id = o.order_id
    GROUP BY
        c.category_id,
        c.category_name,
        p.product_id,
        p.product_name
),
ProductRanks AS (
    SELECT
        *,
        RANK() OVER (
            PARTITION BY category_id
            ORDER BY total_quantity DESC
        ) AS category_rank
    FROM ProductQuantity
)
SELECT
    category_name,
    product_name,
    total_quantity,
    category_rank
FROM ProductRanks
WHERE category_rank = 1
ORDER BY category_name;

WITH CustomerSpending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COALESCE(
            SUM(
                CASE
                    WHEN o.order_status = 'Delivered'
                    THEN oi.quantity * oi.price
                         * (1 - oi.discount / 100)
                    ELSE 0
                END
            ), 0
        ) AS total_spending
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    ROUND(total_spending, 2) AS total_spending
FROM CustomerSpending
WHERE total_spending > (
    SELECT AVG(total_spending)
    FROM CustomerSpending
)
ORDER BY total_spending DESC;
WITH ProductSales AS (
    SELECT
        p.product_id,
        p.product_name,
        COALESCE(
            SUM(
                CASE
                    WHEN o.order_status = 'Delivered'
                    THEN oi.quantity * oi.price
                         * (1 - oi.discount / 100)
                    ELSE 0
                END
            ), 0
        ) AS total_sales
    FROM products p
    LEFT JOIN order_items oi
        ON p.product_id = oi.product_id
    LEFT JOIN orders o
        ON oi.order_id = o.order_id
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_id,
    product_name,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(
        100.0 * total_sales
        / NULLIF(SUM(total_sales) OVER (), 0),
        2
    ) AS sales_contribution_percentage
FROM ProductSales
ORDER BY sales_contribution_percentage DESC;

WITH CustomerMetrics AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COUNT(
            DISTINCT CASE
                WHEN o.order_status = 'Delivered'
                THEN o.order_id
            END
        ) AS purchase_frequency,
        COALESCE(
            SUM(
                CASE
                    WHEN o.order_status = 'Delivered'
                    THEN oi.quantity * oi.price
                         * (1 - oi.discount / 100)
                    ELSE 0
                END
            ), 0
        ) AS total_spending
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    purchase_frequency,
    ROUND(total_spending, 2) AS total_spending,
    CASE
        WHEN purchase_frequency >= 3
             AND total_spending >= 30000
            THEN 'VIP Customer'
        WHEN purchase_frequency >= 2
            THEN 'Regular Customer'
        WHEN purchase_frequency = 1
            THEN 'Occasional Customer'
        ELSE 'No Delivered Purchases'
    END AS customer_segment
FROM CustomerMetrics
ORDER BY total_spending DESC;


SELECT 'Customers' AS table_name,
       COUNT(*) AS issue_count
FROM customers
WHERE customer_name IS NULL
   OR TRIM(customer_name) = ''
   OR city IS NULL
   OR TRIM(city) = ''
   OR email IS NULL
   OR TRIM(email) = ''

UNION ALL

SELECT 'Products', COUNT(*)
FROM products
WHERE product_name IS NULL
   OR TRIM(product_name) = ''
   OR cost IS NULL
   OR selling_price IS NULL
   OR stock_quantity IS NULL

UNION ALL

SELECT 'Orders', COUNT(*)
FROM orders
WHERE customer_id IS NULL
   OR order_date IS NULL
   OR order_status IS NULL
   OR sales_channel IS NULL

UNION ALL

SELECT 'Order Items', COUNT(*)
FROM order_items
WHERE order_id IS NULL
   OR product_id IS NULL
   OR quantity IS NULL
   OR price IS NULL
   OR discount IS NULL

UNION ALL

SELECT 'Payments', COUNT(*)
FROM payments
WHERE order_id IS NULL
   OR payment_method IS NULL
   OR payment_status IS NULL
   OR amount IS NULL;
SELECT *
FROM products
WHERE cost < 0
   OR selling_price < 0
   OR stock_quantity < 0;

SELECT *
FROM order_items
WHERE quantity <= 0
   OR price < 0
   OR discount < 0
   OR discount > 100;

SELECT *
FROM payments
WHERE amount < 0;

SELECT *
FROM returns
WHERE quantity <= 0
   OR refund_amount < 0;
SELECT
    LOWER(TRIM(email)) AS normalized_email,
    COUNT(*) AS duplicate_count
FROM customers
WHERE email IS NOT NULL
  AND TRIM(email) <> ''
GROUP BY LOWER(TRIM(email))
HAVING COUNT(*) > 1;
SELECT
    product_id,
    product_name,
    cost,
    selling_price,
    ROUND(selling_price - cost, 2) AS price_difference
FROM products
WHERE selling_price < cost
ORDER BY price_difference;
SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    price,
    discount
FROM order_items
WHERE quantity IS NULL
   OR quantity <= 0
   OR price IS NULL
   OR price < 0
   OR discount IS NULL
   OR discount < 0
   OR discount > 100;
   SELECT
    payment_id,
    order_id,
    payment_method,
    payment_status,
    amount
FROM payments
WHERE amount IS NULL
   OR amount < 0
   OR payment_method IS NULL
   OR payment_status IS NULL;
SELECT
    payment_id,
    order_id,
    payment_status,
    amount
FROM payments
WHERE (payment_status = 'Paid' AND amount <= 0)
   OR (payment_status IN ('Pending', 'Failed') AND amount > 0);
   SELECT o.order_id, o.customer_id, o.employee_id
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
LEFT JOIN employees e
    ON o.employee_id = e.employee_id
WHERE c.customer_id IS NULL
   OR (
       o.employee_id IS NOT NULL
       AND e.employee_id IS NULL
   );
   SELECT oi.*
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
LEFT JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_id IS NULL
   OR p.product_id IS NULL;
   SELECT p.*
FROM payments p
LEFT JOIN orders o
    ON p.order_id = o.order_id
WHERE o.order_id IS NULL;
SELECT p.product_id, p.product_name, p.category_id
FROM products p
LEFT JOIN categories c
    ON p.category_id = c.category_id
WHERE c.category_id IS NULL;

SELECT c.customer_id, c.customer_name, c.region_id
FROM customers c
LEFT JOIN regions r
    ON c.region_id = r.region_id
WHERE c.region_id IS NOT NULL
  AND r.region_id IS NULL;

SELECT e.employee_id, e.employee_name, e.region_id
FROM employees e
LEFT JOIN regions r
    ON e.region_id = r.region_id
WHERE e.region_id IS NOT NULL
  AND r.region_id IS NULL;
  SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.order_status,
    o.sales_channel
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
LEFT JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_id IS NULL
ORDER BY o.order_date;
WITH OrderTotals AS (
    SELECT
        o.order_id,
        o.order_status,
        COALESCE(
            SUM(
                oi.quantity * oi.price
                * (1 - oi.discount / 100)
            ), 0
        ) AS order_total
    FROM orders o
    LEFT JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.order_id, o.order_status
),
PaymentTotals AS (
    SELECT
        order_id,
        SUM(
            CASE
                WHEN payment_status = 'Paid'
                THEN amount
                ELSE 0
            END
        ) AS paid_total,
        COUNT(*) AS payment_record_count
    FROM payments
    GROUP BY order_id
)
SELECT
    ot.order_id,
    ot.order_status,
    ROUND(ot.order_total, 2) AS order_total,
    ROUND(COALESCE(pt.paid_total, 0), 2) AS paid_total,
    ROUND(
        ot.order_total - COALESCE(pt.paid_total, 0), 2
    ) AS difference,
    COALESCE(pt.payment_record_count, 0) AS payment_record_count
FROM OrderTotals ot
LEFT JOIN PaymentTotals pt
    ON ot.order_id = pt.order_id
WHERE ABS(
    ot.order_total - COALESCE(pt.paid_total, 0)
) > 0.01
ORDER BY ot.order_id;

SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    oi.quantity AS purchased_quantity,
    SUM(r.quantity) AS total_returned_quantity
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN returns r
    ON oi.order_item_id = r.order_item_id
GROUP BY
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    oi.quantity
HAVING SUM(r.quantity) > oi.quantity;
SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    oi.quantity AS purchased_quantity,
    COALESCE(SUM(r.quantity), 0) AS returned_quantity,
    oi.quantity - COALESCE(SUM(r.quantity), 0)
        AS remaining_quantity
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN returns r
    ON oi.order_item_id = r.order_item_id
GROUP BY
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    oi.quantity
ORDER BY oi.order_id, oi.order_item_id;

CREATE OR REPLACE VIEW vw_sales_summary AS
SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    c.customer_id,
    c.customer_name,
    ROUND(
        SUM(oi.quantity * oi.price * (1 - oi.discount / 100)),
        2
    ) AS order_total
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    o.order_date,
    o.order_status,
    c.customer_id,
    c.customer_name;
    SELECT *
FROM vw_sales_summary
ORDER BY order_date;
SELECT *
FROM vw_sales_summary
WHERE order_status = 'Delivered';
DROP PROCEDURE IF EXISTS sp_sales_report;

DELIMITER $$

CREATE PROCEDURE sp_sales_report(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT
        o.order_id,
        o.order_date,
        c.customer_name,
        ROUND(
            SUM(
                oi.quantity * oi.price
                * (1 - oi.discount / 100)
            ), 2
        ) AS order_total
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
      AND o.order_date >= start_date
      AND o.order_date < DATE_ADD(end_date, INTERVAL 1 DAY)
    GROUP BY
        o.order_id,
        o.order_date,
        c.customer_name
    ORDER BY o.order_date;
END $$

DELIMITER ;
CALL sp_sales_report('2025-01-01', '2025-06-30');
DROP FUNCTION IF EXISTS fn_discounted_item_value;

DELIMITER $$

CREATE FUNCTION fn_discounted_item_value(
    p_quantity INT,
    p_price DECIMAL(10,2),
    p_discount DECIMAL(5,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
NO SQL
BEGIN
    RETURN ROUND(
        p_quantity * p_price * (1 - p_discount / 100),
        2
    );
END $$

DELIMITER ;
SELECT fn_discounted_item_value(2, 1000.00, 10.00)
    AS discounted_value;
    SELECT
    order_item_id,
    quantity,
    price,
    discount,
    fn_discounted_item_value(quantity, price, discount)
        AS discounted_value
FROM order_items;
CREATE TABLE IF NOT EXISTS product_price_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    old_price DECIMAL(10,2) NOT NULL,
    new_price DECIMAL(10,2) NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_by VARCHAR(255)
);
DROP TRIGGER IF EXISTS trg_product_price_audit;

DELIMITER $$

CREATE TRIGGER trg_product_price_audit
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    IF NOT (OLD.selling_price <=> NEW.selling_price) THEN
        INSERT INTO product_price_audit (
            product_id,
            old_price,
            new_price,
            changed_by
        )
        VALUES (
            OLD.product_id,
            OLD.selling_price,
            NEW.selling_price,
            CURRENT_USER()
        );
    END IF;
END $$

DELIMITER ;
SELECT product_id, product_name, selling_price
FROM products
WHERE product_id = 1;
SELECT *
FROM product_price_audit
ORDER BY changed_at DESC;
CREATE TABLE IF NOT EXISTS transaction_demo (
    demo_id INT AUTO_INCREMENT PRIMARY KEY,
    demo_note VARCHAR(100) NOT NULL
);
START TRANSACTION;

INSERT INTO transaction_demo (demo_note)
VALUES ('Committed transaction example');

COMMIT;

SELECT * FROM transaction_demo;
START TRANSACTION;

INSERT INTO transaction_demo (demo_note)
VALUES ('Rolled back transaction example');

ROLLBACK;

SELECT * FROM transaction_demo;

CREATE INDEX idx_orders_status_date
ON orders (order_status, order_date);

CREATE INDEX idx_products_category_price
ON products (category_id, selling_price);

CREATE INDEX idx_payments_status_order
ON payments (payment_status, order_id);
EXPLAIN
SELECT order_id, order_date
FROM orders
WHERE order_status = 'Delivered'
  AND order_date >= '2025-01-01'
  AND order_date < '2025-07-01';
  EXPLAIN
SELECT product_id, product_name, selling_price
FROM products
WHERE category_id = 1
  AND selling_price > 1000;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM payments;
SELECT COUNT(*) FROM returns;
SELECT * FROM categories;

SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    o.sales_channel,
    c.customer_name,
    r.region_name,
    p.product_name,
    cat.category_name,
    oi.quantity,
    oi.price,
    oi.discount,
    (oi.quantity * oi.price * (1 - oi.discount / 100)) AS sales_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN regions r
    ON c.region_id = r.region_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
JOIN categories cat
    ON p.category_id = cat.category_id;

SELECT 'Regions' AS table_name, COUNT(*) AS total_records FROM regions
UNION ALL
SELECT 'Categories', COUNT(*) FROM categories
UNION ALL
SELECT 'Customers', COUNT(*) FROM customers
UNION ALL
SELECT 'Products', COUNT(*) FROM products
UNION ALL
SELECT 'Employees', COUNT(*) FROM employees
UNION ALL
SELECT 'Orders', COUNT(*) FROM orders
UNION ALL
SELECT 'Order Items', COUNT(*) FROM order_items
UNION ALL
SELECT 'Payments', COUNT(*) FROM payments
UNION ALL
SELECT 'Returns', COUNT(*) FROM returns;



