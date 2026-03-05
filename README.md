# 🛡️ Foundation of Computer Science - Data Management & Analysis

![Python](https://img.shields.io/badge/Python-3.12-blue?style=for-the-badge&logo=python)
![SQL](https://img.shields.io/badge/SQL-Relational%20DB-orange?style=for-the-badge&logo=mysql)
![Academic](https://img.shields.io/badge/Coursework-ST4015CMD-success?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

## 📌 Project Overview
This repository contains the practical simulations, algorithmic implementations, and database schemas developed for the **Foundation of Computer Science** coursework. The project investigates secure data transmission, computational complexities (P vs NP), and structural database normalization.

---

## 📂 Repository Structure

### 1️⃣ Task 1: Secure Data Exchange & Encoding
Exploration of how encoding formats (Base64, ASCII, URL Encoding) facilitate secure data transmission across modern protocols (HTTPS, SMTP) while addressing the risks of payload obfuscation by threat actors. *(Theoretical analysis documented in the main report).*

### 2️⃣ Task 2: Algorithmic Analysis (P vs NP)
**File:** `Task2_Heuristic_Seating.py`
A Python-based simulation demonstrating the **Classroom Seating Arrangement Problem**. 
* **The Problem:** An `NP-Complete` combinatorial optimization problem where brute-force methods suffer from factorial time complexity `O(n!)`.
* **The Solution:** A greedy heuristic algorithm that sorts variables by constraint levels, successfully reducing the computational overhead to polynomial time.

### 3️⃣ Task 3: Database Normalization
**File:** `Task3_Database_Schema.sql`
A complete SQL script demonstrating the transformation of an anomaly-ridden flat file into a highly secure, scalable relational database.
* Identifies Insertion, Update, and Deletion anomalies.
* Applies **1NF, 2NF, and 3NF** to eliminate data redundancy and partial/transitive dependencies.
* Utilizes `INNER JOIN` operations to reconstruct fragmented data into human-readable unified views.
## Introduction
This repository contains the 3NF normalized database schema for the College Club Membership Management system.

## SCHEMAS

**Student (StudentID, StudentName, Email)**

### SQL QUERY:

```sql
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

```
## Table Description
**describe Student;**

## Result
<img width="763" height="242" alt="Screenshot 2026-03-05 200657" src="https://github.com/user-attachments/assets/2b7913cb-f38c-426d-85fa-9e7b9a32580e" />




### SQL QUERY:
```sql
CREATE TABLE Club (
    ClubID INT PRIMARY KEY,
    ClubName VARCHAR(100) NOT NULL,
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(100)
);
```
## Table Description
**describe Club;**

## Result
<img width="886" height="304" alt="Screenshot 2026-03-05 200726" src="https://github.com/user-attachments/assets/7095f9a3-a818-47e1-8133-69373c88516f" />




### SQL QUERY:
```sql
CREATE TABLE Membership (
    MembershipID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ClubID INT,
    JoinDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);
```
## Table Description
**describe Membership;**

## Result
<img width="956" height="315" alt="Screenshot 2026-03-05 200735" src="https://github.com/user-attachments/assets/01f54cd9-70d0-490f-a6d2-cb6afd552558" />


## 🚀 How to Interpret the Code

### Running the Python Simulation (Task 2)
1. Ensure Python 3.x is installed on your system.
2. Run the script via terminal:
   ```bash
   python Task2_Heuristic_Seating.py
