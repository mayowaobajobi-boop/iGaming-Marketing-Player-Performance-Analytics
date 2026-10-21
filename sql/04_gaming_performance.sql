/*
 iGaming analytics portfolio — Gaming performance
 GGR = stakes minus wins; no bonus, tax or operating expense adjustment.
*/
USE GamingMS;
GO

-- Game categories by stakes, payouts and GGR.
SELECT gc.GameCategoryName,
       COUNT(*) AS BetCount,
       SUM(b.BetAmount) AS TotalStakes,
       SUM(b.WinAmount) AS TotalWins,
       SUM(b.BetAmount - b.WinAmount) AS GGR
FROM dbo.Bet AS b
INNER JOIN dbo.Games AS g ON g.GameId = b.GameId
INNER JOIN dbo.GameCategory AS gc ON gc.GameCategoryId = g.GameCategoryId
GROUP BY gc.GameCategoryName
ORDER BY GGR DESC;
GO

-- Provider performance.
SELECT gp.GameProviderName,
       COUNT(*) AS BetCount,
       SUM(b.BetAmount) AS TotalStakes,
       SUM(b.WinAmount) AS TotalWins,
       SUM(b.BetAmount - b.WinAmount) AS GGR
FROM dbo.Bet AS b
INNER JOIN dbo.Games AS g ON g.GameId = b.GameId
INNER JOIN dbo.GameProvider AS gp ON gp.GameProviderId = g.GameProviderId
GROUP BY gp.GameProviderName
ORDER BY GGR DESC;
GO

-- Top games by GGR.
SELECT TOP (10)
       g.GameId, g.GameName, COUNT(*) AS BetCount,
       SUM(b.BetAmount - b.WinAmount) AS GGR
FROM dbo.Bet AS b
INNER JOIN dbo.Games AS g ON g.GameId = b.GameId
GROUP BY g.GameId, g.GameName
ORDER BY GGR DESC, g.GameId;
GO

-- Monthly and cumulative GGR: aggregate to month before running total.
WITH MonthlyGGR AS (
    SELECT DATEFROMPARTS(YEAR(BetDate), MONTH(BetDate), 1) AS BetMonth,
           SUM(BetAmount - WinAmount) AS GGR
    FROM dbo.Bet
    WHERE BetDate IS NOT NULL
    GROUP BY DATEFROMPARTS(YEAR(BetDate), MONTH(BetDate), 1)
)
SELECT BetMonth, GGR,
       SUM(GGR) OVER (
           ORDER BY BetMonth ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS CumulativeGGR
FROM MonthlyGGR
ORDER BY BetMonth;
GO
