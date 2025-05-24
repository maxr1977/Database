-- 1. Таблица purchase_order_details. Для каждого заказа purchase_order_id выведите минимальный, максмальный и средний unit_cost
SELECT 
    purchase_order_id,
    MIN(unit_cost) OVER (PARTITION BY purchase_order_id) AS min_unit_cost,
    MAX(unit_cost) OVER (PARTITION BY purchase_order_id) AS max_unit_cost,
    AVG(unit_cost) OVER (PARTITION BY purchase_order_id) AS avg_unit_cost
FROM purchase_order_details;


-- 2  Оставьте только уникальные строки из предыдущего запроса
SELECT DISTINCT
    purchase_order_id,
    MIN(unit_cost) OVER (PARTITION BY purchase_order_id) AS min_unit_cost,
    MAX(unit_cost) OVER (PARTITION BY purchase_order_id) AS max_unit_cost,
    AVG(unit_cost) OVER (PARTITION BY purchase_order_id) AS avg_unit_cost
FROM purchase_order_details;


-- 3 Посчитайте стоимость продукта в заказе как quantity*unit_cost Выведите суммарную стоимость продуктов с помощью оконной функции Сделайте то же самое с помощью GROUP BY

-- с помощью оконной функции
SELECT
    purchase_order_id, 
    quantity, unit_cost,
    quantity * unit_cost AS product_cost,
    SUM(quantity * unit_cost) OVER (PARTITION BY purchase_order_id) AS total_order_cost
FROM purchase_order_details;

-- с помощью GROUP BY
SELECT 
    purchase_order_id,
    quantity,
    unit_cost,
    quantity * unit_cost AS product_cost,
    SUM(quantity * unit_cost) AS total_order_cost
FROM
    purchase_order_details
GROUP BY purchase_order_id;


-- 4 Посчитайте количество заказов по дате получения и posted_to_inventory Если оно превышает 1 то выведите '>1' в противном случае '=1'. Выведите purchase_order_id, date_received и вычисленный столбец
SELECT
    purchase_order_id,
    date_received,
    CASE
        WHEN COUNT(*) OVER (PARTITION BY date_received, posted_to_inventory) > 1 THEN '>1'
        ELSE '=1'
    END AS order_count_status
FROM purchase_order_details;

