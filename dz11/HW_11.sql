
-- 1. Функция для расчета площади круга
DELIMITER //
CREATE FUNCTION circle_area(radius DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
 RETURN PI() * POWER(radius, 2);
END //
DELIMITER ;

SELECT circle_area (5);

-- 2. Функция для расчета гипотенузы треугольника
DELIMITER //
CREATE FUNCTION hypotenuse(a DOUBLE, b DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
 RETURN SQRT(POWER(a, 2) + POWER(b, 2));
END //
DELIMITER ;

SELECT hypotenuse (3, 4);