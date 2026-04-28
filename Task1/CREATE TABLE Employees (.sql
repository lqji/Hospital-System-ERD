CREATE TABLE Employees (
    SSN VARCHAR(50) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    Gender CHAR(1),
    Superviser_SSN VARCHAR(50) REFERENCES Employees(SSN),
)

CREATE TABLE Departments (
    DepartmentNum INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Manager_SSN VARCHAR(50) REFERENCES Employees(SSN)
)

ALTER TABLE Employees  
DROP COLUMN DepartmentNum

Alter TABLE Employees
ADD DepartmentNum INT REFERENCES Departments(DepartmentNum)

CREATE TABLE Projects (
    ProjectNum INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentNum INT REFERENCES Departments(DepartmentNum),
    Loc VARCHAR(50)
)

CREATE TABLE Works_On (
    Employee_SSN VARCHAR(50) REFERENCES Employees(SSN),
    ProjectNum INT REFERENCES Projects(ProjectNum),
    Hours DECIMAL(5,2),
    PRIMARY KEY (Employee_SSN, ProjectNum)
)

CREATE TABLE Department_Locations (
    DepartmentNum INT REFERENCES Departments(DepartmentNum),
    Loc VARCHAR(50),
    PRIMARY KEY (DepartmentNum, Loc)
)

CREATE TABLE Dependent (
    Employee_SSN VARCHAR(50) REFERENCES Employees(SSN),
    DependentName VARCHAR(50),
    Gender CHAR(1),
    BirthDate DATE,
    PRIMARY KEY (Employee_SSN, DependentName)
)