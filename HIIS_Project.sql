/* No-Where-To-Be-Found Hospital (NWTBF) */
/* Create NWTBF Hospital Inpatient Information System (HIIS) */

CREATE DATABASE HIIS ;

USE HIIS ;

SET foreign_key_checks = 0 ;  -- Temporarily disable foreign key checkup to create tables

/* Create Patient table */
CREATE TABLE HIIS.Patient (
	Patient_ID CHAR(6) ,
	PL_Name VARCHAR(255) NOT NULL ,
	PF_Name VARCHAR(255) NOT NULL ,
	DOB DATE NOT NULL ,
	P_Phone VARCHAR(255) NOT NULL,
	P_Email VARCHAR(255) NOT NULL,
	CONSTRAINT Pt_pk PRIMARY KEY (Patient_ID)
) ;

/* Create Admission table */
CREATE TABLE HIIS.Admission (
	Admission_ID CHAR(6) ,
	Patient_ID CHAR(6) NOT NULL ,
	EContact_ID CHAR(6) NOT NULL ,
	ADoctor_ID CHAR(4) NOT NULL ,
	Admit_Date DATE NOT NULL ,
	Discharge_Date DATE ,
	CONSTRAINT Adm_pk PRIMARY KEY (Admission_ID) ,
	CONSTRAINT Adm_fk1 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ,
	CONSTRAINT Adm_fk2 FOREIGN KEY (EContact_ID) REFERENCES Emerg_Contact(EContact_ID) ,
	CONSTRAINT Adm_fk3 FOREIGN KEY (ADoctor_ID) REFERENCES Doctor(Doctor_ID)
) ;

/* Create Doctor table */
CREATE TABLE HIIS.Doctor (
	Doctor_ID CHAR(4) ,
	Department_ID CHAR(2) NOT NULL ,
	DF_Name VARCHAR(255) NOT NULL ,
	DL_Name VARCHAR(255) NOT NULL,
	CONSTRAINT Doc_pk PRIMARY KEY (Doctor_ID) ,
	CONSTRAINT Doc_fk1 FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
) ;

/* Create Treatment table which contains all possible treatments */
CREATE TABLE HIIS.Treatment (
	Treatment_ID CHAR(3) ,
	T_Description VARCHAR(255) NOT NULL ,
	CONSTRAINT Tmt_pk PRIMARY KEY (Treatment_ID)
) ;

/* Create Admission_Treatments table which contains all treatments per admission */
CREATE TABLE HIIS.Admission_Treatments (
	A_TID CHAR(3) ,
	Treatment_ID CHAR(3) NOT NULL ,
	Admission_ID CHAR(6) NOT NULL ,
	TDoctor_ID CHAR(4) NOT NULL ,
	TDate DATE NOT NULL ,
	CONSTRAINT AdmTmt_pk PRIMARY KEY (A_TID) ,
	CONSTRAINT AdmTmt_fk1 FOREIGN KEY (Treatment_ID) REFERENCES Treatment(Treatment_ID),
	CONSTRAINT AdmTmt_fk2 FOREIGN KEY (Admission_ID) REFERENCES Admission(Admission_ID),
	CONSTRAINT AdmTmt_fk3 FOREIGN KEY (TDoctor_ID) REFERENCES doctor(Doctor_ID)
) ;

/* Create Department table which contains all of the hospital medical departments */
CREATE TABLE HIIS.Department (
	Department_ID CHAR(2) ,
	Head_Doctor_ID CHAR(4) NOT NULL ,
	Dept_Name VARCHAR(255) NOT NULL ,
	Bldg_Name VARCHAR(255) ,
	Bldg_Floor CHAR(1) ,
	CONSTRAINT Dept_pk PRIMARY KEY (Department_ID) ,
	CONSTRAINT Dept_fk1 FOREIGN KEY (Head_Doctor_ID) REFERENCES Doctor(Doctor_ID)
) ;

/* Create Specialty table which specifies types of doctor specialties */
CREATE TABLE HIIS.Specialty (
	Specialty_ID CHAR(2) ,
	S_Name VARCHAR(255) NOT NULL ,     -- Specialty Name
	CONSTRAINT Spec_pk PRIMARY KEY (Specialty_ID)
) ;

