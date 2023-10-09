

-- 7. Знайти оцінки студентів у окремій групі з певного предмета

SELECT g2.name, d.name, s.fullname, g.grade 
FROM grades g
JOIN disciplines d ON g.discipline_id = d.id
JOIN students s ON g.student_id = s.id
JOIN groups g2 ON s.group_id = g2.id 
WHERE g2.id = 1 AND d.id = 2 -- select group id and discipline id
ORDER BY s.fullname, g.grade DESC
;


