-- Branch# || Branch_Addr || ISBN ||  Title || Author ||  Publisher || Num_copies ;

-- 1NF  All the attributes of the relation are atomic (indivisible into meaningful sub parts) and Every attribute contains single value (per record).

--Functional Dependency are : 

/** Branch#  --> ( Branch_Addr)   // one to one relation;
Branch# and ISBN --> ( Num_copies ) // composite key one to one relation;
ISBN --> ( title , author , publisher ) // one to one relation;
=====================================================================================================================

To satisy 2NF ,  the branch should not have partial dependence , hence the branch table has partial dependency, the table violates 2nf;

thus., we decompose the given table;

1.branch_details 
2.stock
3.book                        */
--                                                TABLE 1 BRANCH DETAILS
CREATE TABLE branch_details (
    BranchNo int NOT NULL,
    Branch_Addr VARCHAR(50) NOT NULL,
    PRIMARY KEY (BranchNo),
);

--                                                TABLE 2 STOCK

CREATE TABLE stock (
    BranchNo int NOT NULL,
    ISBN int NOT NULL,
    Num_copies int,
    PRIMARY KEY (BranchNo, ISBN),
    FOREIGN KEY (ISBN) REFERENCES book(ISBN)
);
 
--                                                TABLE 3 BOOK

CREATE TABLE book (
    ISBN INT NOT NULL PRIMARY KEY,
    title INT NOT NULL,
    author VARCHAR(50) NOT NULL,
    publisher VARCHAR(50) NOT NULL,
)

--To satisfy 3NF, all non key attributes should not depend on any other non key attributes thus,.
--3NF is not violated., in the above tables, no dependency in non key attributes.
