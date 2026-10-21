/*
 iGaming analytics portfolio — Executive reporting
 Read-only T-SQL. Run sections individually against GamingMS.
 Amounts reflect the available rows; apply reporting filters as required.
*/
USE GamingMS;
GO

-- Player population and recorded first deposits (all recorded statuses).
SELECT
    (SELECT COUNT(*) FROM dbo.Players) AS TotalPlayers,
    (SELECT COUNT(*) FROM dbo.Registration) AS RegistrationEvents,
    (SELECT COUNT(DISTINCT PlayerId) FROM dbo.Deposit) AS PlayersWithDeposit;
GO

-- Overall betting performance: turnover, winnings and GGR.
SELECT
    COUNT(*) AS BetCount,
    CAST(SUM(BetAmount) AS decimal(18, 2)) AS TotalStakes,
    CAST(SUM(WinAmount) AS decimal(18, 2)) AS TotalWins,
    CAST(SUM(BetAmount - WinAmount) AS decimal(18, 2)) AS GGR
FROM dbo.Bet;
GO

-- Monthly stakes, winnings and GGR.
SELECT
    DATEFROMPARTS(YEAR(BetDate), MONTH(BetDate), 1) AS BetMonth,
    COUNT(*) AS BetCount,
    SUM(BetAmount) AS TotalStakes,
    SUM(WinAmount) AS TotalWins,
    SUM(BetAmount - WinAmount) AS GGR
FROM dbo.Bet
WHERE BetDate IS NOT NULL
GROUP BY DATEFROMPARTS(YEAR(BetDate), MONTH(BetDate), 1)
ORDER BY BetMonth;
GO

-- Monthly recorded deposits and month-over-month difference.
WITH MonthlyDeposits AS (
    SELECT DATEFROMPARTS(YEAR(DepositDate), MONTH(DepositDate), 1) AS DepositMonth,
           COUNT(*) AS DepositTransactions,
           COUNT(DISTINCT PlayerId) AS DistinctDepositors,
           SUM(Amount) AS DepositAmount
    FROM dbo.Deposit
    WHERE DepositDate IS NOT NULL
    GROUP BY DATEFROMPARTS(YEAR(DepositDate), MONTH(DepositDate), 1)
), Compared AS (
    SELECT *,
           LAG(DepositAmount) OVER (ORDER BY DepositMonth) AS PreviousMonthDeposit
    FROM MonthlyDeposits
)
SELECT DepositMonth, DepositTransactions, DistinctDepositors, DepositAmount,
       PreviousMonthDeposit,
       DepositAmount - PreviousMonthDeposit AS MoMChange,
       100.0 * (DepositAmount - PreviousMonthDeposit)
           / NULLIF(PreviousMonthDeposit, 0) AS MoMChangePct
FROM Compared
ORDER BY DepositMonth;
GO
