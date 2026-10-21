/*
 Read-only checks to perform before comparing SQL outputs with Power BI.
 Review any non-zero exception counts; they may indicate data quality issues.
*/
USE GamingMS;
GO

-- Dataset volumes
SELECT 'Players' AS TableName, COUNT(*) AS RowCount FROM dbo.Players
UNION ALL SELECT 'Registration', COUNT(*) FROM dbo.Registration
UNION ALL SELECT 'Deposit', COUNT(*) FROM dbo.Deposit
UNION ALL SELECT 'Session', COUNT(*) FROM dbo.Session
UNION ALL SELECT 'Bet', COUNT(*) FROM dbo.Bet;
GO

-- Deposits without matching players
SELECT COUNT(*) AS DepositsWithoutPlayer
FROM dbo.Deposit AS d
LEFT JOIN dbo.Players AS p ON p.PlayerId = d.PlayerId
WHERE p.PlayerId IS NULL;
GO

-- Bets without a session; sessions without a player.
SELECT COUNT(*) AS BetsWithoutSession
FROM dbo.Bet AS b
LEFT JOIN dbo.Session AS s ON s.SessionId = b.SessionId
WHERE s.SessionId IS NULL;
GO

SELECT COUNT(*) AS SessionsWithoutPlayer
FROM dbo.Session AS s
LEFT JOIN dbo.Players AS p ON p.PlayerId = s.PlayerId
WHERE p.PlayerId IS NULL;
GO

-- Duplicate IDs should not exist for documented primary-key fields.
SELECT PlayerId, COUNT(*) AS Occurrences
FROM dbo.Players
GROUP BY PlayerId
HAVING COUNT(*) > 1;
GO

-- Check potentially invalid commercial or temporal values.
SELECT
    SUM(CASE WHEN BetAmount < 0 THEN 1 ELSE 0 END) AS NegativeBetAmounts,
    SUM(CASE WHEN WinAmount < 0 THEN 1 ELSE 0 END) AS NegativeWinAmounts,
    SUM(CASE WHEN BetDate IS NULL THEN 1 ELSE 0 END) AS MissingBetDates
FROM dbo.Bet;
GO

SELECT
    SUM(CASE WHEN Amount < 0 THEN 1 ELSE 0 END) AS NegativeDeposits,
    SUM(CASE WHEN DepositDate IS NULL THEN 1 ELSE 0 END) AS MissingDepositDates
FROM dbo.Deposit;
GO

-- Inspect status vocabulary before filtering out failed/pending transactions.
SELECT COALESCE(Status, '(NULL)') AS DepositStatus, COUNT(*) AS Transactions
FROM dbo.Deposit
GROUP BY Status
ORDER BY Transactions DESC;
GO
