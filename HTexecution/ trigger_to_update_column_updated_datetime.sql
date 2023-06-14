CREATE OR REPLACE FUNCTION update_updated_datetime()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.* IS DISTINCT FROM NEW.* THEN
        NEW.updated_datetime := current_timestamp;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_student_updated_datetime
BEFORE UPDATE ON students
FOR EACH ROW
EXECUTE FUNCTION update_updated_datetime();


-- In this trigger function, the IF statement compares the entire old and new rows
-- using the IS DISTINCT FROM operator.
-- If there is any difference between the old and new rows, indicating that one or more
-- parameters have changed, then the 'updated_datetime' column is updated
-- with the current timestamp.

-- By using this trigger function, the 'updated_datetime' column will only be updated
-- for students whose parameters have actually changed during an update operation.

-- This trigger will still be triggered for every update on the 'students' table,
-- but the 'updated_datetime' column will only be updated when changes are detected.