INSERT INTO deviation_date_changed (id, new_start_datetime, new_end_datetime) VALUES
(1, '2024-02-16 08:00:00', '2024-02-16 17:00:00'),
(2, '2024-02-17 09:30:00', '2024-02-17 18:30:00'),
(3, '2024-02-18 07:45:00', '2024-02-18 16:45:00');

INSERT INTO deviation_cancelled (id, cancellation_datetime) VALUES
(1, '2024-02-16 11:20:00'),
(2, '2024-02-17 14:10:00'),
(3, '2024-02-18 10:05:00');

INSERT INTO deviation (id, deviation_date_changed_id, deviation_cancelled_id) VALUES
(1, 1, NULL),
(2, NULL, 1),
(3, 2, NULL);

INSERT INTO repetition_properties (id, type, frequency) VALUES
(1, 'DAILY', 1),
(2, 'WEEKLY', 2),
(3, 'MONTHLY', 1);

INSERT INTO repetition_schedule (id, start_date, end_date, count) VALUES
(1, '2024-02-15', '2024-02-15', NULL),
(2, '2024-02-15', NULL, NULL),
(3, NULL, NULL, 20);

INSERT INTO repetition (id, repetition_properties_id, repetition_schedule_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO appointment (id, start_datetime, end_datetime, repetition_id, deviation_id) VALUES
(1, '2024-02-15 09:00:00', '2024-02-15 10:00:00', 1, 1),
(2, '2024-02-16 09:00:00', '2024-02-16 10:00:00', 1, NULL),
(3, '2024-02-17 09:00:00', '2024-02-17 10:00:00', 1, NULL),
(4, '2024-02-15 09:00:00', '2024-02-15 10:00:00', 2, NULL),
(5, '2024-02-16 09:00:00', '2024-02-16 10:00:00', NULL, 2),
(6, '2024-02-17 09:00:00', '2024-02-17 10:00:00', NULL, NULL);

INSERT INTO appointment (id, start_datetime, end_datetime, repetition_id, deviation_id) VALUES
(7, '2024-02-14 09:00:00', '2024-02-16 10:00:00', NULL, NULL)