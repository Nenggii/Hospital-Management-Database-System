-------------------------------------------------------
--================| Create Database |================--

-- CREATE DATABASE NAMED HOSPITAL
CREATE DATABASE Hospital;

-- SWITCH TO HOSPITAL DATABASE
USE Hospital;

-------------------------------------------------------
--=============| Create Patients Table |=============--

-- CREATE A TABLE FOR ALL PATIENTS INFORMATION
CREATE TABLE Patients (
	Patient_id INT PRIMARY KEY IDENTITY,
	First_name VARCHAR(50) NOT NULL,
	Last_name VARCHAR(50) NOT NULL,
	Address VARCHAR(255) NOT NULL,
	Date_of_birth DATE NOT NULL,
	Insurance VARCHAR(100) NOT NULL,
	Username VARCHAR(50) NOT NULL UNIQUE,
	Password VARCHAR(100) NOT NULL,
	Email_address VARCHAR(100) NULL UNIQUE,
	Phone_number VARCHAR(20) NULL,
	Date_left DATE NULL
);

SELECT *
FROM Patients;

-------------------------------------------------------
--=============| Create Departments Table |=============--

CREATE TABLE Departments (
	Department_id INT PRIMARY KEY IDENTITY,
	Department_name VARCHAR(100) NOT NULL UNIQUE
);

SELECT *
FROM Departments;

-------------------------------------------------------
--=============| Create Doctors Table |=============--

CREATE TABLE Doctors (
	Doctor_id INT PRIMARY KEY IDENTITY,
	First_name VARCHAR(50) NOT NULL,
	Last_name VARCHAR(50) NOT NULL,
	Department_id INT NOT NULL,
	FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);

SELECT *
FROM Doctors;

-------------------------------------------------------
--=============| Create Appointments Table |=============--

CREATE TABLE Appointments (
	Appointment_id INT PRIMARY KEY IDENTITY,
	Patient_id INT NOT NULL,
	Doctor_id INT NOT NULL,
	Department_id INT NOT NULL,
	Appointment_date DATE NOT NULL,
	Appointment_time TIME NOT NULL,
	Status VARCHAR(20) NOT NULL,
	Patient_review VARCHAR(MAX),
	-- Define Foreign Keys
	FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
	FOREIGN KEY (Doctor_id) REFERENCES Doctors(Doctor_id),
	FOREIGN KEY (Department_id) REFERENCES Departments(Department_id),
	-- Define Check Constraint
	CHECK (Status IN ('pending', 'cancelled', 'completed'))
);


SELECT *
FROM Appointments;

-------------------------------------------------------
--=============| Create Medical Records Table |=============--

CREATE TABLE MedicalRecords (
	MedicalRecord_id INT PRIMARY KEY IDENTITY,
	Appointment_id INT NOT NULL,
	Diagnosis NVARCHAR(MAX) NOT NULL,
	Allergies NVARCHAR(MAX) NULL,
	Medicines_prescribed NVARCHAR(MAX) NULL,
	Prescription_date DATE NULL,
	FOREIGN KEY (Appointment_id) REFERENCES Appointments(Appointment_id)
);

SELECT *
FROM MedicalRecords;

-------------------------------------------------------
--=============| POPULATING THE PATIENT TABLES  |=============--

