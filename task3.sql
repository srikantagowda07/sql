-- Patient#- | Name | DOB | Address | Prescription# | Drug | Date | Dosage | Doctor | Secretary;

-- Functional Dependencys are :

--PatientID --> (Name, DOB, Address )  
--PrescriptionID --> ( Drug, Date, Dosage, doctor, PatientID)    // one to one relation;
-- Doctor --> (Secretary)   // one to many relation;

--                                   Table 1 patient_details

CREATE TABLE patient_details(
    PatientID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NULL NULL,
    DOB INT DEFAULT NULL,
    address VARCHAR(50) NOT NULL,
)

--                                     Table 2 Prescription_Details

CREATE TABLE Prescription (
    PrescriptionID INT NOT NULL PRIMARY KEY,
    drug VARCHAR(50) NOT NULL,
    Expire_date VARCHAR (50) NOT NULL,
    dosage VARCHAR (50) NOT NULL,
    PatientID VARCHAR (50) NOT NULL ,
    FOREIGN KEY (PatientID) REFERENCES patient_details(PatientID)
)

--                                     Table 3 Doctor_Secretary Details

CREATE TABLE Doctor_Secretary(              -- One  2  Many; 
Doctor VARCHAR(50) NOT NULL,
Secretary VARCHAR(50) not null
)

-- 