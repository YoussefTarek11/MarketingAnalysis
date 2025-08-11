use PortfolioProject_MarketingAnalytics

--Query to clean and normalize the engagement_data table
SELECT EngagementID
      ,ContentID
      ,CampaignID
      ,ProductID
	  ,UPPER(REPLACE(ContentType,'Socialmedia','Social Media')) as ContentType
      ,LEFT(ViewsClicksCombined,CHARINDEX('-',ViewsClicksCombined) -1 ) AS Views
	  ,RIGHT(ViewsClicksCombined,LEN(ViewsClicksCombined) - CHARINDEX('-',ViewsClicksCombined)) AS CLICKS
	  ,Likes
	  ,EngagementDate
	  
FROM engagement_data
  WHERE ContentType <> 'NEWSLETTER'  --FILTER out rows with NewsLetter as they are not relevant for our analysis
