-- إنشاء قاعدة البيانات إذا لم تكن موجودة
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- استخدام قاعدة البيانات
USE alx_book_store;

-- إنشاء جدول المؤلفين
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,    -- معرف المؤلف (مفتاح أساسي)
    author_name VARCHAR(215) NOT NULL            -- اسم المؤلف
);

-- إنشاء جدول الكتب
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,       -- معرف الكتاب (مفتاح أساسي)
    title VARCHAR(130) NOT NULL,                  -- عنوان الكتاب
    author_id INT,                                -- معرف المؤلف (مفتاح خارجي)
    price DOUBLE NOT NULL,                        -- سعر الكتاب
    publication_date DATE,                        -- تاريخ النشر
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) -- علاقة مع جدول المؤلفين
);

-- إنشاء جدول العملاء
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,    -- معرف العميل (مفتاح أساسي)
    customer_name VARCHAR(215) NOT NULL,           -- اسم العميل
    email VARCHAR(215) NOT NULL,                   -- البريد الإلكتروني
    address TEXT NOT NULL                           -- العنوان
);

-- إنشاء جدول الطلبات
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,        -- معرف الطلب (مفتاح أساسي)
    customer_id INT,                                -- معرف العميل (مفتاح خارجي)
    order_date DATE NOT NULL,                       -- تاريخ الطلب
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) -- علاقة مع جدول العملاء
);

-- إنشاء جدول تفاصيل الطلب
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,   -- معرف تفاصيل الطلب (مفتاح أساسي)
    order_id INT,                                   -- معرف الطلب (مفتاح خارجي)
    book_id INT,                                    -- معرف الكتاب (مفتاح خارجي)
    quantity DOUBLE NOT NULL,                       -- الكمية المطلوبة
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),   -- علاقة مع جدول الطلبات
    FOREIGN KEY (book_id) REFERENCES Books(book_id)  -- علاقة مع جدول الكتب
);