/* Create Doctor_Specialty table which lists doctors and their specialties */
CREATE TABLE HIIS.Doctor_Specialty (
	D_SID CHAR(6) ,
	Specialty_ID CHAR(2) NOT NULL ,
	Doctor_ID CHAR(4) NOT NULL ,
	CONSTRAINT Doc_Spec_pk PRIMARY KEY (D_SID) ,
	CONSTRAINT Doc_Spec_fk1 FOREIGN KEY (Specialty_ID) REFERENCES Specialty(Specialty_ID),
	CONSTRAINT Doc_Spec_fk2 FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
) ;

/* Create Emerg_Contact table which contains patient emergency contacts */
CREATE TABLE HIIS.Emerg_Contact (
	EContact_ID CHAR(6) ,
	EF_Name VARCHAR(255) NOT NULL ,
	EL_Name VARCHAR(255) NOT NULL ,
	E_Phone VARCHAR(255) NOT NULL ,
	E_Email VARCHAR(255) ,
	Relationship VARCHAR(255) ,
	CONSTRAINT Em_pk PRIMARY KEY (EContact_ID)
) ;

/* Data for the Patient table */
ALTER TABLE `patient` DISABLE KEYS ;
INSERT INTO `patient` (`Patient_ID`, `PL_Name`, `PF_Name`, `DOB`, `P_Phone`, `P_Email`) VALUES
	('037383', 'Rodgers', 'Miguel', '1936-07-05', '505-486-1111', 'dragon@mac.com'),
	('154878', 'Lopez', 'Cedric', '1924-04-01', '505-402-3929', 'clopez@aol.com'),
	('206262', 'Shelton', 'Austin', '1995-03-05', '505-422-7217', 'ashelton@msn.com'),
	('224306', 'Schneider', 'Jan', '1938-11-16', '505-860-9684', 'jschnei@sandia.gov'),
	('239509', 'Patrick', 'Ignacio', '1968-06-09', '505-841-1455', 'pignacio@hotmail.com'),
	('245669', 'Howell', 'Clayton', '2000-01-23', '575-203-1167', 'chowell@yahoo.com'),
	('373668', 'Simon', 'Meghan', '1983-04-17', '505-476-0624', 'msimon@unm.edu'),
	('423207', 'Clarke', 'Penny', '2004-05-13', '505-351-2041', 'cpenny@verizon.net'),
	('424410', 'Clayton', 'Glen', '1992-10-28', '505-514-8761', 'gclayton@gmail.com'),
	('473296', 'Medina', 'Marjorie', '1995-09-16', '505-449-4943', 'mmed@me.com');
ALTER TABLE `patient` ENABLE KEYS ;

/* Data for the Emerg_Contact table */
ALTER TABLE `emerg_contact` DISABLE KEYS ;
INSERT INTO `emerg_contact` (`EContact_ID`, `EF_Name`, `EL_Name`, `E_Phone`, `E_Email`, `Relationship`) VALUES
	('030936', 'Viola', 'Hoffman', '575-366-5356', 'viola@me.com', 'friend'),
	('102837', 'Olga', 'Quinn', '505-692-1619', 'oquinn@aol.com', 'mother'),
	('180475', 'Albert', 'Mathis', '505-764-2183', 'amathis@hotmail.com', 'significant other'),
	('319332', 'Phillip', 'Houston', '505-360-5013', 'phouston@live.com', 'brother'),
	('386738', 'Jonathon', 'Holmes', '505-488-9101', 'jhbaby@outlook.com', 'spouse'),
	('388761', 'Rhonda', 'Wright', '575-405-0020', 'rwrigh@sandia.gov', 'sister'),
	('406805', 'Carlton', 'Schultz', '505-606-2201', 'thecarlton@yahoo.com', 'friend'),
	('482870', 'Anita', 'Gilbert', '575-219-3129', 'agilbert@mac.com', 'spouse'),
	('493551', 'Loren', 'Clark', '505-866-6040', 'lclark@gmail.com', 'son'),
	('498892', 'Rochelle', 'Bradley', '505-470-3040', 'rbrad@msn.com', 'daughter');
ALTER TABLE `emerg_contact` ENABLE KEYS ;

