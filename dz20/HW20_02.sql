-- 4 Подключитесь к базе данных World (которая находится на удаленном сервере). 
USE world;

-- 5 Выведите среднее население в городах Индии (таблица City, код Индии - IND)
SELECT AVG(Population) AS avg_population
FROM city
WHERE CountryCode = 'IND';

-- 6 Выведите минимальное население в индийском городе и максимальное.
SELECT MIN(Population) AS min_population, MAX(Population) AS max_population
FROM city
WHERE CountryCode = 'IND';

-- 7 Выведите самую большую площадь территории. 
SELECT Name, SurfaceArea
FROM country
ORDER BY SurfaceArea DESC
LIMIT 1;

-- 8 Выведите среднюю продолжительность жизни по странам. 
SELECT Name, LifeExpectancy
FROM country
WHERE LifeExpectancy IS NOT NULL;

-- 9 Найдите самый населенный город (подсказка: использовать подзапросы)
SELECT Name, Population
FROM city
WHERE Population = (
    SELECT MAX(Population)
    FROM city
);