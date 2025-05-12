CREATE DATABASE students_db;
USE students_db;

-- Student table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT ,
    name VARCHAR(100) NOT NULL UNIQUE,
    student_email VARCHAR(100) UNIQUE,
    student_gender ENUM('Male', 'Female', 'Other'),
    student_dob DATE UNIQUE NOT NULL
);

-- Course table
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(150),
    credit_hours INT
);


-- Enrollment table 
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT NOT NULL,
    enroll_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Grade table
CREATE TABLE grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    marks DECIMAL(5,2),
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Attendance table
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    date DATE,
    status ENUM('Present', 'Absent', 'Late'),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