/* Date for the Admission table */
ALTER TABLE `admission` DISABLE KEYS ;
INSERT INTO `admission` (`Admission_ID`, `Patient_ID`, `EContact_ID`, `ADoctor_ID`, `Admit_Date`, `Discharge_Date`) VALUES
	('015916', '424410', '180475', '0112', '2017-10-25', '2017-10-28'),
	('199613', '245669', '482870', '0308', '2013-04-04', '2013-04-14'),
	('202028', '037383', '406805', '2462', '2017-06-02', '2017-06-08'),
	('202621', '037383', '386738', '3760', '2010-01-31', '2010-02-23'),
	('242226', '154878', '493551', '0539', '2014-04-22', '2014-04-24'),
	('256045', '037383', '406805', '2795', '2021-04-08', NULL),
	('027102', '423207', '180475', '1800', '2017-05-30', '2017-07-02'),
	('281029', '239509', '482870', '0552', '2015-12-24', '2015-12-30'),
	('317120', '373668', '406805', '1229', '2018-03-04', '2018-03-10'),
	('333460', '239509', '386738', '2565', '2019-08-30', '2019-09-03'),
	('349733', '373668', '493551', '2014', '2013-10-23', '2013-10-28'),
	('379627', '206262', '102837', '4791', '2011-05-01', '2011-05-02'),
	('393624', '224306', '319332', '3012', '2016-10-15', '2016-10-18'),
	('422865', '154878', '498892', '3012', '2019-11-16', '2019-11-29'),
	('425560', '154878', '498892', '0308', '2020-09-24', '2020-09-30'),
	('451819', '424410', '030936', '0308', '2011-06-14', '2011-06-18'),
	('490261', '473296', '388761', '2462', '2011-08-30', '2011-09-13');
ALTER TABLE `admission` ENABLE KEYS ;

/* Data for the Admission_Treatments table */
ALTER TABLE `admission_treatments` DISABLE KEYS ;
INSERT INTO `admission_treatments` (`A_TID`, `Treatment_ID`, `Admission_ID`, `TDoctor_ID`, `TDate`) VALUES
	('001', '001', '015916', '0112', '2017-10-25'),
	('010', '002', '199613', '0308', '2013-04-04'),
	('011', '026', '199613', '2942', '2013-04-05'),
	('012', '005', '199613', '2996', '2013-04-04'),
	('013', '023', '199613', '1750', '2013-04-05'),
	('014', '010', '202028', '1126', '2017-06-02'),
	('015', '005', '202621', '3169', '2010-01-31'),
	('016', '024', '202621', '1750', '2010-02-06'),
	('017', '021', '281029', '0552', '2015-12-25'),
	('018', '021', '317120', '1229', '2018-03-05'),
	('019', '027', '333460', '2565', '2019-09-23'),
	('002', '019', '015916', '2026', '2017-10-26'),
	('020', '007', '333460', '2014', '2019-08-30'),
	('021', '006', '333460', '2014', '2019-09-23'),
	('022', '027', '379627', '4791', '2011-05-02'),
	('023', '007', '379627', '4791', '2011-05-01'),
	('024', '027', '393624', '3012', '2016-10-15'),
	('025', '007', '393624', '3012', '2016-10-15'),
	('026', '015', '333460', '2565', '2019-08-30'),
	('027', '016', '379627', '4791', '2011-05-01'),
	('003', '006', '422865', '3012', '2016-10-16'),
	('004', '022', '425560', '1410', '2020-09-26'),
	('005', '025', '451819', '0789', '2011-06-14'),
	('006', '014', '490261', '1834', '2011-08-30'),
	('007', '005', '256045', '3169', '2021-04-08'),
	('008', '017', '256045', '3169', '2021-04-10'),
	('009', '020', '027102', '1767', '2017-06-09');
ALTER TABLE `admission_treatments` ENABLE KEYS ;	
	
