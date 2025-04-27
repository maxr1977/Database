-- 1. Выберите все строки из таблицы suppliers. Предварительно подключитесь к базе данных northwind
USE northwind;
SELECT 
    *
FROM
    suppliers;

-- 2. Выведите столбцы id, order_id из таблицы order_details, а также вычисляемый столбец category в зависимости от значений unit_price Если unit_price > 10 то значение столбца  category 'Expensive' В противном случае 'Cheap' Написать запрос двумя способами -  с применением операторов IF и CASE
-- 2.1: Первый способ
SELECT 
    id,
    order_id,
    CASE
        WHEN unit_price > 10 THEN 'Expensive'
        ELSE 'Cheap'
    END AS category
FROM
    order_details;
    
-- 2.2: Второй способ
SELECT 
    id,
    order_id,
    IF(unit_price > 10,
        'Expensive',
        'Cheap') AS category
FROM
    order_details;

-- 3. Вывести все строки там, где purchase_order_id не указано. При этом дополнительно создать столбец total_price как произведение quantity * unit_price
SELECT 
    *, (quantity * unit_price) AS total_price
FROM
    order_details
WHERE
    purchase_order_id IS NULL;

-- 4. Вывести один столбец из таблицы employees содержащий имя и фамилию написанные через пробел Вывести 3 строки начиная со второй
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    employees
ORDER BY full_name
LIMIT 3 OFFSET 1;

-- 5. На основе таблицы orders вывести один столбец - с годом и месяцем из order_date в формате 'год-месяц'
SELECT 
    LEFT(order_date, 7) AS date_year_month
FROM
    orders;

-- 6. Выведите уникальные имена компаний из таблицы customers Отсортируйте их по убыванию
SELECT DISTINCT
    company
FROM
    customers
ORDER BY company DESC;
