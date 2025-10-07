# Hospital Management Database System (T-SQL Implementation)

## Project Overview 🏥

This project involves the design and implementation of a robust, normalized relational database system for a hospital. The system is designed to securely and efficiently manage core healthcare operations, including patients, doctors, medical records, and appointments.

The primary objective was to ensure the database adheres to the principles of **normalization**—specifically achieving **Third Normal Form (3NF)**—to prevent data redundancy and maintain high data integrity.

---

## Technical Stack

* **Database Management System (DBMS):** Microsoft SQL Server
* **Query Language:** T-SQL (Transact-SQL)
* **Development Environment:** Microsoft SQL Server Management Studio (SSMS)

---

## Database Schema & Components

The final database design is comprised of the following key tables:

| Table Name | Primary Purpose | Key Fields/Relationships |
| :--- | :--- | :--- |
| **Patients** | Stores patient demographics and portal login credentials. | `Patient_id` (PK) |
| **Doctors** | Stores doctor details and their assigned departments. | `Doctor_id` (PK) |
| **Departments** | Stores hospital department names (e.g., Cardiology, Surgery). | `Department_id` (PK) |
| **Appointments** | Manages scheduling and appointment status. | `Appointment_id` (PK), FK to `Patients`, FK to `Doctors` |
| **MedicalRecords** | Central repository for diagnoses, medicines, and allergies. | `Record_id` (PK), FK to `Patients`, FK to `Doctors` |

### Normalization (3NF) Justification

The schema was designed in 3NF by ensuring:
1.  All columns are atomic (1NF).
2.  All non-key attributes are fully dependent on the primary key (2NF).
3.  All non-key attributes are independent of each other (i.e., no transitive dependencies) (3NF).

---

## Implementation (T-SQL Code)

The repository includes the complete T-SQL script used to build and populate the database. This script demonstrates the practical application of database theory:

### Key Code Sections:

| T-SQL Focus | Description & Example |
| :--- | :--- |
| **`CREATE TABLE`** | Defines the schema for all five tables, specifying column names and constraints. |
| **Data Types** | Justification for using `INT` for IDs (with `IDENTITY`), `VARCHAR(50)` for names, and `DATETIME` for scheduling. |
| **Constraints** | Implementation of **PRIMARY KEY**, **FOREIGN KEY** (to link tables), and **NOT NULL** constraints to enforce data integrity. |
| **`INSERT INTO`** | Population of all tables with over **20 sample records** each to validate the functionality of the relationships. |
| **`SELECT` Queries** | Example `SELECT` queries were created to test data retrieval and demonstrate the ability to join tables (e.g., retrieving a patient's full medical history). |

### **How to Run the Code**

1.  Open the T-SQL script file (e.g., `Hospital Database.sql`) in **SQL Server Management Studio (SSMS)**.
2.  Execute the script sequentially to create the database, define the schema, and insert the sample data.

---

## Deliverables & Documentation

* **T-SQL Script:** The complete SQL code file is included in the repository.
* **Design Report:** The accompanying report (`Hospital Database Report.docx`) details the conceptual design, justification for data types and constraints, and screenshots of the successful table creation in SSMS.
