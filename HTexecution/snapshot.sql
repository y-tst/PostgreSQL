create view snapshot as
select
    students.name as student_name,
    students.surname as student_surname,
    subjects.subject_name,
    exam_results.mark
from
    students
    join exam_results on students.student_id = exam_results.student_id
    join subjects on subjects.subject_id = exam_results.subject_id;

-- The snapshot view is created using a SELECT statement that joins the 'students',
-- 'exam_results', and 'subjects' tables based on their corresponding foreign key relationships.
-- The columns selected include the student name, student surname, subject name,
-- and mark from the respective tables.

--After the view is created, we can query it like a table to retrieve the snapshot data:

SELECT * FROM snapshot;

-- The view acts as a virtual table that reflects the data at the time the snapshot was created.
-- It does not change when the source tables are updated, providing a consistent snapshot
-- of the desired data.

-- Snapshot view will not automatically update as the source tables change.
-- To update the snapshot, we need to recreate the view by re-executing
-- the CREATE VIEW statement.