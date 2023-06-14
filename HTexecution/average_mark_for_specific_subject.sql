CREATE OR REPLACE FUNCTION calculate_average_mark_by_subject(p_subject_name VARCHAR)
RETURNS NUMERIC AS $$
DECLARE
    total_marks NUMERIC;
    total_students INT;
    average_mark NUMERIC;
BEGIN
    SELECT
        SUM(mark)::NUMERIC,
        COUNT(DISTINCT student_id)
    INTO
        total_marks,
        total_students
    FROM
        subjects
        JOIN exam_results ON subjects.subject_id = exam_results.subject_id
    WHERE
        subjects.subject_name = p_subject_name;

    IF total_students > 0 THEN
        average_mark := total_marks / total_students;
    ELSE
        average_mark := 0;
    END IF;

    RETURN average_mark;
END;
$$ LANGUAGE plpgsql;



-- The function 'calculate_average_mark_by_subject' takes a subject name as input.
-- It calculates the total marks obtained by all students in the subject and the number
-- of distinct students who have taken the subject.
-- It then divides the total marks by the total students to calculate the average mark.

-- To use this function, we can execute a SQL query as follows:

SELECT calculate_average_mark_by_subject('Subject1');
