-- Таблица order_details

-- 1 Для каждого product_id выведите inventory_id а также предыдущий и последующей inventory_id по убыванию quantity
SELECT
    product_id,
    inventory_id,
    quantity,
    LAG(inventory_id) OVER (PARTITION BY product_id ORDER BY quantity DESC) AS prev_inventory_id,
    LEAD(inventory_id) OVER (PARTITION BY product_id ORDER BY quantity DESC) AS next_inventory_id
FROM order_details;

-- 2 Выведите максимальный и минимальный unit_price для каждого order_id с помощью функции FIRST VALUE  Вывести order_id и полученные значения
SELECT DISTINCT
    order_id,
    FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price DESC) AS max_unit_price,
    FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price ASC) AS min_unit_price
FROM order_details;

-- 3 Выведите order_id и столбец с разнице между  unit_price для каждой заказа и минимальным unit_price в рамках одного заказа Задачу решить двумя способами - с помощью First VAlue и MIN

-- с помощью First VAlue
SELECT
    order_id,
    unit_price,
    unit_price - FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price ASC) AS diff_with_min_price
FROM order_details;

-- с помощью MIN
SELECT
    order_id,
    unit_price,
    unit_price - MIN(unit_price) OVER (PARTITION BY order_id) AS diff_with_min_price
FROM order_details;

-- 4 Присвойте ранг каждой строке используя RANK по убыванию quantity
SELECT
    *,
    RANK() OVER (ORDER BY quantity DESC) AS quantity_rank
FROM order_details;

-- 5  Из предыдущего запроса выберите только строки с рангом до 10 включительно
WITH ranked_orders AS (
    SELECT
        *,
        RANK() OVER (ORDER BY quantity DESC) AS quantity_rank
    FROM order_details
)
SELECT *
FROM ranked_orders
WHERE quantity_rank <= 10;