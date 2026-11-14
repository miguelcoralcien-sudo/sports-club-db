CREATE TABLE members (id INTEGER PRIMARY KEY, full_name TEXT NOT NULL, email TEXT UNIQUE, age INTEGER CHECK (age >= 14), phone TEXT);
CREATE TABLE trainers (id INTEGER PRIMARY KEY, full_name TEXT NOT NULL, specialty TEXT);
CREATE TABLE classes (id INTEGER PRIMARY KEY, name TEXT NOT NULL, trainer_id INTEGER, capacity INTEGER CHECK (capacity > 0), FOREIGN KEY (trainer_id) REFERENCES trainers(id));
CREATE TABLE visits (id INTEGER PRIMARY KEY, member_id INTEGER, visit_date TEXT NOT NULL, FOREIGN KEY (member_id) REFERENCES members(id));
CREATE TABLE payments (id INTEGER PRIMARY KEY, member_id INTEGER, amount REAL NOT NULL, sub_type TEXT, payment_date TEXT, end_date TEXT, FOREIGN KEY (member_id) REFERENCES members(id));
CREATE INDEX idx_visits_member ON visits(member_id);
CREATE INDEX idx_classes_trainer ON classes(trainer_id);
ALTER TABLE visits ADD COLUMN class_id INTEGER REFERENCES classes(id);

-- Таблица расписания занятий
CREATE TABLE schedule (
    id INTEGER PRIMARY KEY,
    class_id INTEGER,
    day_of_week TEXT,
    start_time TEXT,
    end_time TEXT,
    room TEXT,
    FOREIGN KEY (class_id) REFERENCES classes(id)
);