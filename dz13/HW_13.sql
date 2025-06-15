-- 1 Выберите только те строки из таблицы suppliers где company имеет значение Supplier A

SELECT * FROM suppliers s 
WHERE company = 'Supplier A';


-- 2 Вывести все строки там, где purchase_order_id не указано. При этом дополнительно создать столбец total_price как произведение quantity * unit_price 
SELECT *, quantity * unit_price AS total_price
FROM order_details od 
WHERE purchase_order_id IS NULL;


-- 3 Выведите какая дата будет через 51 день 
SELECT CURDATE() + INTERVAL 51 DAY AS future_date;



-- 4 Посчитайте количество уникальных заказов purchase_order_id 
SELECT COUNT(DISTINCT purchase_order_id) AS unique_order_count
FROM order_details od;


-- 5 Выведите все столбцы таблицы order_details а также дополнительный столбец payment_method из таблицы purchase_orders Оставьте только заказы для которых известен payment_method
SELECT od.*, po.payment_method
FROM order_details od
JOIN purchase_orders po ON od.purchase_order_id = po.id
WHERE po.payment_method IS NOT NULL;