-- Insert patient records intoo the Patient Table
INSERT INTO Patients (First_name, Last_name, Address, Date_of_birth, Insurance, Username, Password, Email_address, Phone_number, Date_left)
VALUES
    ('Tunde', 'Adeyemi', '15 Adebayo St, Lagos', '1990-05-15', 'NHIS', 'tunde_a', 'hashedpass1', 'tunde.a@email.com', '08012345678', NULL),
    ('Chiamaka', 'Okoro', '44 Ikoyi Rd, Lagos', '1988-08-22', 'Hygeia HMO', 'chi_ok', 'hashedpass2', 'chi.ok@email.com', '07098765432', NULL),
    ('Kenechukwu', 'Eze', '90 Trans Amadi, Port Harcourt', '1995-11-03', 'Axa Mansard', 'kene.eze', 'hashedpass3', 'kene.e@email.com', '09011223344', NULL),
    ('Fatima', 'Danjuma', '5 Abuja Cres, Kano', '1982-03-10', 'Reliance Health', 'fatima_d', 'hashedpass4', 'fatima.d@email.com', NULL, NULL),
    ('Babatunde', 'Oladipo', '22 Bode Thomas, Lagos', '1975-07-28', 'NHIS', 'baba_ola', 'hashedpass5', 'baba.o@email.com', '08123456789', NULL),
    ('Aminu', 'Mohammed', '8 Garki Rd, Abuja', '1992-04-18', 'Hygeia HMO', 'aminum', 'hashedpass6', 'am.mo@email.com', '08056789012', NULL),
    ('Adetola', 'Folarin', '35 Jibowu St, Lagos', '1998-09-07', 'Axa Mansard', 'ade_fola', 'hashedpass7', 'ade.f@email.com', '07034567890', NULL),
    ('Uche', 'Nwankwo', '6 P.H. Rd, Enugu', '1979-12-30', 'Reliance Health', 'uche_n', 'hashedpass8', 'uche.n@email.com', '09055667788', NULL),
    ('Sadiq', 'Ibrahim', '55 Wuse II, Abuja', '1987-06-14', 'NHIS', 'sadiq_i', 'hashedpass9', 'sadiq.i@email.com', '08177889900', NULL),
    ('Funmilayo', 'Bello', '12 Awolowo Way, Lagos', '1991-01-20', 'Hygeia HMO', 'funmi_b', 'hashedpass10', 'funmi.b@email.com', '08022334455', NULL),
    ('Ifeanyi', 'Okafor', '7 Calabar St, Onitsha', '1984-08-05', 'Axa Mansard', 'ifeanyi_o', 'hashedpass11', 'ife.o@email.com', '07045678901', '2025-06-10'),
    ('Habiba', 'Aliyu', '3 Kaduna Rd, Kaduna', '1996-02-28', 'Reliance Health', 'habiba_a', 'hashedpass12', 'habiba.a@email.com', '09066778899', NULL),
    ('Adewale', 'Bakare', '18 Lekki, Lagos', '1970-10-17', 'NHIS', 'wale_b', 'hashedpass13', 'wale.b@email.com', NULL, NULL),
    ('Onyeka', 'Nnamdi', '20 Enugu St, Enugu', '1993-04-09', 'Hygeia HMO', 'onyeka_n', 'hashedpass14', 'onye.n@email.com', '08088990011', NULL),
    ('Ayodeji', 'Lawal', '9 Victoria Island, Lagos', '1986-07-21', 'Axa Mansard', 'ayo_lawal', 'hashedpass15', 'ayo.l@email.com', '07012345678', NULL),
    ('Chioma', 'Adewale', '11 Benin Rd, Benin City', '1997-03-05', 'Reliance Health', 'chioma_a', 'hashedpass16', 'chi.ad@email.com', '08134567890', '2025-07-20'),
    ('Ngozi', 'Ibe', '4 Aba Rd, Port Harcourt', '1989-11-12', 'NHIS', 'ngozi_i', 'hashedpass17', 'ngozi.i@email.com', '09045678901', NULL),
    ('Ibrahim', 'Yakubu', '25 Kano St, Kano', '1981-06-02', 'Hygeia HMO', 'ibrahim_y', 'hashedpass18', 'ibrahim.y@email.com', NULL, NULL),
    ('Funke', 'Alabi', '33 Surulere, Lagos', '1994-09-19', 'Axa Mansard', 'funke_a', 'hashedpass19', 'funke.a@email.com', '08078901234', NULL),
    ('Emeka', 'Chukwu', '7 Old Aba Rd, Enugu', '1978-01-08', 'Reliance Health', 'emeka_c', 'hashedpass20', 'emeka.c@email.com', '08167890123', NULL);

SELECT *
FROM Patients

-------------------------------------------------------
--=============| POPULATING THE DEPARTMENT TABLE  |=============--

-- Insert data into the Departments table
INSERT INTO Departments (Department_name)
VALUES
    ('Cardiology'),
	('Pediatrics'),
	('Orthopedics'),
	('Neurology');

SELECT*
FROM Departments;

-----------------------------------------------------------------
--=============| POPULATING THE DOCTORS TABLE  |=============--

-- Insert data into the Doctors table
INSERT INTO Doctors (First_name, Last_name, Department_id)
VALUES
    ('Splendor', 'Okonkwo', 1),  -- Cardiology
    ('Sid', 'Yusuf', 2),        -- Pediatrics
    ('Adura', 'Alabi', 3),     -- Orthopedics
    ('Tobi', 'Chukwu', 4);       -- Neurology

