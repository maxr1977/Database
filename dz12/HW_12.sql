USE `131224_Rechyn`;

CREATE TABLE employees (
id INT PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR (100), 
age INT NOT NULL, 
salary DECIMAL(10,2) NOT NULL, 
department_id INT
);


DELIMITER $$

CREATE PROCEDURE add_employee (IN emp_name VARCHAR(100) ,IN emp_age INT, IN emp_salary DECIMAL(10,2),IN emp_department_id INT)
BEGIN
	INSERT INTO employees (name, age, salary, department_id)
		VALUES (emp_name, emp_age, emp_salary, emp_department_id);
END $$
DELIMITER ;

CALL add_employee('Ivan Petrov', 35, 80000, 1);
CALL add_employee('Anna Petrov', 34, 75000, 2);
CALL add_employee('Inna Petrov', 33, 64000, 3);
CALL add_employee('Egor Smirnov', 32, 76000, 3);
CALL add_employee('Aleksandr Ivanov', 31, 65000, 2);

-- 1 Вывести id департамента , в котором работает сотрудник, в зависимости от Id сотрудника
SELECT department_id 
FROM employees 
WHERE id = 4;

-- 2 Создайте хранимую процедуру get_employee_age, которая принимает id сотрудника (IN-параметр) и возвращает его возраст через OUT-параметр.
DELIMITER $$

CREATE PROCEDURE get_employee_age (
    IN emp_id INT,
    OUT emp_age INT
)
BEGIN
    SELECT age INTO emp_age
    FROM employees
    WHERE id = emp_id;
END $$

DELIMITER ;

CALL get_employee_age(3, @age);
SELECT @age;

-- 3 Создайте хранимую процедуру increase_salary, которая принимает зарплату сотрудника (INOUT-параметр) и уменьшает ее на 10%.
DELIMITER $$

CREATE PROCEDURE increase_salary (INOUT emp_salary DECIMAL(10,2))
BEGIN
    SET emp_salary = emp_salary * 0.9;
END $$

DELIMITER ;

SET @salary = 80000;
CALL increase_salary(@salary);
SELECT @salary;