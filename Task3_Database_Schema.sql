-- =============================================================================
-- Task 3: College Club Membership Management
-- Module: Foundation of Computer Science (ST4015CMD)
-- Description: 3NF Normalized Relational Database Schema and JOIN queries.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. TABLE CREATION (3NF Architecture)
-- -----------------------------------------------------------------------------

-- Student Entity (Removes partial dependencies related to student details)
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Club Entity (Removes transitive dependencies by assigning a surrogate key)
CREATE TABLE Club (
    ClubID INT PRIMARY KEY,
    ClubName VARCHAR(100) NOT NULL,
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(100)
);

-- Membership Entity (Associative junction table handling 1:M relationships)
CREATE TABLE Membership (
    MembershipID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ClubID INT,
    JoinDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID) ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- 2. DATA INSERTION (Mock Data)
-- -----------------------------------------------------------------------------
INSERT INTO Student (StudentID, StudentName, Email) VALUES 
(1, 'Asha', 'asha@email.com'), 
(2, 'Bikash', 'bikash@email.com');

INSERT INTO Club (ClubID, ClubName, ClubRoom, ClubMentor) VALUES 
(101, 'Music Club', 'R101', 'Mr. Raman'), 
(102, 'Sports Club', 'R202', 'Ms. Sita');

INSERT INTO Membership (StudentID, ClubID, JoinDate) VALUES 
(1, 101, '2024-01-10'), 
(2, 102, '2024-01-12'),
(1, 102, '2024-01-15');

-- -----------------------------------------------------------------------------
-- 3. DATA RECONSTRUCTION (SQL INNER JOIN)
-- -----------------------------------------------------------------------------
-- Query to reconstruct the fragmented 3NF tables into a human-readable view
SELECT 
    Student.StudentName, 
    Club.ClubName, 
    Membership.JoinDate
FROM Membership
INNER JOIN Student ON Membership.StudentID = Student.StudentID
INNER JOIN Club ON Membership.ClubID = Club.ClubID;
