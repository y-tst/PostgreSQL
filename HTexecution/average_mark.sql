CREATE OR REPLACE FUNCTION calculate_average_mark(student_name VARCHAR)
RETURNS DECIMAL(5, 2) AS $$
DECLARE
    total_marks DECIMAL(5, 2);
    total_subjects INT;
    average_mark DECIMAL(5, 2);
BEGIN
    SELECT
        SUM(mark),
        COUNT(DISTINCT subject_id)
    INTO
        total_marks,
        total_subjects
    FROM
        students
        JOIN exam_results ON students.student_id = exam_results.student_id
    WHERE
        students.name = student_name;

    IF total_subjects > 0 THEN
        average_mark := total_marks / total_subjects;
    ELSE
        average_mark := 0;
    END IF;

    RETURN average_mark;
END;
$$ LANGUAGE plpgsql;

-- The function 'calculate_average_mark' takes a student name as input.
-- It calculates the total marks obtained by the student and the number
-- of distinct subjects the student has appeared for.
-- It then divides the total marks by the total subjects to calculate the average mark.

--To use this function, you can execute a SQL query as follows:

SELECT calculate_average_mark('User1');
