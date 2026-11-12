-- Добавляем расписание занятий
CREATE TABLE schedule (
    id INTEGER PRIMARY KEY,
    class_id INTEGER,
    day_of_week TEXT,    -- Например, 'Понедельник'
    start_time TEXT,     -- Например, '18:00'
    end_time TEXT,       -- Например, '19:30'
    room TEXT,
    FOREIGN KEY (class_id) REFERENCES classes(id)
);

-- Связываем посещения с конкретным занятием
ALTER TABLE visits ADD COLUMN class_id INTEGER REFERENCES classes(id);