/* Data for the Department table */
ALTER TABLE `department` DISABLE KEYS ;
INSERT INTO `department` (`Department_ID`, `Head_Doctor_ID`, `Dept_Name`, `Bldg_Name`, `Bldg_Floor`) VALUES
	('01', '0308', 'Internal Medicine', 'UNMH', '5'),
	('10', '3760', 'Critical Care Medicine', 'UNMHP', '2'),
	('11', '0539', 'Pathology', 'UNMH', '2'),
	('12', '1800', 'Psychiatry', 'Psychiatry', '4'),
	('13', '2942', 'Ophthalmology', 'UNMH', '1'),
	('14', '3456', 'Dermatology', 'UNMH', '4'),
	('15', '4791', 'Physical Medicine & Rehabilitation', 'Carrie Tingley', '1'),
	('02', '0789', 'Family Practice', 'FPTC', '1'),
	('03', '1229', 'Pediatrics', 'UNMH', '3'),
	('04', '1410', 'Obstetrics & Gynecology', 'UNMHP', '4'),
	('05', '1750', 'Surgery', 'UNMHP', '2'),
	('06', '2026', 'Neurology', 'CNC', '1'),
	('07', '2084', 'Radiology', 'UNMH', '1'),
	('08', '2565', 'Anesthesiology', 'UNMH', '2'),
	('09', '3012', 'Emergency Medicine', 'UNMH', '1');
ALTER TABLE `department` ENABLE KEYS ;

/* Data for the Doctor table */
ALTER TABLE `doctor` DISABLE KEYS ;
INSERT INTO `doctor` (`Doctor_ID`, `Department_ID`, `DF_Name`, `DL_Name`) VALUES
	('0112', '01', 'Cassandra', 'Huff'),
	('0198', '02', 'Janice', 'Love'),
	('0308', '01', 'Hugh', 'Luna'),
	('0539', '11', 'Raymond', 'Lambert'),
	('0552', '03', 'Jermaine', 'Bowen'),
	('0789', '02', 'Geneva', 'Nichols'),
	('0966', '04', 'Vanessa', 'Arnold'),
	('1126', '05', 'Opal', 'Fisher'),
	('1229', '03', 'Kimberly', 'Elliott'),
	('1410', '04', 'Beth', 'Joseph'),
	('1750', '05', 'Courtney', 'Boone'),
	('1767', '06', 'Russell', 'Brooks'),
	('1800', '12', 'Julie', 'Sutton'),
	('1834', '07', 'Diana', 'Garrett'),
	('1854', '08', 'Marvin', 'Roberts'),
	('2014', '09', 'Henry', 'Warner'),
	('2026', '06', 'Gerard', 'Baldwin'),
	('2084', '07', 'Marco', 'Taylor'),
	('2462', '10', 'Nora', 'Underwood'),
	('2565', '08', 'Vincent', 'Carlson'),
	('2795', '11', 'Eva', 'Reed'),
	('2902', '12', 'Gwen', 'Flowers'),
	('2942', '13', 'Lynette', 'McCarthy'),
	('2996', '13', 'Deborah', 'Crawford'),
	('3012', '09', 'Rodolfo', 'Pope'),
	('3169', '14', 'Conrad', 'Palmer'),
	('3456', '14', 'Justin', 'Bowen'),
	('3760', '10', 'Alfred', 'Manning'),
	('3990', '15', 'Celia', 'Steele'),
	('4791', '15', 'Rachel', 'Casey');
ALTER TABLE `doctor` ENABLE KEYS ;

/* Data for the Specialty table */
ALTER TABLE `specialty` DISABLE KEYS ;
INSERT INTO `specialty` (`Specialty_ID`, `S_Name`) VALUES
	('01', 'Infectious Disease'),
	('10', 'Allergy & Immunology'),
	('11', 'Geriatrics'),
	('12', 'General Dermatology'),
	('13', 'General Internal Medicine'),
	('14', 'Neurology'),
	('15', 'Obstetrics & Gynecology'),
	('16', 'Pathology'),
	('17', 'General Surgery'),
	('18', 'Orthopedic Surgery'),
	('19', 'Trauma Surgery'),
	('02', 'Nephrology'),
	('20', 'Cardiothoracic Surgery'),
	('21', 'Neurological Surgery'),
	('22', 'Urology'),
	('23', 'General Psychiatry'),
	('24', 'Addiction Psychiatry'),
	('25', 'Pediatric Psychiatry'),
	('26', 'Emergency Medicine'),
	('27', 'Family Practice'),
	('28', 'Pediatrics'),
	('29', 'General Radiology'),
	('03', 'Gastroenterology'),
	('30', 'Interventional Radiology'),
	('31', 'Ophthalmology'),
	('32', 'Dermatological Surgery'),
	('33', 'Anesthesiology'),
	('04', 'Endocrinology'),
	('05', 'Cardiology'),
	('06', 'Hematology & Oncology'),
	('07', 'Rheumatology'),
	('08', 'Pulmonology & Critical Care'),
	('09', 'Palliative Care');
