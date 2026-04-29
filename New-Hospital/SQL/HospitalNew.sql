USE NewHospital
CREATE TABLE DEPARTMENT (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50) NOT NULL,
    LOCATION VARCHAR(50) NOT NULL,
    No_of_doctors INT NOT NULL,
    Contact_number VARCHAR(15) NOT NULL
);
CREATE TABLE DOCTOR (
    DOCTOR_ID INT PRIMARY KEY,
    DOCTOR_NAME VARCHAR(50) NOT NULL,
    SPECIALIZATION VARCHAR(50) NOT NULL,
    Phone_no VARCHAR(15) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    License_no VARCHAR(20) NOT NULL,
    Qualification VARCHAR(50) NOT NULL,
    Years_of_experience INT NOT NULL,
    DEPT_ID INT,
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID)
);
CREATE TABLE PATIENT (
    PATIENT_ID INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    DATE_OF_BIRTH DATE NOT NULL,
    GENDER VARCHAR(10) NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    PHONE_NO VARCHAR(15) NOT NULL,
    EMAIL VARCHAR(50) NOT NULL,
    BLOOD_GROUP VARCHAR(5) NOT NULL,
);
CREATE TABLE APPOINTMENT (
    APPOINTMENT_ID INT PRIMARY KEY,
    PATIENT_ID INT,
    DOCTOR_ID INT,
    APPOINTMENT_STATUS VARCHAR(20) NOT NULL,
    APPOINTMENT_TYPE VARCHAR(20) NOT NULL,
    APPOINTMENT_DATE DATE NOT NULL,
    APPOINTMENT_TIME TIME NOT NULL,
    REASON VARCHAR(255) NOT NULL,
    FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID),
    FOREIGN KEY (DOCTOR_ID) REFERENCES DOCTOR(DOCTOR_ID)
);
CREATE TABLE MEDICAL_RECORD (
    RECORD_ID INT PRIMARY KEY,
    PATIENT_ID INT,
    DOCTOR_ID INT,
    APPOINTMENT_ID INT,
    DIAGNOSIS VARCHAR(255) NOT NULL,
    TREATMENT VARCHAR(255) NOT NULL,
    PRESCRIPTION VARCHAR(255) NOT NULL,
    DOCTOR_NOTES VARCHAR(255) NOT NULL,
    FOLLOW_REQUIRED BIT NOT NULL,
    RECORD_DATE DATE NOT NULL,
    FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID),
    FOREIGN KEY (DOCTOR_ID) REFERENCES DOCTOR(DOCTOR_ID),
    FOREIGN KEY (APPOINTMENT_ID) REFERENCES APPOINTMENT(APPOINTMENT_ID)
);
CREATE TABLE BILLING (
    BILL_ID INT PRIMARY KEY,
    PATIENT_ID INT,
    APPOINTMENT_ID INT,
    AMOUNT DECIMAL(10, 2) NOT NULL,
    PAYMENT_METHOD VARCHAR(20) NOT NULL,
    PAYMENT_STATUS VARCHAR(20) NOT NULL,
    BILL_DATE DATE NOT NULL,
    DUE_DATE DATE NOT NULL,
    FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID),
    FOREIGN KEY (APPOINTMENT_ID) REFERENCES APPOINTMENT(APPOINTMENT_ID)
);
CREATE TABLE SERVICE (
    SERVICE_ID INT PRIMARY KEY,
    DEPT_ID INT,
    SERVICE_NAME VARCHAR(50) NOT NULL,
    SERVICE_TYPE VARCHAR(20) NOT NULL,
    UNIT_PRICE DECIMAL(10, 2) NOT NULL,
    DESCRIPTION VARCHAR(255) NOT NULL,
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID)
);

CREATE TABLE APPOINTMENT_SERVICE (
    Appointment_id INT,
    Service_id INT,
    Quantity INT,
    -- Setting a composite primary key prevents duplicate service entries for the same appointment
    PRIMARY KEY (Appointment_id, Service_id), 
    FOREIGN KEY (Appointment_id) REFERENCES APPOINTMENT(Appointment_id),
    FOREIGN KEY (Service_id) REFERENCES SERVICE(Service_id)
);

INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, LOCATION, No_of_doctors, Contact_number) VALUES
(1, 'Cardiology', 'First Floor', 2, '24560001'),
(2, 'Neurology', 'Second Floor', 2, '24560002'),
(3, 'Orthopedics', 'Third Floor', 2, '24560003'),
(4, 'General Medicine', 'Ground Floor', 2, '24560004');