SELECT*
FROM Doctors;

-----------------------------------------------------------------
--=============| POPULATING THE APPOINTMENTS TABLE  |=============--

-- Insert appointment records
INSERT INTO Appointments (Patient_id, Doctor_id, Department_id, Appointment_date, Appointment_time, Status, Patient_review)
VALUES
    (1, 1, 1, '2025-08-25', '10:00:00', 'pending', NULL),
    (2, 2, 2, '2025-08-26', '14:30:00', 'completed', 'Dr. Sid was very patient and helpful.'),
    (3, 3, 3, '2025-08-27', '09:00:00', 'cancelled', NULL),
    (4, 4, 4, '2025-09-01', '11:00:00', 'pending', NULL),
    (5, 1, 1, '2025-09-02', '15:00:00', 'pending', NULL),
    (6, 2, 2, '2025-09-03', '10:30:00', 'completed', 'Efficient service and great staff.'),
    (7, 3, 3, '2025-09-04', '13:00:00', 'completed', 'Quick and painless.'),
    (8, 4, 4, '2025-09-05', '16:00:00', 'pending', NULL),
    (9, 1, 1, '2025-09-06', '08:00:00', 'pending', NULL),
    (10, 2, 2, '2025-09-07', '11:45:00', 'completed', 'The doctor was very thorough.'),
    (11, 3, 3, '2025-09-08', '14:00:00', 'cancelled', NULL),
    (12, 4, 4, '2025-09-09', '09:30:00', 'pending', NULL),
    (13, 1, 1, '2025-09-10', '10:00:00', 'pending', NULL),
    (14, 2, 2, '2025-09-11', '13:15:00', 'completed', 'My child felt comfortable with the doctor.'),
    (15, 3, 3, '2025-09-12', '15:30:00', 'pending', NULL),
    (16, 4, 4, '2025-09-13', '08:45:00', 'completed', 'Excellent consultation.'),
    (17, 1, 1, '2025-09-14', '11:00:00', 'pending', NULL),
    (18, 2, 2, '2025-09-15', '14:00:00', 'completed', 'The new patient portal is very easy to use.'),
    (19, 3, 3, '2025-09-16', '10:00:00', 'pending', NULL),
    (20, 4, 4, '2025-09-17', '12:00:00', 'completed', 'Satisfied with the overall experience.');

SELECT*
FROM Appointments;

-----------------------------------------------------------------
--=============| POPULATING THE MEDICAL RECORDS TABLE  |=============--

-- Insert medical records
INSERT INTO MedicalRecords (Appointment_id, Diagnosis, Allergies, Medicines_prescribed, Prescription_date)
VALUES
    (1, 'Routine check-up', NULL, NULL, NULL),
    (2, 'Pediatric check-up', 'Pollen', 'Ibuprofen', '2025-08-26'),
    (3, 'Broken arm', 'Penicillin', 'Codeine', '2025-08-27'),
    (4, 'Headache', NULL, NULL, NULL),
    (5, 'Annual physical', NULL, NULL, NULL),
    (6, 'Fever', 'Nuts', 'Paracetamol', '2025-09-03'),
    (7, 'Sprained ankle', NULL, 'Voltaren', '2025-09-04'),
    (8, 'Back pain', 'Latex', NULL, NULL),
    (9, 'Hypertension', NULL, 'Lisinopril', '2025-09-06'),
    (10, 'Ear infection', 'Dairy', 'Amoxicillin', '2025-09-07'),
    (11, 'Skin rash', NULL, 'Hydrocortisone cream', '2025-09-08'),
    (12, 'Flu symptoms', NULL, NULL, NULL),
    (13, 'Vitamin deficiency', NULL, 'Multivitamin', '2025-09-10'),
    (14, 'Asthma follow-up', NULL, 'Albuterol inhaler', '2025-09-11'),
    (15, 'Sore throat', 'Gluten', NULL, NULL),
    (16, 'Foot pain', NULL, 'Naproxen', '2025-09-13'),
    (17, 'Allergy test', 'Pollen', NULL, NULL),
    (18, 'Routine check-up', NULL, NULL, NULL),
    (19, 'Insomnia', NULL, 'Melatonin', '2025-09-16'),
    (20, 'Cholesterol screening', NULL, NULL, NULL);

SELECT*
FROM MedicalRecords;