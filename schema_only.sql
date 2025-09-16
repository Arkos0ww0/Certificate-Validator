-- Database: certificate_validator
CREATE DATABASE IF NOT EXISTS certificate_validator;
USE certificate_validator;

-- Users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('student', 'institute', 'employer', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Institutions table
CREATE TABLE Institutions (
    institution_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    address TEXT,
    contact_email VARCHAR(150) UNIQUE
);

-- Certificates table
CREATE TABLE Certificates (
    certificate_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    institution_id INT NOT NULL,
    course VARCHAR(150) NOT NULL,
    issue_date DATE NOT NULL,
    hash VARCHAR(64) UNIQUE NOT NULL,  -- SHA-256 hash
    encrypted_data TEXT NOT NULL,      -- AES encrypted metadata
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (institution_id) REFERENCES Institutions(institution_id) ON DELETE CASCADE
);

-- Employers table
CREATE TABLE Employers (
    employer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    contact_email VARCHAR(150) UNIQUE,
    address TEXT
);

-- Verification Logs table
CREATE TABLE VerificationLogs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employer_id INT NOT NULL,
    certificate_id INT NOT NULL,
    verified BOOLEAN NOT NULL,
    verification_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employer_id) REFERENCES Employers(employer_id) ON DELETE CASCADE,
    FOREIGN KEY (certificate_id) REFERENCES Certificates(certificate_id) ON DELETE CASCADE
);
