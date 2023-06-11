--Insert 100,000 users:
INSERT INTO students (name, surname, date_of_birth, phone_number, primary_skill)
SELECT
    'User' || generate_series(1, 100000),
    'Surname' || generate_series(1, 100000),
    '1990-01-01'::date + ((random() * 7300)::int || ' days')::interval,
    '123456789' || lpad((random() * 9999)::int::text, 4, '0'),
    'Skill' || (random() * 10)::int
FROM generate_series(1, 100000);

--Insert 1,000 subjects:
INSERT INTO subjects (subject_name, tutor)
SELECT
    'Subject' || generate_series(1, 1000),
    'Tutor' || (random() * 100)::int
FROM generate_series(1, 1000);

--Insert 1 million marks (randomly assigning a student and subject):
INSERT INTO exam_results (student_id, subject_id, mark)
SELECT
    students.student_id,
    subjects.subject_id,
    (random() * 100)::numeric(5, 2)
FROM
    students
CROSS JOIN
    subjects
LIMIT 1000000;
