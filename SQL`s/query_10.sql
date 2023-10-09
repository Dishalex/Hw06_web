
-- 10. Список курсів, які певному студенту читає певний викладач

SELECT s.fullname AS Student, t.fullname AS Teacher, d.name AS Discipline 
FROM teachers t
JOIN disciplines d ON d.teacher_id = t.id 
JOIN grades g ON d.id = g.discipline_id 
JOIN students s ON g.student_id = s.id 
WHERE s.id = 30 AND t.id = 4  -- select teacher id and students id
ORDER BY d.name
;



