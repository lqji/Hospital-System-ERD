
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100),
    Location VARCHAR(100),
    Head_Doctoer VARCHAR(100)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(100),
    Is_Active BIT,
    Department_ID INT,
    Contact_Number VARCHAR(15),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);


CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    Gender VARCHAR(10),
    Contact_Number VARCHAR(15),
    Email VARCHAR(100),
    Blood_Type VARCHAR(5)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    appointment_type VARCHAR(50),
    appointment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    prescription VARCHAR(255),
    record_date DATE,
    appointment_id INT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE Services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    service_type VARCHAR(50),
    service_cost DECIMAL(10, 2)
);

CREATE TABLE Appointment_Services (
    appointment_id INT,
    service_id INT,
    quantity INT,
    PRIMARY KEY (appointment_id, service_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

CREATE TABLE Billing (
    billing_id INT PRIMARY KEY,
    appointment_id INT,
    billing_amount DECIMAL(10, 2),
    balance_due DECIMAL(10, 2),
    payment_status VARCHAR(20),
    billing_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    billing_id INT,
    payment_amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method VARCHAR(50),
    FOREIGN KEY (billing_id) REFERENCES Billing(billing_id)
);