--To analyze the performance and check the size of each index, you can use the ANALYZE and EXPLAIN commands along with the appropriate queries.


-- Analyze performance
ANALYZE students;
ANALYZE subjects;
ANALYZE exam_results;


-- Explain query using an index
EXPLAIN SELECT * FROM students WHERE name = 'John';

-- Check the size of an index
SELECT pg_size_pretty(pg_indexes_size('idx_students_name'));

--The ANALYZE command updates the statistics of the tables, allowing the query planner to make better decisions.
--The EXPLAIN command shows the query plan, including whether an index is being used. The pg_indexes_size function returns the size of an index.

--'idx_students_name' can be replaced with the actual index name we want to check.


--By analyzing the performance and checking the size of each index, we can assess their effectiveness and make informed decisions regarding index usage in your database.