INSERT INTO DOCTOR (DOCTOR_ID, DOCTOR_NAME, SPECIALIZATION, Phone_no, Email, License_no, Qualification, Years_of_experience, DEPT_ID) VALUES
(1, 'Dr. Ahmed', 'Cardiologist', '91234567', 'ahmed@hospital.com', 'LIC1001', 'MD
Cardiology', 10, 1),
(2, 'Dr. Sara', 'Cardiologist', '91234568', 'sara@hospital.com', 'LIC1002', 'MD Cardiology', 7,
1),
(3, 'Dr. Khalid', 'Neurologist', '91234569', 'khalid@hospital.com', 'LIC1003', 'MD Neurology',
9, 2),
(4, 'Dr. Noor', 'Neurologist', '91234570', 'noor@hospital.com', 'LIC1004', 'MD Neurology', 6,
2),
(5, 'Dr. Ali', 'Orthopedic', '91234571', 'ali@hospital.com', 'LIC1005', 'MD Orthopedics', 8, 3),
(6, 'Dr. Mona', 'Orthopedic', '91234572', 'mona@hospital.com', 'LIC1006', 'MD Orthopedics',
5, 3),
(7, 'Dr. Hassan', 'General Physician', '91234573', 'hassan@hospital.com', 'LIC1007', 'MBBS',
12, 4),
(8, 'Dr. Fatma', 'General Physician', '91234574', 'fatma@hospital.com', 'LIC1008', 'MBBS', 4,
4);

INSERT INTO PATIENT (
    PATIENT_ID, 
    first_name, 
    last_name, 
    PHONE_NO, 
    EMAIL, 
    ADDRESS, 
    DATE_OF_BIRTH, 
    BLOOD_GROUP, 
    GENDER
) VALUES
(1, 'Salim', 'Al-Harthi', '92345671', 'salim@email.com', 'Muscat', '1995-05-10', 'O+', 'Male'),
(2, 'Aisha', 'Al-Balushi', '92345672', 'aisha@email.com', 'Seeb', '1998-07-15', 'A+', 'Female'),
(3, 'Khalfan', 'Al-Rawahi', '92345673', 'khalfan@email.com', 'Barka', '1990-03-22', 'B+', 'Male'),
(4, 'Noor', 'Al-Mamari', '92345674', 'noor@email.com', 'Muscat', '2000-11-01', 'AB+', 'Female'),
(5, 'Huda', 'Al-Saadi', '92345675', 'huda@email.com', 'Nizwa', '1993-02-14', 'O-', 'Female'),
(6, 'Saeed', 'Al-Kindi', '92345676', 'saeed@email.com', 'Sohar', '1988-09-09', 'A-', 'Male'),
(7, 'Maryam', 'Al-Hinai', '92345677', 'maryam@email.com', 'Muscat', '1996-12-30', 'B-', 'Female'),
(8, 'Ali', 'Al-Abri', '92345678', 'ali@email.com', 'Ibri', '1992-06-18', 'O+', 'Male');

INSERT INTO SERVICE (SERVICE_ID, DEPT_ID, SERVICE_NAME, SERVICE_TYPE, UNIT_PRICE, DESCRIPTION) VALUES
(1, 4, 'Consultation', 'Consultation', 15.000, 'General doctor consultation'),
(2, 1, 'ECG', 'Lab Test', 20.000, 'Heart test'),
(3, 2, 'MRI', 'X-Ray', 50.000, 'Brain scan'),
(4, 3, 'X-Ray', 'X-Ray', 25.000, 'Bone scan'),
(5, 4, 'Blood Test', 'Lab Test', 10.000, 'Basic blood test'),
(6, 3, 'Physiotherapy', 'Treatment', 30.000, 'Physical therapy session'),
(7, 3, 'Minor Surgery', 'Surgery', 200.000, 'Small surgical procedure'),
(8, 4, 'Follow-up Visit', 'Consultation', 10.000, 'Follow-up appointment');

INSERT INTO APPOINTMENT (APPOINTMENT_ID, PATIENT_ID, DOCTOR_ID, APPOINTMENT_STATUS, APPOINTMENT_TYPE, APPOINTMENT_DATE, APPOINTMENT_TIME, REASON) VALUES
(1, 1, 1, 'Scheduled', 'Consultation', '2024-07-01', '10:00:00', 'Regular check-up'),
(2, 2, 3, 'Completed', 'Consultation', '2024-06-15', '14:00:00', 'Headache and dizziness'),
(3, 3, 5, 'Scheduled', 'Treatment', '2024-07-05', '09:30:00', 'Knee pain'),
(4, 4, 7, 'Cancelled', 'Consultation', '2024-07-10', '11:00:00', 'Flu symptoms'),
(5, 5, 2, 'Scheduled', 'Lab Test', '2024-07-03', '13:00:00', 'ECG for chest pain'),
(6, 6, 4, 'Completed', 'X-Ray', '2024-06-20', '15:30:00', 'Back pain'),
(7, 7, 6, 'Scheduled', 'Treatment', '2024-07-08', '10:30:00', 'Physical therapy for shoulder injury'),
(8, 8, 8, 'Scheduled', 'Consultation', '2024-07-12', '12:00:00', 'Follow-up after surgery');

INSERT INTO MEDICAL_RECORD (RECORD_ID, PATIENT_ID, DOCTOR_ID, APPOINTMENT_ID, DIAGNOSIS, TREATMENT, PRESCRIPTION, DOCTOR_NOTES, FOLLOW_REQUIRED, RECORD_DATE) VALUES
(1, 2, 3, 2, 'Migraine', 'Medication and rest', 'Pain relievers', 'Patient advised to avoid triggers', 1, '2024-06-15'),
(2, 6, 4, 6, 'Lumbar Strain', 'Physical therapy and pain management', 'Muscle relaxants', 'Patient advised to avoid heavy lifting', 1, '2024-06-20');


INSERT INTO Appointment_Service (Appointment_id, Service_id, Quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(2, 5, 2),
(3, 4, 1),
(4, 1, 1),
(4, 5, 1),
(5, 6, 2),
(6, 2, 1),
(6, 1, 1),
(7, 4, 1),
(7, 6, 1),
(8, 1, 1);

INSERT INTO MEDICAL_RECORD (
    RECORD_ID, 
    RECORD_DATE, 
    DIAGNOSIS, 
    TREATMENT, 
    PRESCRIPTION, 
    DOCTOR_NOTES, 
    FOLLOW_REQUIRED, 
    PATIENT_ID, 
    DOCTOR_ID, 
    APPOINTMENT_ID
) VALUES
(1, '2026-04-01', 'Mild chest pain', 'Medication and rest', 'Painkiller', 'Patient stable', 1, 1, 1, 1),
(2, '2026-04-02', 'Migraine symptoms', 'MRI and medication', 'Migraine medicine', 'Needs follow-up', 1, 2, 3, 2),
(3, '2026-04-04', 'Fever infection', 'Antibiotics', 'Antibiotic', 'Monitor temperature', 0, 4, 7, 4),
(4, '2026-04-06', 'Heart rhythm issue', 'ECG follow-up', 'Heart medication', 'Needs monitoring', 1, 6, 2, 6),
(5, '2026-04-07', 'Minor bone injury', 'Physiotherapy', 'Pain relief', 'Improving', 1, 7, 5, 7),
(6, '2026-04-09', 'Heart follow-up', 'Continue treatment', 'Same medication', 'Better condition', 0, 1, 1, 8),
(7, '2026-04-10', 'Headache issue', 'MRI review', 'Painkiller', 'Check scan result', 1, 2, 4, 8);

INSERT INTO BILLING (
    Bill_id, 
    Bill_date, 
    AMOUNT, 
    Payment_status, 
    Payment_method, 
    Due_date, 
    Patient_id, 
    Appointment_id
) VALUES
(1, '2026-04-01', 35.000, 'Paid', 'Card', '2026-04-05', 1, 1),
(2, '2026-04-02', 70.000, 'Partial', 'Insurance', '2026-04-06', 2, 2),
(3, '2026-04-04', 25.000, 'Paid', 'Cash', '2026-04-08', 4, 4),
(4, '2026-04-06', 35.000, 'Paid', 'Card', '2026-04-10', 6, 6),
(5, '2026-04-07', 55.000, 'Pending', 'Cash', '2026-04-11', 7, 7),
(6, '2026-04-09', 30.000, 'Paid', 'Card', '2026-04-13', 1, 8), 
(7, '2026-04-10', 65.000, 'Partial', 'Insurance', '2026-04-14', 2, 8); 