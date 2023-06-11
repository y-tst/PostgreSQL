--a. Find user by name (exact match):

SELECT *
FROM students
WHERE name = 'User798';



--b. Find user by surname (partial match):

SELECT *
FROM students
WHERE surname LIKE '_ur%5%';



--c. Find user by phone number (partial match):

SELECT *
FROM students
WHERE phone_number LIKE '%954%';



--d. Find user with marks by user surname (partial match):

SELECT students.student_id, students.name, students.surname, exam_results.mark
FROM students
INNER JOIN exam_results ON students.student_id = exam_results.student_id
WHERE students.surname LIKE '%S%77%';