ALTER TABLE `specialty` ENABLE KEYS ;

/* Data for Doctor_Specialty table */
ALTER TABLE `doctor_specialty` DISABLE KEYS ;
INSERT INTO `doctor_specialty` (`D_SID`, `Specialty_ID`, `Doctor_ID`) VALUES
	('01', '13', '0112'),
	('10', '13', '0308'),
	('11', '13', '2462'),
	('12', '13', '3760'),
	('13', '13', '0539'),
	('14', '13', '2795'),
	('15', '13', '1800'),
	('16', '33', '2902'),
	('17', '33', '2942'),
	('18', '05', '2996'),
	('19', '05', '3169'),
	('02', '26', '3456'),
	('20', '26', '3990'),
	('21', '23', '1126'),
	('22', '20', '1750'),
	('23', '17', '1767'),
	('24', '17', '2026'),
	('25', '29', '1834'),
	('26', '30', '2084'),
	('27', '01', '1854'),
	('28', '08', '2565'),
	('29', '08', '2014'),
	('03', '08', '4791'),
	('30', '08', '3012'),
	('31', '13', '2996'),
	('32', '13', '3169'),
	('33', '13', '1854'),
	('34', '13', '2565'),
	('35', '13', '2014'),
	('36', '13', '4791'),
	('37', '13', '3012'),
	('38', '17', '0198'),
	('04', '19', '0198'),
	('05', '21', '0789'),
	('06', '15', '0552'),
	('07', '15', '1229'),
	('08', '27', '0966'),
	('09', '22', '1410');
ALTER TABLE `doctor_specialty` ENABLE KEYS ;

/* Data for Treatment table */
ALTER TABLE `treatment` DISABLE KEYS ;
INSERT INTO `treatment` (`Treatment_ID`, `T_Description`) VALUES
	('001', 'Normal Saline IV, 1L'),
	('010', 'Psychiatric Evaluation'),
	('011', 'Radiofrequency Ablation, Thyroid Nodule'),
	('013', 'Nebulizer Treatment'),
	('014', 'Radiocontrast Administration'),
	('015', 'Central Line Placement, IJ'),
	('016', 'Central Line Placement, SC'),
	('017', 'Cardiac Catheterization'),
	('018', 'Percutaneous Coronary Intervention'),
	('019', 'Cholecystectomy, Endoscopic'),
	('002', 'Normal Saline IV, 500mL'),
	('020', 'Cholecystectomy, Open'),
	('021', 'Hysterectomy, Complete'),
	('022', 'Nephrolithiasis Lithotripsy'),
	('023', 'Coronary Artery Bypass, 3V'),
	('024', 'Aortic Valve Replacement'),
	('025', 'Craniotomy, Subdural Hematoma'),
	('026', 'Anesthesia, General'),
	('027', 'Anesthesia, ICU'),
	('028', 'Cardiopulmonary Resuscitation'),
	('029', 'Total Knee Replacement'),
	('003', 'Ringer\'s Lactate IV, 1L'),
	('030', 'Total Hip Replacement'),
	('004', 'Ringer\'s Lactate IV, 500mL'),
	('005', 'Electrocardiogram, 12-lead'),
	('006', 'Bronchoscopy'),
	('007', 'Ventilator Management'),
	('008', 'Esophagogastroduodenoscopy'),
	('009', 'Colonoscopy');
ALTER TABLE `treatment` ENABLE KEYS ;

SET FOREIGN_KEY_CHECKS = 1 ;  -- Re-enable foreign key checkup


/* Query #1 - For each inpatient, list all his admission records including patient’s
ID, name, the dates that the patient is admitted and released from the hospital, and the 
doctor (ID and name) who is in charge of this patient for this admission. */

