
-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів

SELECT s.fullname, ROUND(AVG(g.grade), 2) AS average_grade 
FROM grades g
JOIN students s ON s.id = g.student_id
GROUP BY s.fullname 
ORDER BY average_grade DESC 
LIMIT 5;


-- Знайти студента із найвищим середнім балом з певного предмета

SELECT d.name, s.fullname, ROUND(AVG(g.grade), 2) AS average_grade 
FROM grades g
JOIN students s ON s.id = g.student_id
JOIN disciplines d ON d.id = g.discipline_id 
WHERE d.id = 2  -- id предмета
GROUP BY d.name, s.fullname
ORDER BY average_grade DESC 
LIMIT 5;


-- Знайти середній бал у групах з певного предмета

SELECT d.name, gr.name, ROUND(AVG(g.grade), 2) AS average_grade 
FROM grades g
JOIN students s ON s.id = g.student_id
JOIN disciplines d ON d.id = g.discipline_id
JOIN [groups] gr ON gr.id = s.group_id
WHERE d.id = 6 --discipline id
GROUP BY gr.name, d.name
ORDER BY average_grade DESC;


--Знайти середній бал на потоці (по всій таблиці оцінок)

SELECT ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g;


-- Знайти які курси читає певний викладач

SELECT t.fullname, d.name  
FROM disciplines d
JOIN teachers t ON d.teacher_id  = t.id
--WHERE t.id = 1 -- вказати teachers id для вибору конкретного викладача
ORDER BY t.fullname 
;


-- Знайти список студентів у певній групі.
SELECT g.name, s.fullname  
FROM groups g
JOIN students s ON g.id = s.group_id
WHERE g.id = 2 -- вказати group_id для вибору конкретної групи
ORDER BY g.id, s.fullname 
;


-- Знайти оцінки студентів у окремій групі з певного предмета

SELECT g2.name, d.name, s.fullname, g.grade 
FROM grades g
JOIN disciplines d ON g.discipline_id = d.id
JOIN students s ON g.student_id = s.id
JOIN groups g2 ON s.group_id = g2.id 
WHERE g2.id = 1 AND d.id = 2 -- select group id and discipline id
ORDER BY s.fullname, g.grade DESC


-- Знайти середній бал, який ставить певний викладач зі своїх предметів

SELECT t.fullname, ROUND(AVG(g.grade), 2) AS average_grade 
FROM grades g
JOIN disciplines d ON g.discipline_id = d.id
JOIN teachers t ON d.teacher_id = t.id 
WHERE t.id = 4  -- select teacher id
;

-- Знайти список курсів, які відвідує студент
SELECT s.fullname, d.name 
FROM disciplines d
JOIN grades g ON d.id = g.discipline_id 
JOIN students s ON s.id = g.student_id 
WHERE s.id = 8  -- select teacher id
ORDER BY d.name
;

-- Список курсів, які певному студенту читає певний викладач

SELECT s.fullname AS Student, t.fullname AS Teacher, d.name AS Discipline 
FROM teachers t
JOIN disciplines d ON d.teacher_id = t.id 
JOIN grades g ON d.id = g.discipline_id 
JOIN students s ON g.student_id = s.id 
WHERE s.id = 30 AND t.id = 4  -- select teacher id and students id
ORDER BY d.name
;



