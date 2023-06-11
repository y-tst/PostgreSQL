--sql:

-- Create students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    date_of_birth DATE,
    phone_number VARCHAR(20),
    primary_skill VARCHAR(255),
    created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create subjects table
CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(255),
    tutor VARCHAR(255)
);

-- Create exam_results table
CREATE TABLE exam_results (
    result_id SERIAL PRIMARY KEY,
    student_id INT,
    subject_id INT,
    mark DECIMAL(5, 2),
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects (subject_id)
);