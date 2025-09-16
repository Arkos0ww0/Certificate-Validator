USE certificate_validator;

-- Insert sample users
INSERT INTO Users (name, email, password_hash, role)
VALUES
('Alice Student', 'alice@student.com', '$2b$10$hashedPass1', 'student'),
('Bob Institute', 'bob@institute.com', '$2b$10$hashedPass2', 'institute'),
('Charlie Employer', 'charlie@employer.com', '$2b$10$hashedPass3', 'employer'),
('Diana Admin', 'diana@admin.com', '$2b$10$hashedPass4', 'admin');

-- Insert sample institution
INSERT INTO Institutions (name, address, contact_email)
VALUES ('Dayananda Sagar University', 'Bangalore, India', 'contact@dsu.edu');

-- Insert sample employer
INSERT INTO Employers (name, contact_email, address)
VALUES ('Infosys Ltd', 'hr@infosys.com', 'Electronic City, Bangalore');

-- Insert sample certificate
INSERT INTO Certificates (student_id, institution_id, course, issue_date, hash, encrypted_data)
VALUES (1, 1, 'B.Tech CSE', '2025-01-01', 'abc123fakehash456', 'EncryptedCertificateDataHere');

-- Insert sample verification log
INSERT INTO VerificationLogs (employer_id, certificate_id, verified)
VALUES (1, 1, TRUE);
