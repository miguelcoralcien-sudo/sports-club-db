INSERT INTO members (id, full_name, email, age, phone) VALUES (1, 'Иван Петров', 'ivan@mail.ru', 25, '89001112233'), (2, 'Мария Сидорова', 'maria@mail.ru', 30, '89004445566'), (3, 'Алексей Смирнов', 'alex@mail.ru', 17, '89007778899'), (4, 'Елена Козлова', 'elena@mail.ru', 22, '89001231231');
INSERT INTO trainers (id, full_name, specialty) VALUES (1, 'Ольга Соколова', 'Йога'), (2, 'Дмитрий Орлов', 'Бокс');
INSERT INTO classes (id, name, trainer_id, capacity) VALUES (1, 'Утренняя йога', 1, 15), (2, 'Бокс для начинающих', 2, 10), (3, 'Растяжка', 1, 12);
INSERT INTO visits (id, member_id, visit_date) VALUES (1, 1, '2026-11-01'), (2, 2, '2026-11-02'), (3, 1, '2026-11-03'), (4, 3, '2026-09-15'), (5, 4, '2026-11-05');
INSERT INTO payments (id, member_id, amount, sub_type, payment_date) VALUES (1, 1, 3000, 'Месяц', '2026-10-01'), (2, 2, 25000, 'Год', '2026-10-15'), (3, 3, 3000, 'Месяц', '2026-09-01'), (4, 4, 3000, 'Месяц', '2026-11-01');
