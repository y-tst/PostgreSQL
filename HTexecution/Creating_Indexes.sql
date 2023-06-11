--B-tree index on the name column of the students table:

CREATE INDEX idx_students_name ON students (name);



--Hash Index (not suitable for text fields like name):
--hash index on the student_id column of the students table:

CREATE INDEX idx_students_student_id_hash ON students USING HASH (student_id);



--GIN (Generalized Inverted Index) Index:
--GIN indexes are useful for handling complex data types like arrays and full-text search.

--There is no default operator class defined for the character varying data type when using the GIN (Generalized Inverted Index) access method.
--To resolve this issue, we to install the pg_trgm extension, which provides the necessary operator class for GIN indexes on text-like data types.

--GIN index on the primary_skill column of the students table:

CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE INDEX idx_students_primary_skill_gin ON students USING gin (primary_skill gin_trgm_ops);

--By specifying gin_trgm_ops as the operator class, we indicate that the GIN index should use the pg_trgm extension's operator class for the primary_skill column.



--GIST (Generalized Search Tree) Index:
--GIST indexes are versatile and can be used for various data types.

--There is no default operator class defined for the date data type when using the GIST (Generalized Search Tree) access method.
--To resolve this issue, we can install the btree_gist extension, which provides the necessary operator class for GIST indexes on the date data type.
--To create a GIST index on the date_of_birth column, we can use the date data type's default operator class for GIST indexes.

--GIST index on the date_of_birth column of the students table:

CREATE EXTENSION IF NOT EXISTS btree_gist;
CREATE INDEX idx_students_date_of_birth_gist ON students USING gist (date_of_birth);


--By specifying gist_btree_ops as the operator class, you indicate that the GIST index should use the btree_gist extension's operator class for the date_of_birth column.