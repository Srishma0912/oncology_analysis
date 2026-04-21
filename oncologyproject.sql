-- “This project analyzes oncology treatment outcomes to evaluate survival rates,
-- cost efficiency, and hospital performance using SQL.”


SELECT patient_ID, COUNT(patient_ID) 
FROM cancer_treatment_performance_global_kpis_dataset 
GROUP BY patient_ID 
HAVING COUNT(patient_ID) > 1;
 # output of patients id who apperad more than once
 #Found zero duplicates 

select patient_ID,Diagnosis,Treatment_Cost_USD
from cancer_treatment_performance_global_kpis_dataset
where Patient_ID IS NULL 
   OR Diagnosis IS NULL
   OR Treatment_Cost_USD IS NULL;  #NO null values found 
 
select Stage,Survival_Status,Hospital
from cancer_treatment_performance_global_kpis_dataset
where Hospital IS NULL 
   OR Survival_Status IS NULL
   OR Stage IS NULL;  #NO null values found 
   
SELECT * FROM cancer_treatment_performance_global_kpis_dataset 
WHERE End_Date < Start_Date;   # No end date before start date  

SELECT DISTINCT Stage FROM cancer_treatment_performance_global_kpis_dataset;
SELECT DISTINCT Hospital FROM cancer_treatment_performance_global_kpis_dataset; 
 
 # The total money spent, the average cost per patient, and the total number of patients.
 select SUM(Treatment_Cost_USD) , AVG(Treatment_Cost_USD),count(patient_Id)
 from cancer_treatment_performance_global_kpis_dataset;
 # sum-15824733.199999996,avg-35166.07377777777,total patients - 450
 
 
SELECT MIN(Treatment_Cost_USD), MAX(Treatment_Cost_USD),SUM(CASE WHEN Survival_Status = 'Alive' THEN 1 ELSE 0 END) AS Saved_Count
FROM cancer_treatment_performance_global_kpis_dataset; 
# Minimum Treatment cost is 14773.35,max is 58091.61, avg is 35166.07377777777,saved-277

#AVG TIME TAKES TO CURE - 62.4286
SELECT AVG(Time_to_Response_Days) FROM cancer_treatment_performance_global_kpis_dataset WHERE Outcome = 'Remission';
#We spent $15.8M to save 277 lives, and it takes an average of 62.42 days to reach remission when caught in the early stages.


SELECT HOSPITAL, AVG(Treatment_Cost_USD) FROM cancer_treatment_performance_global_kpis_dataset
Group by Hospital
ORDER BY AVG(Treatment_Cost_USD) DESC;
# sloan kettering is costing more comparatively

#is sloan kettering hospital worth the cost?
select Hospital,COUNT(*) AS Total_Patients,sum(case when Survival_Status='ALIVE' THEN 1 ELSE 0 END) AS SURVIVED from   cancer_treatment_performance_global_kpis_dataset
where Hospital='Sloan Kettering';
# out of 84 patients 52 patients survived in sloan kettering

SELECT 
    Hospital,
    COUNT(*) AS Total_Patients,
    SUM(CASE WHEN Stage = 'Stage IV' THEN 1 ELSE 0 END) AS High_Difficulty_Cases,
    ROUND(SUM(CASE WHEN Stage = 'Stage IV' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Percentage_Hard_Cases,
    ROUND(SUM(CASE WHEN Survival_Status = 'Alive' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Overall_Survival_Rate
FROM cancer_treatment_performance_global_kpis_dataset
GROUP BY Hospital
ORDER BY Overall_Survival_Rate DESC;


#The Performance Leader: Mayo Clinic has the highest survival rate (63.74%).
#The "Efficiency" Winner: They achieved this high survival rate while handling a higher percentage of difficult cases (27.47%) than Sloan Kettering (21.43%).
#The Value Proposition: As you noted, their pricing is in the "middle." They aren't the cheapest, but they aren't the most expensive. This makes them the best "Return on Health Investment."


#drug used by mayo clinic
SELECT 
    Drug_Regimen, 
    COUNT(*) AS Usage_Count,
    ROUND(SUM(CASE WHEN Survival_Status = 'Alive' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Success_Rate
FROM cancer_treatment_performance_global_kpis_dataset
WHERE Hospital = 'Mayo Clinic'
GROUP BY Drug_Regimen
ORDER BY Success_Rate DESC;

SELECT Hospital,COUNT(*) AS Total_Patients,
    ROUND(SUM(CASE WHEN Survival_Status = 'Alive' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Global_Survival_Rate_Pct,
    ROUND(AVG(Treatment_Cost_USD), 2) AS Avg_Treatment_Cost,
    ROUND(SUM(CASE WHEN Stage = 'Stage IV' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Stage_IV_Load_Pct,
    ROUND(SUM(CASE WHEN Stage = 'Stage IV' AND Survival_Status = 'Alive' THEN 1 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN Stage = 'Stage IV' THEN 1 ELSE 0 END), 0), 2) AS Stage_IV_Survival_Pct

FROM cancer_treatment_performance_global_kpis_dataset
GROUP BY Hospital
ORDER BY Global_Survival_Rate_Pct DESC;

SELECT Hospital,
       COUNT(*) AS total,
       SUM(CASE WHEN Survival_Status = 'Alive' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS survival_rate
FROM cancer_treatment_performance_global_kpis_dataset
GROUP BY Hospital;

#Mayo Clinic shows the highest survival rate (63.7%), followed by Sloan Kettering (61.9%) and MD Anderson (61.6%).
-- Differences are relatively small, suggesting broadly comparable outcomes across top hospitals.


/*
================================================================================
PROJECT OUTCOME & EXECUTIVE SUMMARY
================================================================================

1. KEY FINDINGS:
   - Global Survival Rate: 61.5% with an average treatment cost of $35,166.
   - Efficiency Winner: Mayo Clinic achieved the highest global survival (63.74%) 
     while maintaining mid-tier pricing ($35,129).
   - Specialty Leader: Johns Hopkins is the "Stage IV Specialist," achieving a 
     remarkable 85% survival rate for the most critical cases.
   - Cost-Quality Gap: Sloan Kettering is the most expensive ($35,922) but 
     underperforms compared to Mayo Clinic in overall survival.

2. TREATMENT INSIGHTS:
   - Regimen D is the "Clinical Gold Standard," showing a 70.83% success rate 
     at Mayo Clinic and high reliability across the entire dataset.

3. STRATEGIC RECOMMENDATIONS:
   - referral Strategy: Route Stage IV patients to Johns Hopkins for specialized care.
   - Protocol Standardization: Adopt Regimen D and B protocols globally to 
     increase survival rates toward the 70% benchmark.
   - Value-Based Care: Use Cleveland Clinic as the model for cost-efficiency 
     ($34,407 avg cost).

================================================================================
*/
