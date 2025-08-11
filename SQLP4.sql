use PortfolioProject_MarketingAnalytics
-- Query to Categorize Products based on their price
SELECT 
    ProductID,
    ProductName,
	Price,
    CASE
        WHEN Price < 50  THEN 'LOW'       
        WHEN Price  Between 50 AND 200 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS PriceCategory
FROM dbo.products;
