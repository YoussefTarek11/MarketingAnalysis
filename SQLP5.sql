use PortfolioProject_MarketingAnalytics
--SQL Statement to join dim_customers with dim_geography to enrich customer data with geographic information
select c.CustomerID,
       c.GeographyID,
	   c.CustomerName,
	   c.Gender,
	   c.Age,
	   g.Country,
	   g.City
from customers c
 join
geography g
on c.GeographyID=g.GeographyID



--Customer Population for Campaign Targeting
select g.city,
       count(c.CustomerID) AS 'Population' 
	   from customers c
join
geography g 
on c.GeographyID = g.GeographyID 
group by g.city 

