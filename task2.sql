-- Doctor# | DoctorName | Secretary | Patient# | PatientName | PatientDOB | PatientAddress | Prescription# | Drug | Date | Dosage

--Functional dependencys are : 

/* 
DoctorID -->  (DoctorName, Secretary ) // one to one relation;
PatientID --> (PatientName, PatientDOB,PatientAddress )  // one to one relation; 
Prescription --> (PrescriptionId ,  PatientID ,DoctorID ) */ -- one to one relation;

--PrescriptionEach-- > (Drug, Expire_date, Dosage, , PrescriptionId )


--                                        TABLE 1 DOCTOR DETAILS
CREATE TABLE doctor_table(
 DoctorID VARCHAR(50) not NULL PRIMARY KEY,
 DoctorName VARCHAR(50) not NULL,
 Secretary VARCHAR(50) not NULL,
 FOREIGN KEY  (DoctorID) REFERENCES Prescription_info(DoctorID)
)
--                                       TABLE 2 PatientID

CREATE TABLE Patient_info(
  PatientID int not NULL  PRIMARY KEY,
  PatientName VARCHAR (50) NOT NULL,
  PatientDOB INT DEFAULT NULL,
 PatientAddress VARCHAR(50) NOT NULL ,
 FOREIGN KEY (PatientID) REFERENCES Prescription_info(PatientID)
)
--                                     Table 3 Prescription Details

CREATE TABLE Prescription_info (
 PrescriptionID INT NOT NULL PRIMARY KEY,
  PatientID INT  NOT NULL,
  DoctorID int NOT NULL
  FOREIGN KEY (PrescriptionID) REFERENCES prescriptionEach(PrescriptionId)
)

--                                      Table 4 Prescription for Each DRUG


CREATE TABLE prescriptionEach_drug (
    PrescriptionId int not NULL PRIMARY key,
   Drug_ID int not NULL,
    FOREIGN KEY (PrescriptionID) REFERENCES Prescription_info(PrescriptionId)
)


--                                     Tbale Drug INFORMATION


CREATE TABLE DRUG_ID (
   Drug_ID INT  NOT NULL PRIMARY KEY,
   Drug VARCHAR (50) NOT NULL,
   Expire_date VARCHAR (50) NOT NULL,
   Dosage VARCHAR(50) not NULL
 FOREIGN KEY (Drug_ID) REFERENCES Prescription_info(Drug_ID)
)


--   to satisfy 3nf , no transitive dependency should Exist, thus non key valus do not dependent on other non key values. 