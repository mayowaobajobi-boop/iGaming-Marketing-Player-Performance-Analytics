/*
 iGaming analytics portfolio — Acquisition and campaigns
 Attribution and deposit-to-cost metrics are illustrative.
 They do NOT constitute validated marketing attribution or financial ROI.
*/
USE GamingMS;
GO

-- Campaign registrations and cost per registered player.
WITH RegistrationsPerCampaign AS (
    SELECT CampaignId, COUNT(DISTINCT PlayerId) AS RegisteredPlayers
    FROM dbo.Registration
    GROUP BY CampaignId
)
SELECT c.CampaignId, c.CampaignName, t.TrafficSourceName, c.CampaignCost,
       COALESCE(r.RegisteredPlayers, 0) AS RegisteredPlayers,
       1.0 * c.CampaignCost / NULLIF(r.RegisteredPlayers, 0) AS CostPerRegistration
FROM dbo.Campaigns AS c
LEFT JOIN dbo.TrafficSources AS t ON t.TrafficSourceId = c.TrafficSourceId
LEFT JOIN RegistrationsPerCampaign AS r ON r.CampaignId = c.CampaignId
ORDER BY RegisteredPlayers DESC, c.CampaignId;
GO

-- First recorded registration attribution per player.
-- First recorded deposit is treated as an FTD proxy; status is not filtered.
WITH FirstRegistration AS (
    SELECT PlayerId, CampaignId, RegistrationDate,
           ROW_NUMBER() OVER (
               PARTITION BY PlayerId
               ORDER BY RegistrationDate, RegistrationID
           ) AS rn
    FROM dbo.Registration
), FirstDeposit AS (
    SELECT PlayerId, MIN(DepositDate) AS FirstDepositDate
    FROM dbo.Deposit
    GROUP BY PlayerId
), CampaignConversions AS (
    SELECT r.CampaignId,
           COUNT(*) AS RegisteredPlayers,
           SUM(CASE WHEN f.FirstDepositDate >= r.RegistrationDate
                    THEN 1 ELSE 0 END) AS FTDPlayers
    FROM FirstRegistration AS r
    LEFT JOIN FirstDeposit AS f ON f.PlayerId = r.PlayerId
    WHERE r.rn = 1
    GROUP BY r.CampaignId
)
SELECT c.CampaignId, c.CampaignName,
       COALESCE(x.RegisteredPlayers, 0) AS RegisteredPlayers,
       COALESCE(x.FTDPlayers, 0) AS FTDPlayers,
       100.0 * x.FTDPlayers / NULLIF(x.RegisteredPlayers, 0) AS FTDConversionPct,
       1.0 * c.CampaignCost / NULLIF(x.FTDPlayers, 0) AS CostPerFTD
FROM dbo.Campaigns AS c
LEFT JOIN CampaignConversions AS x ON x.CampaignId = c.CampaignId
ORDER BY FTDPlayers DESC, c.CampaignId;
GO

-- Traffic-source registration count, avoiding many-to-many duplication.
SELECT t.TrafficSourceName,
       COUNT(DISTINCT r.PlayerId) AS RegisteredPlayers
FROM dbo.TrafficSources AS t
LEFT JOIN dbo.Campaigns AS c ON c.TrafficSourceId = t.TrafficSourceId
LEFT JOIN dbo.Registration AS r ON r.CampaignId = c.CampaignId
GROUP BY t.TrafficSourceName
ORDER BY RegisteredPlayers DESC;
GO