SELECT a.Patient_ID, p.PL_Name, p.PF_Name, a.Admit_Date, a.Discharge_Date, a.ADoctor_ID, d.DF_Name, d.DL_Name
FROM HIIS.admission AS a
INNER JOIN HIIS.doctor AS d
ON a.ADoctor_ID = d.Doctor_ID
INNER JOIN HIIS.Patient AS P
ON p.Patient_ID = a.Patient_ID
;

/* Query #2 - For each patient, list the patient’s ID and name, the ID and name of the doctors who have ever been in charge
 of that patient’s admissions (not treatments!), and the number of times that doctor has been the doctor-in-charge for that patient. */

SELECT p.Patient_ID, p.PL_Name, p.PF_Name, d.Doctor_ID, d.DF_Name, d.DL_Name, COUNT(ADoctor_ID) AS NumOfTimesInCharge
FROM HIIS.patient AS p
INNER JOIN HIIS.admission AS a
ON p.Patient_ID = a.Patient_ID
INNER JOIN HIIS.doctor AS d
ON d.Doctor_ID = a.ADoctor_ID
GROUP BY ADoctor_ID
;

/* Query #3 - For each inpatient, list the patient’s ID, name, and all his emergency contact persons’ ID and name */

SELECT a.Patient_ID, p.PF_Name, p.PL_Name, e.EContact_ID, e.EF_Name, e.EL_Name
FROM HIIS.Admission AS a
INNER JOIN HIIS.Patient AS p
ON a.Patient_ID = p.Patient_ID
INNER JOIN HIIS.Emerg_Contact AS e
ON e.EContact_ID = a.EContact_ID
;

/* Query #4 - For a specific inpatient’s specific admission record (you can choose anyone in your system), 
list all his treatments including the patient’s ID, name, the dates of the treatments, each treatment description,
and each treatment’s doctor’s ID and name. */

SELECT a.Patient_ID, p.PL_Name, p.PF_Name, adt.TDate, t.T_Description, d.Doctor_ID, d.DF_Name, d.DL_Name
FROM HIIS.admission AS a
INNER JOIN HIIS.patient AS p
ON p.Patient_ID = a.Patient_ID
INNER JOIN HIIS.doctor AS d
ON d.Doctor_ID = a.ADoctor_ID
INNER JOIN HIIS.Admission_Treatments as adt
ON a.Admission_ID = adt.Admission_ID
INNER JOIN HIIS.Treatment AS t
ON t.Treatment_ID = adt.Treatment_ID
WHERE a.Admission_ID LIKE '015916'
;

/* Query#5 - For each doctor, list the doctor’s ID, name and all his specialties. */

SELECT d.Doctor_ID, d.DF_Name, d.DL_Name, s.S_Name
FROM doctor AS d
INNER JOIN doctor_specialty AS ds 
ON d.Doctor_ID = ds.Doctor_ID
INNER JOIN specialty AS s
ON ds.Specialty_ID = s.Specialty_ID
;

/* Query#6 - For each department, list the department name, its head doctor’s ID, name and his specialties. */

SELECT de.Dept_Name, de.Head_Doctor_ID, d.DF_Name, d.DL_Name, s.S_Name
FROM department AS de
INNER JOIN doctor AS d
ON de.Head_Doctor_ID = d.Doctor_ID
INNER JOIN doctor_specialty AS ds 
ON d.Doctor_ID = ds.Doctor_ID
INNER JOIN specialty AS s
ON ds.Specialty_ID = s.Specialty_ID
;

/* Query#7 - For each department, list the department name, all of its doctors’ IDs, names and the number of each doctor’s specialties. */

SELECT de.Dept_Name, temp.Doctor_ID, d.DF_Name, d.DL_Name, temp.No_of_Specialties
FROM 
(
	SELECT Doctor_ID, count(Specialty_ID) AS No_of_Specialties
	FROM doctor_specialty AS ds
	GROUP BY Doctor_ID
) AS temp
INNER JOIN doctor AS d
ON temp.Doctor_ID = d.Doctor_ID
INNER JOIN department AS de
ON d.Department_ID = de.Department_ID
ORDER BY de.Dept_Name
;