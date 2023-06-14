ALTER TABLE students
ADD CONSTRAINT check_student_name
CHECK (name !~* '[@$#]');


-- This ALTER TABLE statement adds a check constraint named 'check_student_name'
-- to the 'students' table.
-- The check constraint uses a regular expression pattern '!~*' to match the student name
-- against the special characters '@', '#', and '$'.
-- If any of these characters are found in the name, the constraint will be violated,
-- and the insertion or update will be rejected.

-- After executing this statement, any attempt to insert or update a student record
-- with a name containing '@', '#', or '$' will result in an error.
