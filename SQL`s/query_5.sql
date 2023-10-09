
-- 5. Знайти які курси читає певний викладач

SELECT t.fullname, d.name  
FROM disciplines d
JOIN teachers t ON d.teacher_id  = t.id
--WHERE t.id = 1 -- вказати teachers id для вибору конкретного викладача
ORDER BY t.fullname 
;


