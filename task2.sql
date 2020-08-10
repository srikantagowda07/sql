-- Doctor# | DoctorName | Secretary | Patient# | PatientName | PatientDOB | PatientAddress | Prescription# | Drug | Date | Dosage

--Functional dependencys are : 

/* 
DoctorID -->  (DoctorName, Secretary ) // one to one relation;
PatientID --> (PatientName, PatientDOB,PatientAddress, DoctorID )  // one to one relation; 
PrescriptionId --> (Drug, Expire_date, Dosage, PatientID) */ -- one to one relation;

--                                        TABLE 1 DOCTOR DETAILS

CREATE TABLE Doctor_details ( 
    DoctorID int not null PRIMARY KEY,
    DoctorName VARCHAR(50) not null, 
    secretary VARCHAR(50) not null
)

--                                       TABLE 2 PatientID

CREATE TABLE Patient_info(
    PatientID int not NULL  PRIMARY KEY,
    PatientName VARCHAR (50) NOT NULL,
    PatientDOB INT DEFAULT NULL,
    PatientAddress VARCHAR(50) NOT NULL ,
    DoctorID int NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctor_details(DoctorID)
)
--                                     Table 3 Prescription Details

CREATE TABLE Prescription_info (
    PrescriptionID INT NOT NULL PRIMARY KEY,
    Drug VARCHAR (50) NOT NULL,
    Expire_date VARCHAR (50) not NULL,
    Dosage VARCHAR (50) NOT NULL,
    PatientID VARCHAR (50) NOT NULL ,
  FOREIGN KEY (PatientID) REFERENCES Patient_info(PatientID)
)

--   to satisfy 3nf , no transitive dependency should Exist, thus non key valus do not dependent on other non key values. 