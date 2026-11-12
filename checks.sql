-- 1. Активные абонементы
SELECT m.full_name, p.sub_type FROM members m JOIN payments p ON m.id = p.member_id WHERE p.payment_date LIKE '2026-11%';
-- 2. Посещения по датам
SELECT visit_date, COUNT(member_id) AS people_count FROM visits GROUP BY visit_date;
-- 3. Тренеры и классы
SELECT t.full_name AS trainer, c.name AS class_name FROM trainers t LEFT JOIN classes c ON t.id = c.trainer_id;
-- 4. Давно не были
SELECT full_name FROM members WHERE id NOT IN (SELECT member_id FROM visits WHERE visit_date >= '2026-10-01');
-- 5. Топ-3 занятий
SELECT c.name, COUNT(v.id) AS visits_count FROM classes c LEFT JOIN visits v ON c.id = v.id GROUP BY c.name ORDER BY visits_count DESC LIMIT 3;
-- 6. Выручка по абонементам
SELECT sub_type, SUM(amount) AS total_income FROM payments GROUP BY sub_type;
-- 7. Младше 18
SELECT full_name, age FROM members WHERE age < 18;
-- 8. Общая выручка
SELECT SUM(amount) AS total_revenue FROM payments;
-- 9. Все участники
SELECT full_name, phone FROM members;
