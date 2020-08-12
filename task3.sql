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
     FOREIGN KEY  (PatientID) REFERENCES Prescription(PatientID)
)

--                                     Table 2 Prescription_Details

CREATE TABLE Prescription (
   PrescriptionID INT NOT NULL PRIMARY KEY,
   PatientID INT  NOT NULL,
   DoctorID int NOT NULL,
   FOREIGN KEY (PrescriptionID) REFERENCES prescriptionEach(PrescriptionId)
)

--                                     Table 3 Doctor_Secretary Details
   
CREATE TABLE Doctor_Secretary(            -- One  2  Many; 
   DoctorID VARCHAR(50) not NULL PRIMARY KEY,
   Doctor VARCHAR(50) NOT NULL,
   Secretary VARCHAR(50) not null,
    FOREIGN KEY  (DoctorID) REFERENCES Prescription(DoctorID)
)


--                                    Table 4 Prescription for Each DRUG

CREATE TABLE prescriptionEach_drug (
    PrescriptionId int not NULL PRIMARY key,
    Drug_ID int not NULL,
    FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionId)
)

--                                   Table Drug INFORMATION


CREATE TABLE DRUG_ID (
   Drug_ID INT  NOT NULL PRIMARY KEY,
   Drug VARCHAR (50) NOT NULL,
   Expire_date VARCHAR (50) NOT NULL,
   Dosage VARCHAR(50) not NULL
   FOREIGN KEY (Drug_ID) REFERENCES Prescription_info(Drug_ID)
)


--   to satisfy 3nf , no transitive dependency should Exist, thus non key valus do not dependent on other non key values. 