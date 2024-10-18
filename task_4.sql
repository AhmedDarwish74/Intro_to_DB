-- Specify the database to use
USE alx_book_store;

-- Get the description of the 'books' table
SELECT 
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT,
    EXTRA
FROM 
    information_schema.COLUMNS
WHERE 
    TABLE_NAME = 'Books'
    AND TABLE_SCHEMA = 'alx_book_store';
