-- 1   Вывести названия продуктов таблица products, включая количество заказанных единиц quantity для каждого продукта таблица order_details. Решить задачу с помощью cte и подзапроса

-- cte
WITH order_summary AS (
    SELECT product_id, SUM(quantity) AS sum_quantity
    FROM order_details
    GROUP BY product_id
)
SELECT p.id, p.product_name, os.sum_quantity
FROM products p
LEFT JOIN order_summary os ON p.id = os.product_id;

-- подзапрос
SELECT 
    id,
    product_name,
    (SELECT 
            SUM(quantity)
        FROM
            order_details od
        WHERE
            od.product_id = p.id) AS sum_quantity
FROM
    products p;


-- 2  Найти все заказы таблица orders, сделанные после даты самого первого заказа клиента Lee таблица customers.
SELECT *
FROM orders
WHERE order_date > (
    SELECT MIN(o.order_date)
    FROM customers c
    JOIN orders o ON c.id = o.customer_id
    WHERE c.last_name = 'Lee'
);

-- возможно, запрос надо было делать сложнее, т.к. в таблице два человека с фамилией Lee. В запросе ищется не конкретный Lee, а первый кто делал заказ. В условии задачи нет конкретного уточнения. 
    
    
-- 3 Найти все продукты таблицы  products c максимальным target_level
SELECT *
FROM products
WHERE target_level = (
    SELECT MAX(target_level)
    FROM products
);