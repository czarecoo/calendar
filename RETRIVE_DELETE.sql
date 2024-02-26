-- get appointments (day, month, year)
SELECT *
FROM appointment a
LEFT JOIN deviation d ON a.deviation_id = d.id
LEFT JOIN deviation_date_changed ddc ON ddc.id = d.deviation_date_changed_id
WHERE 
	(ddc.new_start_datetime IS NOT NULL AND 
	ddc.new_end_datetime IS NOT NULL AND 
	DATE(ddc.new_start_datetime) <= '2024-02-16' AND 
	DATE(ddc.new_end_datetime) >= '2024-02-16')
OR 
	(ddc.new_start_datetime IS NULL AND 
	ddc.new_end_datetime IS NULL AND 
	DATE(a.start_datetime) <= '2024-02-16' AND 
	DATE(a.end_datetime) >= '2024-02-16');
  
-- delete all connected appointments and every repetition and deviation connected to them
DELETE appointment, deviation, repetition_properties, repetition_schedule, repetition, deviation_date_changed, deviation_cancelled
FROM appointment
LEFT JOIN repetition ON appointment.repetition_id = repetition.id
LEFT JOIN deviation ON appointment.deviation_id = deviation.id
LEFT JOIN repetition_properties ON repetition.repetition_properties_id = repetition_properties.id
LEFT JOIN repetition_schedule ON repetition.repetition_schedule_id = repetition_schedule.id
LEFT JOIN deviation_date_changed ON deviation.deviation_date_changed_id = deviation_date_changed.id
LEFT JOIN deviation_cancelled ON deviation.deviation_cancelled_id = deviation_cancelled.id
WHERE repetition.id IN (
    SELECT repetition_id
    FROM (SELECT * FROM appointment) AS appointment_temp
    WHERE id = 1
);