
-- 9. Знайти список курсів, які відвідує студент
SELECT s.fullname, d.name 
FROM disciplines d
JOIN grades g ON d.id = g.discipline_id 
JOIN students s ON s.id = g.student_id 
WHERE s.id = 8  -- select teacher id
ORDER BY d.name
;

