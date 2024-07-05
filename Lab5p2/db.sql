CREATE USER 'A'@'%' IDENTIFIED BY 'B';
GRANT ALL PRIVILEGES ON *.* to 'A'@'%';

CREATE DATABASE student; 
USE student;

CREATE TABLE students (
    studentID INT NOT NULL AUTO_INCREMENT,
    studentName VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY(studentID)
);

INSERT INTO students (studentName, email) VALUES ("first student", "firststudent@mydomain.ie");
INSERT INTO students (studentName, email) VALUES ("second student", "secondstudent@mydomain.ie");
