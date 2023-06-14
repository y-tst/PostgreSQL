create or replace function update_updated_datetime()
RETURNS trigger AS $$
begin
    if OLD.* is DISTINCT FROM NEW.* then
        NEW.updated_datetime := current_timestamp;
    end if;
    return new;
end;
$$ LANGUAGE plpgsql;

create trigger update_student_updated_datetime
before update on students
for each row
EXECUTE function update_updated_datetime();

-- In this trigger function, the IF statement compares the entire old and new rows
-- using the IS DISTINCT FROM operator.
-- If there is any difference between the old and new rows, indicating that one or more
-- parameters have changed, then the 'updated_datetime' column is updated
-- with the current timestamp.

-- By using this trigger function, the 'updated_datetime' column will only be updated
-- for students whose parameters have actually changed during an update operation.

-- This trigger will still be triggered for every update on the 'students' table,
-- but the 'updated_datetime' column will only be updated when changes are detected.