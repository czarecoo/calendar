CREATE TABLE deviation_date_changed (
    id INT PRIMARY KEY,
    new_start_datetime DATETIME NOT NULL,
    new_end_datetime DATETIME NOT NULL,
    CONSTRAINT deviation_date_changed_end_after_start CHECK (new_end_datetime > new_start_datetime)
);

CREATE TABLE deviation_cancelled (
    id INT PRIMARY KEY,
    cancellation_datetime DATETIME NOT NULL
);

CREATE TABLE deviation (
    id INT PRIMARY KEY,
    deviation_date_changed_id INT,
    deviation_cancelled_id INT,
    CONSTRAINT fk_deviation_date_changed FOREIGN KEY (deviation_date_changed_id) REFERENCES deviation_date_changed(id),
    CONSTRAINT fk_deviation_cancelled FOREIGN KEY (deviation_cancelled_id) REFERENCES deviation_cancelled(id),
    CONSTRAINT unique_deviation_date_changed UNIQUE (deviation_date_changed_id),
    CONSTRAINT unique_deviation_cancelled UNIQUE (deviation_cancelled_id),
    CONSTRAINT at_least_one_deviation_not_null CHECK (deviation_date_changed_id IS NOT NULL OR deviation_cancelled_id IS NOT NULL)
);

CREATE TABLE repetition_properties (
    id INT PRIMARY KEY,
    type VARCHAR(20) NOT NULL CHECK (type IN ('DAYS', 'WEEKS', 'MONTHS')),
    repeat_in INT NOT NULL CHECK (repeat_in > 0)
);

CREATE TABLE repetition_schedule (
    id INT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE,
    CONSTRAINT repetition_schedule_end_after_start CHECK (end_date IS NULL OR end_date > start_date)
);

CREATE TABLE repetition (
    id INT PRIMARY KEY,
    repetition_properties_id INT NOT NULL,
    repetition_schedule_id INT NOT NULL,
    CONSTRAINT fk_repetition_properties FOREIGN KEY (repetition_properties_id) REFERENCES repetition_properties(id),
    CONSTRAINT fk_repetition_schedule FOREIGN KEY (repetition_schedule_id) REFERENCES repetition_schedule(id),
    CONSTRAINT unique_repetition_properties UNIQUE (repetition_properties_id),
    CONSTRAINT unique_repetition_schedule UNIQUE (repetition_schedule_id)
);

CREATE TABLE appointment (
    id INT PRIMARY KEY,
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,
    repetition_id INT,
    deviation_id INT,
    CONSTRAINT fk_repetition FOREIGN KEY (repetition_id) REFERENCES repetition(id),
    CONSTRAINT fk_deviation FOREIGN KEY (deviation_id) REFERENCES deviation(id),
    CONSTRAINT unique_deviation_id UNIQUE (deviation_id),
    CONSTRAINT appointment_end_after_start CHECK (end_datetime > start_datetime)
);