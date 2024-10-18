-- Specify the database to use
USE alx_book_store;

-- Query to get the full description of the 'books' table
SELECT 
    COLUMN_NAME AS 'Column Name',
    COLUMN_TYPE AS 'Column Type',
    IS_NULLABLE AS 'Is Nullable',
    COLUMN_DEFAULT AS 'Default Value',
    EXTRA AS 'Extra Info'
FROM 
    information_schema.COLUMNS
WHERE 
    TABLE_SCHEMA = 'alx_book_store' AND 
    TABLE_NAME = 'books';
