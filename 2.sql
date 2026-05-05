use session10;
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(255),
    Phone VARCHAR(20),
    Age INT,
    Address VARCHAR(255)
);

DELIMITER //
CREATE PROCEDURE SeedPatients()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500000 DO
        INSERT INTO Patients (Full_Name, Phone, Age, Address)
        VALUES (CONCAT('Patient ', i), CONCAT('090', i), FLOOR(RAND()*100), 'Ho Chi Minh City');
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL SeedPatients();

DELIMITER //
CREATE PROCEDURE TestInsertSpeed()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE start_time TIMESTAMP;
    DECLARE end_time TIMESTAMP;
    
    SET start_time = CURRENT_TIMESTAMP(6);
    
    WHILE i <= 1000 DO
        INSERT INTO Patients (Full_Name, Phone, Age, Address)
        VALUES ('New Patient', CONCAT('080', i), 30, 'Hanoi');
        SET i = i + 1;
    END WHILE;
    
    SET end_time = CURRENT_TIMESTAMP(6);
    SELECT TIMEDIFF(end_time, start_time) AS ExecutionTime;
END //
DELIMITER ;