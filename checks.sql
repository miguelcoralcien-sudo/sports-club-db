-- 1. Активные абонементы (с датой окончания)
SELECT m.full_name, p.sub_type, p.end_date
FROM members m
JOIN payments p ON m.id = p.member_id
WHERE p.end_date >= date('now');

-- 2. Посещения по датам
SELECT visit_date, COUNT(member_id) AS people_count FROM visits GROUP BY visit_date;

-- 3. Тренеры и классы
SELECT t.full_name AS trainer, c.name AS class_name FROM trainers t LEFT JOIN classes c ON t.id = c.trainer_id;

-- 4. Давно не были
SELECT full_name FROM members WHERE id NOT IN (SELECT member_id FROM visits WHERE visit_date >= '2026-10-01');

-- 5. Топ-3 занятий (исправлена связь)
SELECT c.name, COUNT(v.id) AS visits_count 
FROM classes c 
LEFT JOIN visits v ON c.id = v.class_id 
GROUP BY c.name 
ORDER BY visits_count DESC LIMIT 3;

-- 6. Выручка по абонементам
SELECT sub_type, SUM(amount) AS total_income FROM payments GROUP BY sub_type;

-- 7. Младше 18
SELECT full_name, age FROM members WHERE age < 18;

-- 8. Общая выручка
SELECT SUM(amount) AS total_revenue FROM payments;

-- 9. Все участники
SELECT full_name, phone FROM members;

-- 10. ИСПРАВЛЕННЫЙ: Конфликты в расписании у ОДНОГО УЧАСТНИКА
SELECT m.full_name AS member, 
       s1.day_of_week, 
       s1.start_time AS time_1, s2.start_time AS time_2,
       c1.name AS class_1, c2.name AS class_2
FROM visits v1
JOIN visits v2 ON v1.member_id = v2.member_id AND v1.class_id != v2.class_id
JOIN classes c1 ON v1.class_id = c1.id
JOIN classes c2 ON v2.class_id = c2.id
JOIN schedule s1 ON c1.id = s1.class_id
JOIN schedule s2 ON c2.id = s2.class_id
JOIN members m ON v1.member_id = m.id
WHERE s1.day_of_week = s2.day_of_week
  AND s1.start_time < s2.end_time
  AND s2.start_time < s1.end_time;