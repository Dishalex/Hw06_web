
-- 6. Знайти список студентів у певній групі.
SELECT g.name, s.fullname  
FROM groups g
JOIN students s ON g.id = s.group_id
WHERE g.id = 2 -- вказати group_id для вибору конкретної групи
ORDER BY g.id, s.fullname 
;


