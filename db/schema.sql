CREATE DATABASE icompass_db;


CREATE TABLE users(
    id SERIAL PRIMARY KEY, 
    first_name TEXT, 
    last_name TEXT,
    email TEXT,
    password_digest TEXT,
    role TEXT
);

ALTER TABLE users ADD COLUMN class TEXT;

ALTER TABLE users
RENAME COLUMN class TO home_class;

ALTER TABLE users
DROP COLUMN role,
DROP COLUMN home_class;

CREATE TABLE assignments(
    id SERIAL PRIMARY KEY,
    user_id INT,
    class_name TEXT,
    role TEXT
);

CREATE TABLE homework(
    id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    assigned_class TEXT
);

CREATE TABLE submissions(
    id SERIAL PRIMARY KEY,
    homework_id INT,
    student_id INT,
    answer TEXT,
    is_correct BOOLEAN
);