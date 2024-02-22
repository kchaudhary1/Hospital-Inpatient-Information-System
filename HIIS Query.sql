/* Query #1 - •	For each inpatient, list all his admission records including patient’s
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

SELECT p.Patient_ID, p.PL_Name, p.PF_Name, d.DF_Name, d.DL_Name, COUNT(a.ADoctor_ID) AS NumOfTimesInCharge
FROM HIIS.patient AS p
INNER JOIN HIIS.admission AS a
ON p.Patient_ID = a.Patient_ID
INNER JOIN HIIS.doctor AS d
ON d.Doctor_ID = a.ADoctor_ID
GROUP BY a.ADoctor_ID
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

SELECT p.PL_Name, p.PF_Name, a.Patient_ID, adt.A_TID, adt.TDate, t.T_Description, d.Doctor_ID, d.DF_Name, d.DL_Name
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

USE hiis ;
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

-- Query#5 - For each doctor, list the doctor’s ID, name and all his specialties. 
USE Hiis;
SELECT d.Doctor_ID, d.DF_Name, d.DL_Name, s.S_Name
FROM doctor AS d
INNER JOIN doctor_specialty AS ds 
ON d.Doctor_ID = ds.Doctor_ID
INNER JOIN specialty AS s
ON ds.Specialty_ID = s.Specialty_ID
;

-- Query#6 - For each department, list the department name, its head doctor’s ID, name and his specialties.
USE hiis ;
SELECT de.Dept_Name, de.Head_Doctor_ID, d.DF_Name, d.DL_Name, s.S_Name
FROM department AS de
INNER JOIN doctor AS d
ON de.Head_Doctor_ID = d.Doctor_ID
INNER JOIN doctor_specialty AS ds 
ON d.Doctor_ID = ds.Doctor_ID
INNER JOIN specialty AS s
ON ds.Specialty_ID = s.Specialty_ID
;

-- Query#7 - For each department, list the department name, all of its doctors’ IDs, names and the number of each doctor’s specialties. 
USE hiis ;
SELECT de.Dept_Name, d.Doctor_ID, d.DF_Name, d.DL_Name, COUNT(S_Name) AS No_Of_Specialities 
FROM department AS de 
INNER JOIN doctor AS d
ON de.Head_Doctor_ID = d.Doctor_ID
INNER JOIN doctor_specialty AS ds
ON d.Doctor_ID = ds.Doctor_ID
INNER JOIN specialty AS s 
ON ds.Specialty_ID = s.Specialty_ID
GROUP BY de.Dept_Name, de.Head_Doctor_ID, d.DF_Name, d.DL_Name
;

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

SELECT a.Patient_ID, p.PL_Name, p.PF_Name, adt.A_TID, adt.TDate, t.T_Description, d.Doctor_ID, d.DF_Name, d.DL_Name
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