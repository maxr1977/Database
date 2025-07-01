-- 1 Подключитесь к базе данных hr (которая находится на удаленном сервере).
USE hr;

-- 2 Выведите количество сотрудников в базе
SELECT COUNT(*) AS total_employees FROM employees;

-- 3 Выведите количество департаментов (отделов) в базе
SELECT COUNT(*) AS total_departments FROM departments;



