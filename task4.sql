--Client# -- Name-- Location| Manager#| Manager_name| Manager_location| Contract#| Estimated_cost| Completion_date| Staff#|Staff_name| Staff_location

--Functional dependencys are : 

/* client can have many managers  1 to many ;
clientID --> ( Name , location , ManagerID) 
ManagerID --> ( ManagerName , Manager_Location ) 
ProjectID --> [ClientID, ManagerID, ContractID ] --> ( Estimated_cost, Completion_date)
staffId --> (staff_Name , staff_location)
Manager_staff --> (StaffId , ProjectID)  */

--                                    Table 1 client details
CREATE TABLE client_details ( 
clientID int NOT NULL PRIMARY KEY,
Client_NAME VARCHAR(50) NOT NULL,
client_location VARCHAR(50) NOT NULL,
FOREIGN KEY (clientID) REFERENCES Project_Details(clientID)
)

--                                     Table 2 ManagerID

CREATE TABLE manager_info(
ManagerID INT NOT NULL  PRIMARY KEY,  
ManagerName VARCHAR (50) NOT NULL,
Manager_Location VARCHAR (50) NOT NULL,
FOREIGN KEY (ManagerID) REFERENCES Project_Details(ManagerID)
)

--                                     Table 3 Project_Details
CREATE TABLE Project_Details(
    ProjectID int NOT NULL AUTO_INCREMENT ,
    ClientID int NOT NULL,
    ManagerID INT NOT NULL,
    ContractID int NOT NULL,
    PRIMARY KEY (ProjectID),
    FOREIGN KEY (ProjectID) REFERENCES Manager_staff(ProjectID)
)
--                                     Table 4 Contract details

CREATE TABLE Contract_details(
    ContractID int NOT NULL,
    Estimated_cost INT NOT NULL,
    Completion_date INT DEFAULT NULL,
    FOREIGN KEY (ContractID) REFERENCES Project_Details(ContractID)
)

--                                     Table 3 Staff Details
CREATE TABLE Staff_Details(     
    staffId INT NOT NULL PRIMARY KEY,
    staff_Name VARCHAR(50) NOT NULL,
    staff_location VARCHAR(50) NOT NULL,
)
--                                     Table 4 Manager Details

CREATE TABLE Manager_staff(    -- manager to staff ( one to many )
    ManagerID INT NOT NULL PRIMARY KEY,
    StaffId INT  NOT NULL,
    ProjectID INT  NOT NULL,
    FOREIGN KEY (ProjectID) REFERENCES Project_Details(ProjectID),
    FOREIGN KEY (StaffId) REFERENCES Staff_Details(StaffId)
)

--                                                               END