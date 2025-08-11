use PortfolioProject_MarketingAnalytics

--Query to clean whitespace issues in the ReviewText column
SELECT ReviewID,
       CustomerID,
       ProductID,
       ReviewDate,
       Rating,
       REPLACE(ReviewText, '  ', ' ') AS ReviewText --cleans up text by replacing double spaces with single spaces
	  FROM customer_reviews
