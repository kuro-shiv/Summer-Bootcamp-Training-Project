SELECT*FROM patients
SELECT COUNT(*) AS TotalPatients
FROM patients;

SELECT*FROM visits
SELECT COUNT(*) AS TotalVisits
FROM visits ;

SELECT*FROM lab_results
SELECT COUNT(*) AS Total_labresults
FROM lab_results ;


SELECT*FROM diagnosis
SELECT COUNT(*) AS Totaldiagnosis
FROM diagnosis ;



SELECT*FROM medications
SELECT COUNT(*) AS Totalmedications
FROM medications ;

SELECT v.visit_id,v.visit_date,v.systolic_bp,v.ecg_result,p.age,p.gender,p.bmi,p.smoking,p.alcohol,p.exercise_hours_per_week, p.family_history,p.stress_level
FROM visits v INNER JOIN patients p 
ON v.patient_id = p.patient_id;

SELECT l.lab_result_id, l.ldl_cholesterol,l.hdl_cholesterol,l.triglycerides,l.troponin_level,l.crp_level,l.hba1c,l.platelet_count,l.wbc, d.diagnosis_id,
 d.disease_type, d.severity,d.symptoms 
FROM lab_results l INNER JOIN diagnosis d 
ON l.visit_id = d.visit_id;

SELECT  d.diagnosis_id,d.disease_type, d.severity,d.symptoms, m.medication_id,m.drug_name,m.dosage_mg,m.duration_days 
FROM diagnosis d  INNER JOIN medications m 
ON d.visit_id = m.visit_id;

SELECT patient_id, COUNT(*) AS visit_count
FROM visits
GROUP BY patient_id;

SELECT YEAR(visit_date) AS visit_year, COUNT(DISTINCT patient_id) AS patient_count
FROM visits
GROUP BY YEAR(visit_date)
ORDER BY visit_year;

SELECT gender, COUNT(DISTINCT patient_id) AS patient_count
FROM patients
GROUP BY gender;

SELECT CASE
    WHEN age < 30 THEN '<30'
    WHEN age BETWEEN 30 AND 45 THEN '30-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '61+'
  END AS age_group,COUNT(DISTINCT patient_id) AS patient_count
FROM patients GROUP BY CASE
    WHEN age < 30 THEN '<30'
    WHEN age BETWEEN 30 AND 45 THEN '30-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '61+'
  END;

SELECT stress_level, COUNT(DISTINCT patient_id) AS patient_count
FROM patients
GROUP BY stress_level;

SELECT smoking, COUNT(DISTINCT patient_id) AS patient_count
FROM patients
GROUP BY smoking;

SELECT alcohol, COUNT(DISTINCT patient_id) AS patient_count
FROM patients
GROUP BY alcohol;


SELECT COUNT(*) AS TotalDiagnoses FROM diagnosis;


SELECT disease_type, COUNT(*) AS Cases
FROM diagnosis
GROUP BY disease_type
ORDER BY Cases DESC;



SELECT severity, COUNT(*) AS Count
FROM diagnosis
GROUP BY severity
ORDER BY Count DESC;



SELECT symptoms, COUNT(*) AS Frequency
FROM diagnosis
GROUP BY symptoms
ORDER BY Frequency DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;


SELECT * FROM diagnosis
WHERE severity = 'Severe';

SELECT * FROM diagnosis
WHERE severity = 'Moderate';

SELECT * FROM diagnosis
WHERE severity = 'MILD';



SELECT * FROM diagnosis
WHERE visit_id = 'V2741';


SELECT visit_id, COUNT(*) AS visit_count
FROM diagnosis
GROUP BY visit_id
ORDER BY visit_count DESC;

SELECT TOP 10 visit_id, COUNT(*) AS visit_count
FROM diagnosis
GROUP BY visit_id
ORDER BY visit_count DESC;


SELECT disease_type, COUNT(*) AS total_cases
FROM diagnosis
GROUP BY disease_type
ORDER BY total_cases DESC;
