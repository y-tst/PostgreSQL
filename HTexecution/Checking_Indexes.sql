SELECT indexname, tablename
FROM pg_indexes
WHERE schemaname = 'public';