CREATE OR REPLACE FUNCTION get_red_zone_students()
RETURNS TABLE (student_id INT, name VARCHAR, surname VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT
        students.student_id,
        students.name,
        students.surname
    FROM
        students
        JOIN exam_results ON students.student_id = exam_results.student_id
    WHERE
        exam_results.mark <= 45
    GROUP BY
        students.student_id, students.name, students.surname
    HAVING
        COUNT(exam_results.mark <= 45) >= 2;
END;
$$ LANGUAGE plpgsql;

-- The function named get_red_zone_students that returns a table containing the student_id,
-- name, and surname of students in the "red zone."
-- The function uses a JOIN between the students and exam_results tables to retrieve
-- the necessary information. It then filters the results to include only those students
-- who have at least two marks less than or equal to 45.

-- To use this function and retrieve the list of students in the "red zone,"
-- we can execute the following query:

SELECT * FROM get_red_zone_students();
