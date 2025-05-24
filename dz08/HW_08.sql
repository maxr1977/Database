-- 1 Найдите все записи таблицы Printer для цветных принтеров.
SELECT 
    *
FROM
    printer
WHERE
    color = 'y';

-- 2 Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
SELECT 
    p.model, pc.price
FROM
    product p
        JOIN
    pc pc ON p.model = pc.model
WHERE
    p.maker = 'B' 
UNION 
SELECT 
    p.model, l.price
FROM
    product p
        JOIN
    laptop l ON p.model = l.model
WHERE
    p.maker = 'B' 
UNION 
SELECT 
    p.model, pr.price
FROM
    product p
        JOIN
    printer pr ON p.model = pr.model
WHERE
    p.maker = 'B';

-- 3 Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT DISTINCT
    maker
FROM
    product
WHERE
    type = 'PC'
        AND maker NOT IN (SELECT DISTINCT
            maker
        FROM
            product
        WHERE
            type = 'Laptop');

-- 4 Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT
    maker
FROM
    product
        JOIN
    pc ON product.model = pc.model
WHERE
    speed >= 450;

-- 5 Найдите среднюю скорость ПК.
SELECT 
    AVG(speed) AS avg_speed
FROM
    pc;

-- 6 Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана.
SELECT 
    p.maker, AVG(l.screen) AS avg_screen
FROM
    product p
        JOIN
    laptop l ON p.model = l.model
GROUP BY p.maker;
