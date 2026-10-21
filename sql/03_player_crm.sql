/*
 iGaming analytics portfolio — Player and CRM
 Status is a snapshot; it does not establish cohort churn or retention.
 Value thresholds are illustrative rather than verified BI business rules.
*/
USE GamingMS;
GO

-- Current recorded player statuses.
SELECT COALESCE(Status, 'Unknown') AS PlayerStatus,
       COUNT(*) AS Players
FROM dbo.Players
GROUP BY COALESCE(Status, 'Unknown')
ORDER BY Players DESC;
GO

-- Lifetime recorded deposits per player and illustrative value bands.
WITH LifetimeDeposit AS (
    SELECT p.PlayerId, p.Status,
           COALESCE(SUM(d.Amount), 0) AS TotalDeposit
    FROM dbo.Players AS p
    LEFT JOIN dbo.Deposit AS d ON d.PlayerId = p.PlayerId
    GROUP BY p.PlayerId, p.Status
)
SELECT PlayerId, Status, TotalDeposit,
       CASE
           WHEN TotalDeposit >= 50000 THEN 'VIP'
           WHEN TotalDeposit >= 10000 THEN 'High Value'
           WHEN TotalDeposit >= 1000 THEN 'Regular'
           ELSE 'Low Value'
       END AS IllustrativeSegment
FROM LifetimeDeposit
ORDER BY TotalDeposit DESC, PlayerId;
GO

-- Top players by lifetime recorded deposit (tie-aware).
WITH LifetimeDeposit AS (
    SELECT PlayerId, SUM(Amount) AS TotalDeposit
    FROM dbo.Deposit
    GROUP BY PlayerId
), Ranked AS (
    SELECT PlayerId, TotalDeposit,
           DENSE_RANK() OVER (ORDER BY TotalDeposit DESC) AS DepositRank
    FROM LifetimeDeposit
)
SELECT PlayerId, TotalDeposit, DepositRank
FROM Ranked
WHERE DepositRank <= 10
ORDER BY DepositRank, PlayerId;
GO

-- Latest recorded deposit per player, with deterministic tie-breaking.
WITH RankedDeposits AS (
    SELECT PlayerId, DepositId, DepositDate, Amount,
           ROW_NUMBER() OVER (
               PARTITION BY PlayerId
               ORDER BY DepositDate DESC, DepositId DESC
           ) AS rn
    FROM dbo.Deposit
)
SELECT PlayerId, DepositId, DepositDate, Amount
FROM RankedDeposits
WHERE rn = 1
ORDER BY PlayerId;
GO
