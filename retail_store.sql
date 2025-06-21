CREATE TABLE store_analysis (
ProductVariety INT,
MarketingSpend INT,
CustomerFootfall INT,
StoreSize INT,
EmployeeEfficiency DECIMAL(5,2),
StoreAge INT,
CompetitorDistance INT,
PromotionsCount INT,
EconomicIndicator DECIMAL(5,2),
StoreLocation VARCHAR(100),
StoreCategory VARCHAR(100),
MonthlySalesRevenue DECIMAL(10,2)
);

SELECT StoreCategory,
       ROUND(AVG(MonthlySalesRevenue), 2) AS AvgRevenue
FROM store_analysis
GROUP BY StoreCategory
ORDER BY AvgRevenue DESC;


SELECT StoreLocation,
       ROUND(SUM(MonthlySalesRevenue), 2) AS TotalRevenue
FROM store_analysis
GROUP BY StoreLocation
ORDER BY TotalRevenue DESC;

SELECT StoreLocation, StoreCategory, MonthlySalesRevenue
FROM store_analysis
ORDER BY MonthlySalesRevenue DESC
LIMIT 5;


SELECT PromotionsCount,
       ROUND(AVG(MonthlySalesRevenue), 2) AS AvgRevenue
FROM store_analysis
GROUP BY PromotionsCount
ORDER BY PromotionsCount;

SELECT CustomerFootfall, MonthlySalesRevenue
FROM store_analysis;

SELECT 
    CASE 
        WHEN StoreAge <= 5 THEN '0-5 yrs'
        WHEN StoreAge BETWEEN 6 AND 10 THEN '6-10 yrs'
        WHEN StoreAge BETWEEN 11 AND 20 THEN '11-20 yrs'
        WHEN StoreAge BETWEEN 21 AND 30 THEN '21-30 yrs'
        ELSE '30+ yrs'
    END AS StoreAgeGroup,
    ROUND(AVG(MonthlySalesRevenue), 2) AS AvgRevenue
FROM store_analysis
GROUP BY StoreAgeGroup
ORDER BY StoreAgeGroup;

SELECT 
    CASE 
        WHEN EmployeeEfficiency < 60 THEN 'Low'
        WHEN EmployeeEfficiency BETWEEN 60 AND 75 THEN 'Moderate'
        WHEN EmployeeEfficiency BETWEEN 76 AND 90 THEN 'High'
        ELSE 'Very High'
    END AS EfficiencyLevel,
    ROUND(AVG(MonthlySalesRevenue), 2) AS AvgRevenue
FROM store_analysis
GROUP BY EfficiencyLevel
ORDER BY AvgRevenue DESC;

SELECT EconomicIndicator, MonthlySalesRevenue
FROM store_analysis;

SELECT StoreSize, MonthlySalesRevenue
FROM store_analysis;

SELECT StoreLocation,
       ROUND(AVG(MonthlySalesRevenue), 2) AS AvgRevenue
FROM store_analysis
WHERE StoreCategory = 'Electronics'
GROUP BY StoreLocation
ORDER BY AvgRevenue DESC
LIMIT 5;

SELECT ProductVariety, MonthlySalesRevenue
FROM store_analysis;
