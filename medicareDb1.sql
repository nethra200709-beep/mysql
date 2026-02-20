CREATE DATABASE MediCareDB1;
USE MediCareDB1;
CREATE TABLE Doctors (DoctorID INT PRIMARY KEY,DoctorName VARCHAR(100) NOT NULL,Specialization VARCHAR(50),ConsultationFee DECIMAL(7,2) CHECK (ConsultationFee > 0),ExperienceYears INT CHECK (ExperienceYears >= 0));
DESC Doctors;
CREATE TABLE Patients (PatientID INT PRIMARY KEY,FirstName VARCHAR(50) NOT NULL,LastName VARCHAR(50),Email VARCHAR(100) UNIQUE,RegistrationDate DATE DEFAULT (curdate()));
ALTER TABLE Doctors
ADD AvailabilityStatus VARCHAR(20) DEFAULT 'Available';
ALTER TABLE Patients
MODIFY Email VARCHAR(255);
ALTER TABLE Doctors
DROP COLUMN Specialization;
INSERT INTO Doctors (DoctorID, DoctorName, ConsultationFee, ExperienceYears, AvailabilityStatus)VALUES (301, 'Dr. Arjun Rao', 800.00, 12, 'Available');
INSERT INTO Doctors (DoctorID, DoctorName, ConsultationFee, ExperienceYears, AvailabilityStatus)VALUES (302, 'Dr. Meena Iyer', 600.00, 8, 'Available'),(303, 'Dr. Karthik Kumar', 750.00, 10, 'Unavailable');    
INSERT INTO Patients (PatientID, FirstName, LastName, Email)VALUES (1, 'Ravi', 'Shankar', 'ravi.shankar@medicare.com');
SELECT * FROM Doctors WHERE ConsultationFee > 700;
UPDATE Doctors SET AvailabilityStatus = 'Available' WHERE DoctorID = 303;
UPDATE Doctors SET ConsultationFee = 650.00,ExperienceYears = 9 WHERE DoctorName = 'Dr. Meena Iyer';
DELETE FROM Patients WHERE PatientID = 1;
SELECT * FROM Doctors WHERE ConsultationFee > 700;
SELECT DoctorID, DoctorName, ConsultationFee FROM Doctors WHERE ExperienceYears > 5;
SELECT * FROM Doctors WHERE AvailabilityStatus = 'Available';
SELECT DoctorName, ExperienceYears FROM Doctors WHERE ExperienceYears BETWEEN 8 AND 12;
SELECT * FROM Doctors WHERE ConsultationFee <= 650;
SELECT DoctorID, DoctorName FROM Doctors WHERE DoctorName LIKE 'Dr. M%'; SELECT * FROM Doctors WHERE ConsultationFee <> 800;
SELECT DoctorName, ConsultationFee FROM Doctors WHERE ExperienceYears = 10;
SELECT * FROM Patients WHERE Email = 'ravi.shankar@medicare.com';
SELECT FirstName, LastName FROM Patients WHERE RegistrationDate = CURRENT_DATE;