use PortfolioProject_MarketingAnalytics
--CTE to identify duplicate records
WITH DuplicateRecords AS (
    SELECT 
        JourneyID,
        CustomerID,
        ProductID,
        VisitDate,
        Stage,
        Action,
        Duration,
        ROW_NUMBER() OVER (        --Assign a unique row number within the partition
        PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action --groups the rows based on specific column that should be unique
            ORDER BY JourneyID
        ) AS row_num
    FROM customer_journey
)
--Select all records from cte where row_num>1 which indicates duplicate records
 select * from DuplicateRecords
 where row_num > 1
 order by JourneyID



 --Data has been cleaned and filled the duration nulls
SELECT
    JourneyID,
    CustomerID,
    ProductID,
    VisitDate,
    Stage,
    Action,
    COALESCE(Duration, avg_duration) AS Duration
FROM
    (
        SELECT
            JourneyID,
            CustomerID,
            ProductID,
            VisitDate,
            UPPER(Stage) AS Stage,
            Action,
            Duration,
            AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration, -- Gets the average duration for each VisitDate
            ROW_NUMBER() OVER(
                PARTITION BY CustomerID, ProductID, VisitDate, UPPER(Stage), ACTION
                ORDER BY JourneyID
            ) AS row_num
        FROM
            customer_journey
    ) AS subquery
WHERE
    row_num = 1 