

Create Database GamingMS

Use GamingMS

--Countries
Create Table Countries (
CountryId Int Primary Key,
CountryName Nvarchar(100))

Select * From Countries


--Players
Create Table Players (
PlayerId Int Primary Key,
UserName Nvarchar(50) Not Null,
FirstName Nvarchar(50),
LastName Nvarchar(50),
Email Nvarchar(100),
Gender Varchar(10),
DateOfBirth Date,
CountryId Int,
RegistationDate Date,
Status Nvarchar(20),
Foreign Key(CountryId) References Countries(CountryId))

Select * From Players

Alter Table Player
Add 

/*Drop Table Players
Alter Table PushNotification
Drop Constraint
FK__PushNotif__Playe__797309D9

Delete From Players*/


---Player Segments
Create Table PlayerSegment (
SegmentId Int Primary Key,
SegmentName Nvarchar(50))

Select * From PlayerSegment

/*
Insert Into PlayerSegment(SegmentId,SegmentName)
Values (101, 'New'),
	  (102, 'Active'),
	  (103, 'Vip'),
	  (104, 'High Roller'),
	  (105, 'At Risk'),
	  (106, 'Churned')
	  */

----Vip Level
Create Table VipLevel(
VipLevelId Int Primary KEY,
VipLevelName Nvarchar(50),
MinimumPoints Int)

Select * From VipLevel

Insert Into VipLevel( VipLevelId, VipLevelName,MinimumPoints)
Values (212, 'Bronze', 0),
        (213, 'Silver', 1000),
		(214, 'Gold', 5000),
		(215, 'Platinum', 15000),
		(216, 'Diamond', 50000),
		(217, 'Elite', 100000)


--Traffic Sources
Create Table TrafficSources(
TrafficSourceID Int Primary Key,
TrafficSourceName Nvarchar(50))

Select * From TrafficSource

/*Insert Into TrafficSources (TrafficSourceID, TrafficSourceName)
Values (401, 'Google'),
        (402, 'Facebook'),
		(403, 'TikTok'),
		(404, 'Organic'),
		(405, 'Email'),
		(406, 'Affiliate'),
		(407, 'Seo') */



--Campaigns
Create Table Campaigns (
CampaignId Int Primary Key,
CampaignName Nvarchar(50),
TrafficSourceId Int,
CampaignCost Decimal(12,2),
StartDate Date,
EndDate Date,
Foreign Key(TrafficSourceId) References TrafficSources(TrafficSourceId))

Select * From Campaigns

Insert Into Campaigns (CampaignId, CampaignName, TrafficSourceId, CampaignCost, StartDate,EndDate)
Values 

/*
(57, 'Campaign57',	406,	36241.99,	'2023-08-16',	'2024-06-10'),
(58, 'Campaign58',	405,	9105.66,	'2023-05-09',	'2025-05-20'),
(59, 'Campaign59',  407,	 33726.7,	'2024-01-06',	'2023-09-04'),
(60, 'Campaign60',	406,	44428.13,	'2024-02-20',	'2024-05-14'),
(61, 'Campaign61',	402,	32718.86,	'2025-06-05',	'2023-05-23'),
(62, 'Campaign62',	402,	23578.59,	'2023-03-16',	'2024-04-11'),
(63, 'Campaign63',	401,	48395.82,	'2023-10-24',	'2023-10-03'),
(64, 'Campaign64',	406,	40341.4,	'2023-07-19',	'2023-04-20'),
(65, 'Campaign65',	402,	28477.11,	'2025-05-21',	'2024-02-23'),
(66, 'Campaign66',	407,	10686.61,	'2024-08-10',	'2024-08-11'),
(67, 'Campaign67',	406,	8077.84,	'2024-10-07',	'2024-08-01'),
(68, 'Campaign68',	407,	10129.37,	'2024-11-01',	'2024-02-27'),
(69, 'Campaign69',	402,	26271.59,	'2023-12-17',	'2025-04-19'),
(70, 'Campaign70',	405,	44467.99,	'2024-11-15',	'2024-10-13'),
(71, 'Campaign71',	406,	13624.96,	'2024-10-27',	'2025-04-11'),
(72,'Campaign72',	402,	22438.49,	'2023-03-11',	'2023-09-28'),
(73, 'Campaign73',	406,	33767.46,	'2023-10-15',	'2024-06-20'),
(74, 'Campaign74',	402,	13107.41,	'2023-11-27',	'2023-03-21'),
(75, 'Campaign75',	407,	39963.59,	'2024-02-18',	'2023-07-15') */



Select * From Campaigns


----Registrations
Create Table Registration (
RegistrationID Int Primary Key,
PlayerId Int,
CampaignId Int,
RegistrationDate Date,
Foreign Key (PlayerId) References Players(PlayerId),
Foreign Key (CampaignId) References Campaigns(CampaignId))



Select * From Registration



---PaymentMethod
Create Table PaymentMethod (
PaymentMethodId Int Primary Key,
PaymentMethodName Nvarchar(20))

Select * From PaymentMethod


Insert Into PaymentMethod ( PaymentMethodId,PaymentMethodName)
Values 
(1,	'Card'),
(2,	'Transfer'),
(3,	'Skrill'),
(4,	'Neteller'),
(5,	'Crypto')



----Delete Paymentmethod



---Deposits
Create Table Deposit (
DepositId Int Primary Key,
PlayerId Int,
PaymentMethodId Int,
DepositDate Date,
Amount Decimal (10,2),
Status Nvarchar(20),
Foreign Key (PlayerId) References Players(playerId),
Foreign key (PaymentMethodId) References PaymentMethod(PaymentMethodId))

/*Alter table Deposit
Drop Column Column4*/

Select * From Deposit

---Withdrawals
Create Table Withdrawal (
WithdrawalsId Int Primary Key,
PlayerId int,
PaymentMethodId Int,
WithdrawalDate Date,
Amount Decimal (10,2),
Status Nvarchar(20),
Foreign Key (pLayerId) References Players(PlayerId),
Foreign Key (PaymentMethodId) References PaymentMethod(PaymentMethodId))

Select * From Withdrawal


--Game Providers
Create Table GameProvider (
GameProviderId Int Primary Key,
GameProviderName Nvarchar(100))

Select * From GameProvider



--Game Categories
Create Table GameCategory(
GameCategoryId Int Primary Key,
GameCategoryName Nvarchar(50))

Select * From GameCategory



---Games
Create Table Games (
GameId Int Primary Key,
GameName NvarChar(100),
GameProviderId Int,
GameCategoryId Int,
Foreign Key (GameProviderId) References GameProvider(GameProviderId),
Foreign Key (GameCategoryId) References GameCategory(GameCategoryId))

Select * From Games


sessions
Create Table session (
SessionId int Primary Key,
PlayerId Int,
LoginTime DateTime,
LogOutTime DateTime,
Device Varchar(50),
Foreign Key (PlayerId) References Players(playerId))

Select * From session


---Bets
Create Table Bet (
BetId Int Primary Key,
SessionId Int,
GameId Int,
BetAmount Decimal(10,2),
WinAmount Decimal (10,2),
BetDate DateTime,
Foreign Key (SessionId) References Session(SessionId),
Foreign Key (GameId) References Games(GameId))

Select * From Bet


select * from Players
---Bonuses
Create Table Bonus(
BonusId Int Primary Key,
PlayerID int,
BonusType Nvarchar(50),
BonusAmount Decimal (10,2),
AwardDate Date,
Foreign Key (PlayerId) References Players(playerId))


Select * From Bonus
Drop Table Bonus

Alter Table Bonus
Drop Constraint
FK__Bonus__PlayerID__74AE54BC

-----Email Campaigns
Create Table EmailCampaign (
EmailCampaignId Int Primary Key,
CampaignName NvarChar(50),
SentDate Date,
EmailsSent Int,
EmailsOpened Int,
EmailsCliked Int)

Select * From EmailCampaign
Drop Table EmailCampaign



---Push Notifications
Create Table PushNotification(
PushNotificationId int Primary Key,
PlayerId Int,
SentDate DateTime,
Status Varchar(20),
Foreign Key (playerId) References Players(playerId))

Select * From PushNotification



--Affilate Partners
Create Table affiliate (
AffiliateId Int Primary Key,
AffiliateName nVarchar(100),
CommissionRate Decimal (5,2))

Select * From affiliate
Drop Table affiliate

/*
ALTER TABLE Players
ADD BrandID INT

ALTER TABLE Players
ADD CONSTRAINT FK_Players_Brand
FOREIGN KEY (BrandID)
REFERENCES Brand(BrandID) */


Select * From Countries

Insert Into Countries( CountryId, CountryName)
Values (1,	'Malta' ),(2,	'United Kingdom'), (3,	'Canada'), (4,	'Nigeria'),  (5,	'Germany'),	(6,	'Sweden'),(7,	'Brazil'),(8,	'India'),	(9,	'Spain'),
	(10, 'Australia'),(11, 'Norway'),(12, 'Netherland'), (13, 'Ireland'),(14, 'Denmark'),(15, 'Finland'),(16, 'Italy')



	Select * From INFORMATION_SCHEMA.TABLES
	Select * from Players

	Select PlayerID, Username,RegistrationDate,CountryID From Players

	Select Username From Players

	---Displaye Player with Active status
	Select Username, Status From Player Where Status = 'Active'

	Select PlayerID, Username,RegistrationDate,CountryID From Players Where CountryID = 2

	---Display player from United Kingdom
   Select PlayerID, Username,RegistrationDate, p.CountryID, C.CountryName From Players p
   Left Join Countries C on c.CountryId = p.CountryID Where CountryName = 'United Kingdom'
   
   ---Display Players From Country Malta
   Select PlayerID, Username,RegistrationDate, p.CountryID, C.CountryName From Players p
   Left Join Countries C on c.CountryId = p.CountryID Where CountryName = 'Malta'

   ----Display Player registered in June 2025
   Select PlayerID, Username,RegistrationDate, CountryID From Players 
   Where Year(RegistrationDate) = '2025' and MONTH(registrationDate) = '6'

--- Display Player Born in 1995
   Select PlayerID, Username,RegistrationDate, CountryID, DateOfBirth From Player 
   Where Year(DateOfBirth) = ' 1995'

   ---Display player Orderby registration date
   Select PlayerID, Username,RegistrationDate, CountryID, DateOfBirth From Player 
   Order By RegistrationDate

   --- How many players registered in each country
   Select Distinct(CountryId), Count(PlayerID) As Coutplayer from Player
   Group By CountryID

--- Which brand has the most registration


--- Which Campaign generate the most registration
Select  R.CampaignId, Count(R.RegistrationID) As TotalReh, C.CampaignName From Registration R
Left Join Campaigns c on C.CampaignId = R.CampaignID 
Group By R.CampaignID, C.CampaignName 

--- Display player from traffic Source
Select P.PlayerId, P.FirstName, P.LastName, P.RegistrationDate, C.CampaignId, C.CampaignName, T.TrafficSourceName From Players P 
Left Join Registration R On R.PlayerID = P.PlayerID
Left Join  Campaigns C On C.CampaignId = R.CampaignID
Left Join TrafficSources T On T.TrafficSourceID = C.TrafficSourceId

--- How many player came from Facebook

Select P.PlayerId, P.FirstName, P.LastName, P.RegistrationDate, C.CampaignId, C.CampaignName, T.TrafficSourceName From Players P 
Left Join Registration R On R.PlayerID = P.PlayerID
Left Join  Campaigns C On C.CampaignId = R.CampaignID
Left Join TrafficSources T On T.TrafficSourceID = C.TrafficSourceId
Where TrafficSourceName = 'Facebook'

--- How many player came from Google

Select P.PlayerId, P.FirstName, P.LastName, P.RegistrationDate, C.CampaignId, C.CampaignName, T.TrafficSourceName From Players P 
Left Join Registration R On R.PlayerID = P.PlayerID
Left Join  Campaigns C On C.CampaignId = R.CampaignID
Left Join TrafficSources T On T.TrafficSourceID = C.TrafficSourceId
Where TrafficSourceName = 'Google'

----- Which Campaign Cost The Most
Select Top 10 CampaignCost, CampaignId, CampaignName From Campaigns 
Order By CampaignCost Desc


--- Which Campaign is Still running
Select CampaignId, CampaignName, TrafficSourceId, StartDate, EndDate From Campaigns
Where Year(EndDate) = '2026'

--Which Campaign ended in 2025
Select CampaignId, CampaignName, TrafficSourceId, StartDate, EndDate From Campaigns
Where Year(EndDate) = '2025'

--We Spent 20,000 on Campaign 12, How many Player register from that Campaign
Select   R.RegistrationId, R.PlayerId, C.CampaignName, C.StartDate, C.EndDate, T.TrafficSourceName From Registration R
Left Join  Campaigns C on C.CampaignId = R.CampaignID
Left Join  TrafficSources T on T.TrafficSourceID = C.TrafficSourceId
Where C.CampaignId = 12

Select Count(R.RegistrationId) As Totalreg, C.CampaignName, C.StartDate, C.EndDate, T.TrafficSourceName From Registration R
Left Join  Campaigns C on C.CampaignId = R.CampaignID
Left Join  TrafficSources T on T.TrafficSourceID = C.TrafficSourceId
Where C.CampaignId = 12
Group By  C.CampaignName, C.StartDate, C.EndDate, T.TrafficSourceName


--- How many Players do we have in Total
Select Count(PlayerId) From Players

--which five countries have the most Player
Select  Top 5 CountryId, Count(PlayerId) As TopCountry From Players 
Group By CountryID
order by TopCountry Desc



--Which campaign generated the higgest number of registration
Select count(C.campaignId) As CampCount, count(R.RegistrationId) As TotalhighReg, C.CampaignCost, C.StartDate, C.EndDate,C.CampaignName, T.TrafficSourceName
From Registration R
Left Join  Campaigns C on C.CampaignId = R.CampaignID
Left Join  TrafficSources T on T.TrafficSourceID = C.TrafficSourceId
Group By C.CampaignId, C.StartDate, C.EndDate, T.TrafficSourceName, c.CampaignCost, C.CampaignName
Order By campcount Desc


--- Calculate  the total deposit amount by payment method
Select  P.PaymentMethodId, P.PaymentMethodName, Sum(D.Amount) As TotalDeposit From Deposit D
Inner Join PaymentMethod P On p.PaymentMethodId = D.PaymentMethodID
Group By  P.PaymentMethodId, P.PaymentMethodName
Order By TotalDeposit Desc

--- Which 10 players have deposited the highest total Amount
Select Top 10 P.PlayerId, p.FirstName, P.LastName, p.Gender, Sum(D.Amount) As TopCst From Players P
inner Join Deposit D On D.PlayerId = P.PlayerId
Group by P.PlayerId, P.FirstName, P.LastName, P.Gender 
Order By TopCst Desc


----Show each campaign cost, registrations and cost per registration
Select  C.CampaignCost,C.CampaignName, Count(R.RegistrationID) As ToTalRegistartion, C.CampaignCost / Count(R.RegistrationId) As CostPerReg  From Campaigns C
left Join Registration R on R.CampaignID = C.CampaignId
Group By  C.CampaignName, C.CampaignCost
-- alt optimized script
Select  C.CampaignCost,C.CampaignName, Count(R.RegistrationID) As ToTalRegistartion, C.CampaignCost / NullIf(Count(R.RegistrationId),0) As CostPerReg  From Campaigns C
left Join Registration R on R.CampaignID = C.CampaignId
Group By  C.CampaignName, C.CampaignCost
Order by CostPerReg Asc

----What is the percentage of register player made their first deposit.   Registation to FTd conversion rate
Select 
Count(Distinct R.playerId) As Registerplayer, Count(Distinct D.PlayerID) as FTDPlayer,
Count(Distinct D.PlayerId) * 100 / Count(R.PlayerID) As FTDConversionRateentageDeposit  From Registration R
Left Join Deposit D on D.PlayerId = R.PlayerId
And D.Status = 'Completed'

---- What is the average deposit Amount per player. ADA average deposit Amount
Select Count(DepositID) As TotalDepositor, Sum(Amount) As TotalDeposit, Avg(Amount) As AverageDeposit From Deposit

-----What percentage of players have stopped playing Player Churn Rate. ChurnRate
Select 
Count
    (Case When Status = 'Inactive' then PlayerID End) As ChurnPlayer, Count(playerId) As TotalPlayer, 	
Count(Case When Status = 'Inactive' then PlayerID End) * 100 / Count(PlayerId) As ChurnRate
From Player 

------How many player Registered in each month. Retention Analysis
Select Count(playerId) As NumberOfPlayer, Year(RegistrationDate) AS RegPerYear, Month(RegistrationDate) As RegPerMonth
From Players
Group by Year(RegistrationDate), Month(RegistrationDate) 
Order By RegPerMonth,RegPerYear

---Show total deposit permonth
Select Count(Amount) As AmountPerMonth, Year(DepositDate) AS DepositPerYear, Month(DepositDate) As DepositPerMonth
From Deposit
Group by Year(DepositDate), Month(DepositDate) 
Order By  DepositPerYear, DepositPerMonth

----What is the Gross Gaming Revenue
Select Year(betDate) As BetYear, Month(BetDate) As BetMonth, 
Sum(betAmount) As TotalBet, Sum(WinAmount) As TotalWin, Sum(betAmount) - Sum(WinAmount) As GGR
From Bet
Group By year(betdate), month(betDate)
Order By BetYear, BetMonth


----Which campaign generated the best ROI (return on investment)
select count(R.registrationId) As TotalRegister, Sum(D.Amount) As Revenue, C.CampaignName, C.CampaignCost, 
Sum(D.Amount) - C.CampaignCost / C.CampaignCost * 100 As ReturnonInvest
from Registration R
left join Campaigns C on C.CampaignId = R.CampaignID
left join Deposit D on D.PlayerID = R.playerId
Group By C.CampaignName, C.CampaignCost
order by ReturnonInvest


--- What is the average revenue generated per active user ARPU (to measure player value, forecasting revenue, evaluating campaign)
Select Sum(D.Amount) As TotalRevenue, Count(Distinct P.playerId) As ActivePlayer, Sum(D.Amount) * 1.0 / Count(Distinct P.PlayerID) As ARPU From Players P
Left Join Deposit D on D.PlayerID = P.PlayerID
Where P.Status = 'active'

---Segementation
---create player segment based on total deposit(  to give bonues)
Select P.playerid, Sum( D.Amount) As TotalDeposit,
Case 
When Sum(D.Amount) > 50000 Then 'VIP'
When Sum(D.Amount ) Between 10000 And 50000 Then 'HighValve'
Else 'Regular' End As PlayerCategory
From Player P Left Join Deposit D on D.playerId = P.playerId
Group by P.PlayerID


----CRM want to classify players based on their total deposit( VIP Segementation, Bonus targeting,retention offers)
Select P.playerid, Sum(D.Amount) As TotalDeposit, P.Status,
Case When Sum(D.Amount) > 50000 Then 'VIP'
	When Sum(D.Amount) Between 10000 And 50000 Then 'HIHGVALUE'
	When Sum(D.Amount) Between 1000 And 9999 Then 'REGULAR'
	Else 'LowValue' End As PlayerCategory
	From Player P Left Join Deposit D on P.PlayerID = D.PlayerID
	Where P.Status = 'Active' 
	Group By P.PlayerID, P.Status
	Order by TotalDeposit DESC

--- CTE FOR COMPLEX ANALYSIS 

With Player_Deposit_CTE
	As (
	Select P.PlayerId, Sum(D.Amount) As TotalDeposit From Player P
	inner Join Deposit D On D.playerId = P.PlayerId
	Group By P.PlayerID )

	Select Top 10 PlayerId, TotalDeposit,
	Case When TotalDeposit > 50000 Then 'VIP'
	     When TotalDeposit Between 10000 And 50000 Then 'HIGHVALVE'
	Else 'Regular' End as PlayerCategory
	From Player_Deposit_CTE
	Order By  TotalDeposit DESC




With Campaign_Deposit_CTE
As
( Select C.CampaignName, C.CampaignCost, Sum(D.Amount) As TotalDeposit 
From Campaigns C 
Left Join Registration R on R.CampaignID = C.CampaignId
Left Join Deposit D on D.PlayerID = R.PlayerID
Group By C.CampaignName, C.CampaignCost
)
Select Top 5 CampaignName, CampaignCost, TotalDeposit - (CampaignCost / CampaignCost *100) As ROI
From Campaign_Deposit_CTE
Order By ROI DESC

----Finance team wants a monthly deposit report that contains year, month, total deposit, number of deposit and average deposit amount

With Monthly_Deposit_CTE 
As 
( Select Year(DepositDate) As Year, Month(DepositDate) As Month, Sum(Amount) As TotalDeposit, Count(PlayerId) as NumberOfDepositor, Avg(Amount) As AverageDeposit
From Deposit
Group By Year(DepositDate), Month(DepositDate) )
Select Year, Month, TotalDeposit, NumberofDepositor, AverageDeposit
From Monthly_Deposit_CTE
 

-------Marketing Want to identify the highest value players
With Deposit_Withdrawal_CTE
AS
( Select  D.PlayerId As PlayerId, Sum(D.Amount) As TotalDeposit, Sum(W.Amount) as TotalWithdrawal, Sum(D.Amount) - Sum(W.Amount) As NetPlayerValue
From Deposit D Left Join Withdrawal W On D.PlayerId = W.PlayerID
Group By  D.PlayerId )
Select PlayerId, TotalDeposit, TotalWithdrawal, NetPlayerValue
From Deposit_Withdrawal_CTE
Order By NetPlayerValue DESC

------When a CTE involves aggregating data from multiple fact tables, aggregate each table seperately before joining them together
----SQL process order is From /Join, Where, Group By, Sum/Count/AVG, Select OutPut		
With Deposit_CTE AS
( Select playerId, Sum(Amount) As TotalDeposit From Deposit
Group By PlayerId),
 Withdrawal_CTE As 
( Select PlayerId, Sum(Amount) as TotalWithDrawal From Withdrawal
Group By PlayerID)
Select D.PlayerId, D.TotalDeposit, W.TotalWithdrawal, D.TotalDeposit - W.TotalWithdrawal As NetPlayerValue
From Deposit_CTE D left Join Withdrawal_CTE W 
On D.PlayerID = W.PlayerID
Order By NetPlayerValue DESC



----- Which Traffic Source bring the most valuable players
With Traffic_Player_CTE 
AS (
Select T.TrafficSourceName As TrafficSource, C.CampaignName As CampaignName,Count(Distinct R.PlayerId) As playerid, Sum(D.Amount) As  TotalDeposit,
Sum(D.Amount) / Count(distinct R.playerId) As AvgDepositperPlayer
From TrafficSources T inner Join Campaigns C on C.TrafficSourceId = T.TrafficSourceID
Inner Join Registration R On R.CampaignID = C.CampaignId 
inner Join Deposit D on D.PlayerID = R.PlayerID
Group By T.TrafficSourceName, C.CampaignName )
Select TrafficSource, CampaignName, PlayerId, TotalDeposit, AvgDepositperPlayer
From Traffic_Player_CTE
Order By AvgDepositperPlayer DESC



------ WINDOW FUNCTIONS----- 
---- allow you to perform calculations across related rows without grouping and losing the details

---- Rank players by total deposit amount
With Deposit_player_CTE As
( Select P.playerId as PlayerId, Sum(D.Amount) As ToTalDeposit
From Player P Left Join Deposit D on D.PlayerId = P.PlayerId
Group By P.PlayerID)
Select playerId, TotalDeposit,
Rank() Over( Order By TotalDeposit DESC) As PlayerRanks
From Deposit_player_CTE


------find top 10 vip players by deposit
Select Top 10 playerId, Amount, ROW_NUMBER() Over(order By Amount Desc) as Rownumber
From Deposit --- for individual transaction

---Correct Version 
With Player_Deposit_CTE As
	(
	Select PlayerId, Sum(Amount) As TotalDeposit
	From Deposit
	Group By PlayerId
	),
	RankingPlayer As
	(
	Select PlayerID, TotalDeposit,
	ROW_NUMBER() Over(Order By TotalDeposit DESC) As RowNumber
	From Player_Deposit_CTE
	Where TotalDeposit > 1000
	)
	Select PlayerID, TotalDeposit, RowNumber
	From RankingPlayer
	Where RowNumber  <= 10




-----Marketing wants the lastes deposit date for every player
Select PlayerId, DepositDate, Amount,
ROW_NUMBER() Over(Partition By PlayerId Order By DepositDate Desc) As RowNumber
From Deposit


------correction
With Latest_Deposit_Date As
(
 Select PlayerID, DepositId, DepositDate, Amount,
 ROW_NUMBER() Over( Partition By PlayerID Order By DepositDate, DepositID DESC) As RowNumber
 FRom Deposit
 )
 Select 
	PlayerID, DepositId, DepositDate, Amount
 From Latest_Deposit_Date
 Where RowNumber = 1




------What percentage of total deposits does each player contribute
Select playerId, Amount, Sum(Amount) Over( Partition By PlayerId Order by Amount / Sum(Amount) * 100) As PecentageDeposit
From Deposit
Group by Amount, PlayerID


---Correct
With Player_Deposit As
( 
Select PlayerId, Sum(amount) As TotalDeposit
From Deposit
Group By PlayerID
)
Select PlayerId, TotalDeposit, TotalDeposit * 100 / Sum(TotalDeposit) Over() As PercentageDeposit
FrOm Player_Deposit
Order By PercentageDeposit DESC




--- Rank campaigns by ROI
Select C.CampaignName, Sum(C.CampaignCost) As TotalCampaignCost, Sum(D.Amount) As TotalDeposit,
Sum(D.Amount) - Sum(C.CampaignCost) As ROI,
Rank() Over(partition by C.CampaignName Order By Sum(D.Amount) - Sum(C.CampaignCost ) Desc )  As CampaignRank From Campaign C
Left Join Registrations R on R.CampaignId = C.CampaignId
Left Join Deposit D on D.playerId = R.PlayerId
Group By C.CampaignName

-----correct ****  Q5 difference btw coalase and Nullif
With Campaign_performance_CTE AS
(
	Select C.CampaignId, C.CampaignName, C.CampaignCost, COALESCE(SUM(D.Amount),0) As TotalDeposit
	From Campaign C 
	Left Join Registrations R on R.CampaignID = C.CampaignId
	Left Join Deposit D on D.PlayerID = R.PlayerID
	Group By C.CampaignId, C.CampaignName, C.CampaignCost
	),
	Campaign_ROI As
	( Select CampaignId, CampaignName, CampaignCost, TotalDeposit,
	( TotalDeposit - CampaignCost) * 100.0 / NullIF(CampaignCost,0)  As ROI
	From Campaign_Performance_CTE
	)
	Select CampaignName, CampaignCost, TotalDeposit, ROI,
	Rank() Over(order By ROI DESC) As CampaignRanking
	From Campaign_ROI


	

------- Morthly Running Revenue
 ----  *** q6 why not use lag and led, explain when to use datefromparts and meaning, Row between UNBOUNDED PRECEEDING and Current Row
 With Monthly_Deposit_CTE As
 ( 
 Select 
	DATEFROMPARTS(Year(DepositDate), Month(DepositDate), 1) As DepositMonth,
	Sum(Amount) As MonthlyDeposit
 From Deposit
 Group By Year(DepositDate), Month(DepositDate)
 )
 Select
	DepositMonth, MonthlyDeposit, 
	Sum(MonthlyDeposit) Over ( Order By DepositMonth Rows Between UNBOUNDED PRECEDING And Current Row) As RunningDeposit
	From Monthly_Deposit_CTE
	Order By DepositMonth



 -----Compare player current deposit with Previous Deposit

 --- correct Q7 why use lag two time 
 Select
	PlayerId, DepositId, DepositDate, Amount As CurrentDeposit,
	Lag(Amount) Over(Partition By PlayerID Order By DepositID, DepositDate ) AS PreviousMonth,
	Amount - Lag(amount) Over( Partition By PlayerId Order By DepositID, DepositDate ) As Differences
	From Deposit




 ----compare Player Who increase Deposit
 Select Distinct PlayerId, Month(DepositDate), Amount - Lag((Amount),1) Over( Partition By PlayerID Order By Month(DepositDate) ) As Differnce
 From Deposit

 ----correction
 With Monthly_Deposit_CTE AS
(
	Select playerId, DATEFROMPARTS(Year(Depositdate), Month(DepositDate), 1) DepositMonth,
	Sum(Amount) as MonthLyDeposit
	From Deposit
	Group By PlayerId, Year(DepositDate), Month(DepositDate)
	),
Month_Comparism As
(
	Select PlayerId, DepositMonth, MonthlyDeposit,
	Lag(MonthlyDeposit) Over (Partition By PlayerId Order By DepositMonth) As PreviousMonthDeposit
	From MonthLy_Deposit_CTE
)

Select  
	playerId, DepositMonth, MonthlyDeposit, PreviousMonthDeposit,
	MonthlyDeposit - PreviousMonthDeposit As DepositIncrease 
From Month_Comparism
Where MonthlyDeposit > PreviousMonthDeposit





 ----Which country generate the most revenue
 Select  P.CountryID, C.CountryName, Sum(D.Amount) As TotalDeposit,
 Rank() over( partition by C.CountryName Order By Sum(D.Amount) DESC) As CountryRanking FrOm Countries C
 inner Join Players P on P.CountryId = C.CountryID
 Left Join Deposit D on D.playerID = P.PlayerID
 Group By P.CountryID, C.CountryName


 ---- correction
 With Country_Deposit_CTE AS
 (
 Select C.CountryID, C.CountryName, Coalesce(Sum(D.Amount),0) As TotalDeposit
 From Countries C
 Left Join Players P on P.CountryId = C.CountryId
 Left Join Deposit D On D.PlayerId = D.PlayerId
 Group By C.CountryId, C.CountryName
 ) 
 Select CountryId, CountryName, TotalDeposit,
 Rank() Over (Order By TotalDeposit) As CountryRank
 From Country_Deposit_CTE




 ------- Find each Player First Deposit
 Select PlayerID, Amount, DepositDate,
 ROW_NUMBER() Over( partition By PlayerId Order By DepositDate DESC)
 From Deposit
 
 --- Correction

 With First_Deposit_CTE As 
 ( Select PlayerId, DepositId, Amount, DepositDate,
 ROW_NUMBER() Over ( partition By PlayerId Order By DepositDate ASC, DepositId ASC) As RowNumber
 From Deposit
 )
 Select PlayerId, DepositId, Amount, DepositDate
 From First_Deposit_CTE
 Where RowNumber = 1 -- use for first time deposit




 ------ rank player by viplevel
 Select PlayerId, Sum(Amount) As TotalDeposit,
 Case When Sum(amount) > 50000 then 'Gold'
 When Sum(amount) Between 1000 and 50000 then 'Silver'
 Else 'Browns' End As Playecategory,
 Rank() Over(partition by playerId order By Sum(Amount) Desc)
 From Deposit
 Group By PlayerID


 ---correction
 With Player_Value_CTE As
 ( 
 Select PlayerId, Sum(amount) as TotalDeposit
 From Deposit
 Group BY PlayerID
 ), 
  Player_Category As
  (
  Select PlayerID, TotalDeposit, 
  Case 
  When TotalDeposit > 20000 then 'Gold'
  When TotalDeposit Between 1000 And 5000 Then 'Silver'
  Else 'Bronze' End As PlayerCategory
  From Player_Value_CTE
  )
  Select PlayerId, TotalDeposit, PlayerCategory,
  Rank() Over (Partition By playerCategory Order By TotalDeposit DESC) As PlayerRanking
  From Player_Category



 -------find daily ranking of Player by session (daily active players)
 Select Count(playerId )As Playercount, PlayerId, Device,
 Rank() Over( partition By PlayerId   Order By Device) As ActivePlayer
 From Session
 Group By Device, PlayerID


 ---correction
With Daily_Player_Session_CTE As
(
	Select PlayerID, CAST(LoginTime As Date) As SessionDate, 
		   Count(SessionId) As SessionCount
		   From Session
		   Group By Cast(LoginTime As Date), PlayerId
		   )
  Select SessionDate,PlayerId, SessionCount,
  Rank() Over (Partition By SessionDate Order By SessionCount DESC) As DailyActivityRank
  From Daily_Player_Session_CTE





 ------campaign convertion ranking
 With Deposit_Reg_CTE As (
 Select D.PlayerId, Count(D.DepositID) As Depositors, Count(R.registrationId) As TotalRegistration, 
 Count(D.DepositId) / Count(R.RegistrationId) as convertionRate
 From Deposit D
 Left Join Registrations R on D.PlayerID = R.PlayerID
 Group By D.PlayerID)
 Select Depositors, TotalRegistration, ConvertionRate,
 Rank() Over( partition By playerId  Order By TotalRegistration  ) As ConvertionRAnk
 From Deposit_Reg_CTE
 
 ----correction
 With CampaignConvertion_CTE AS
 (
 Select C.CampaignName, C.CampaignID, Count(Distinct R.PlayerID) As RegisterPlayers,
 Count(Distinct Case
					When D.Status = 'completed' Then D.PlayerId 
					End) As DepositingPlayer
From Campaign C Left Join 
Registrations R on R.CampaignId = C.CampaignId
left Join Deposit D On D.PlayerId = R.PlayerId
Group By C.CampaignID, C.CampaignName
),
	ConversionRate As
(
	Select CampaignName, CampaignId, RegisterPlayers, DepositingPlayer,
	DepositingPlayer * 100.0 / NullIf(RegisterPlayers,0) As ConvertionRate
	From CampaignConvertion_CTE
)
Select CampaignName, CampaignId, RegisterPlayers, DepositingPlayer, ConvertionRate,
	Rank() Over ( Order By ConvertionRate DESC) As ConvertionRank
From ConversionRate




 ------Lifetime value ranking
 With Lifetime_Deposit_CTE As
 (
 Select PlayerId, Sum(amount) As totalDeposit From Deposit D
 Group By PlayerId
 ),
 Lifetime_Withdrawal_CTE As 
 (
 Select PlayerId, Sum(Amount) As totalWithdrawal From Withdrawal W
 Group By PlayerID
 )
 Select D.PlayerId, D.TotalDeposit - W.TotalWithdrawal As ConvertionRate,
 Rank() Over ( Partition By D.PlayerId Order By D.TotalDeposit - W.TotalWithdrawal) As RankRate
 From Lifetime_deposit_CTE D left Join Lifetime_withdrawal_CTE W
 On D.PlayerId = W.PlayerId
 
 ----Correction
 With LifetimeDeposit_CTE As
 (
	Select PlayerID, Sum(Amount) As TotalDeposit
 From Deposit
 Group By PlayerId
 ),
 LifeTimeWithdrawal_CTE As
 (
	Select PlayerId, Sum(Amount) As TotalWithdrawal
 From Withdrawal
 Group By PlayerId
 ),
 PlayerValue_CTE As
 ( 
   Select D.PlayerId, D.TotalDeposit, Coalesce(W.TotalWithdrawal,0) As TotalWithdrawal, 
   D.TotalDeposit - Coalesce(W.TotalWithdrawal,0) As NetPlayerValue
   From LifetimeDeposit_CTE D Left Join
   LifeTimeWithdrawal_CTE W on D.PlayerID = W.PlayerId
)
	Select PlayerId, TotalDeposit, TotalWithdrawal, NetPlayerValue,
		Rank() Over ( Order By Netplayervalue DESC) As ValueRank
    From PlayerValue_CTE






 ------Running GGR over time
 Select  GameID, Sum(BetAmount) As TotalBets, Sum(WinAmount) As TotalWinnings,
 Sum(BetAmount) - Sum(WinAmount) As GGR,
 Rank() Over( Partition By GameID Order By Sum(BetAmount) - Sum(WinAmount) ) as GGRRank From Bet
 Group By GameID



 --Correction

With DailyGGR_CTE As
(
	Select 
		CAST(BetDate As Date) As BetDate, Sum(BetAmount) As TotalBets, Sum(WinAmount) As TotalWins,
		Sum(BetAmount) - Sum(WinAmount) As GGR
		From Bet
		Group By CAST(BetDate As Date)

)
	Select BetDate, TotalBets, TotalWins, GGR,
Sum(GGR) Over (Order By BetDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) As RunningGGR
From DailyGGR_CTE
Order By BetDate





 -----find the second highest depositor
 Select PlayerId, Sum(Amount) As TotalDeosit,
 Rank() Over(Order By Sum(Amount) DESC ) As playerrank ,
 Dense_Rank() Over(order by Sum(Amount) DESC) As DensePlayerRank
 From Deposit
 Group By PlayerID


--Correction
With PlayerDeposit_CTE AS
(
	Select PlayerId, Sum(Amount) As TotalDeposit
	From Deposit
	Group By PlayerId
),
RankedDepositor As
(
	Select PlayerId, TotalDeposit,
	Dense_Rank() Over (Order By TotalDeposit DESC) As DepositRank
	From PlayerDeposit_CTE 
)
Select PlayerId, TotalDeposit, DepositRank
From RankedDepositor
Where DepositRank = 2




 ------FIND Duplicate transaction
 Select PlayerId, Amount,
 Row_Number() Over(partition By PlayerId order By playerid DESC) As RollCall
 From Deposit
 Where PlayerId  > 1

 Select * From Deposit

 --- Correction
 With DuplicateDeposit_CTE As
(
Select PlayerId, DepositId, PaymentMethodID, Amount, DepositDate,
Row_Number() Over (Partition By PlayerId, PaymentMethodId, Amount, DepositDate Order By DepositId) As DuplicateNumber
From Deposit
)
Select PlayerId, DepositId, PaymentmethodId, Amount, DepositDate, DuplicateNumber
From DuplicateDeposit_CTE
Where DuplicateNumber > 1




 ----- Monthly retention Player

 Select Count(PlayerId) As Totalplayer, Month(registrationDate) As MonthlyCust,
 lag(month(RegistrationDate),1) Over (partition by month(registrationDate) Order by Month(registrationDate)) As PreviousMonth
 From Players
 Group By Month(RegistrationDate)


 ----correction
 With MonthlyActivePlayer_CTE As
 (
	Select PlayerId, DATEFROMPARTS(YEAR(loginTime), Month(LoginTime), 1) As ActiveMonth
	From Session
),
RetentionStatus As
(
Select CurrentMonth.PlayerId, CurrentMonth.ActiveMonth,
	CASE
		When PreviousMonth.PlayerId IS NOT NULL Then 1
		ELSE 0 END As RetainedPlayer
	FROM MonthlyActivePlayer_CTE CurrentMonth
	Left Join MonthlyActivePlayer_CTE PreviousMonth on PreviousMonth.PlayerId = CurrentMonth.PlayerId
	AND PreviousMonth.Activemonth = DATEADD( MONTH, -1, CurrentMonth.ActiveMonth)

)
Select
 ActiveMonth, Count(PlayerId) As ActivePlayers, Sum(RetainedPlayer) As RetainedPlayer,
 Sum(RetainedPlayer) * 100.0 / NullIf(Count(playerID),0) As RetensionRate
 From RetentionStatus
 Group By ActiveMonth
 Order By ActiveMonth



 Select * From Registrations
 Select * From Campaign

 ----- Top campaign each month
 Select 
 C.CampaignId, Count(R.RegistrationId) As TopCampaignReg, Month(R.RegistrationDate) As RegPErMth, 
 ROW_NUMBER() Over( partition By Month(R.RegistrationDate) Order By C.CampaignID DESC) As ROI
From Campaign C left Join Registrations R on C.CampaignID =R.CampaignId
Group By  C.CampaignId, Month(R.RegistrationDate)

---correction
With MonthlyCampaignRegistration_CTE As
(
	Select DATEFROMPARTS(Year(R.RegistrationDate), Month(R.RegistrationDate), 1) As RegistrationMonth,
			C.CampaignId, C.CampaignName, Count(R.RegistrationID) AS TotalRegistrations
		From Campaign C Inner Join Registrations R
		On C.CampaignID = R.CampaignId
		Group By DATEFROMPARTS(Year(R.RegistrationDate), Month(R.RegistrationDate), 1), C.CampaignID, C.CampaignName
),
RankedCampaign As
(
  Select RegistrationMonth, CampaignId, CampaignName, TotalRegistrations,
  Rank() Over( Partition By RegistrationMOnth Order By TotalRegistrations DESC) As CampaignRank
  From MonthlyCampaignRegistration_CTE
)
Select RegistrationMonth, CampaignId, CampaignName, TotalRegistrations
From RankedCampaign
Where CampaignRank = 1




-----create excercutive marketing dashboard
With Rank_Player_CTE As (
Select C.CampaignID, C.CampaignName,R.PlayerId, SUm(C.campaignCost) as CampaignCost, count(R.RegistrationID) As TotalRegPerMonth, 
Rank() Over ( partition By C.CampaignName Order By Sum(C.CampaignCost) DESC) As CampaignRanking
From Campaign C Left Join Registrations R on C.CampaignID = R.CampaignID
Group By C.CampaignID,C.CampaignName, R.PlayerId),
	Rank_Deposit_CTE As (
	Select PlayerId, Sum(Amount) As TotalDeposit,
   Rank() Over ( partition by playerId order By Sum(Amount) DESC) As RanKDep
From Deposit 
Group By PlayerID)

Select R.TotalDeposit, C.CampaignCost , C.campaignName, R.PlayerId,
Case When  R.TotalDeposit - C.CampaignCost > 50000 then 'Gold'
		when  R.TotalDeposit - C.CampaignCost Between 10000 and 50000 then 'silver'
		else 'Browns' End As Category
From RanK_Player_CTE C Left Join Rank_Deposit_CTE R on R.PlayerId = C.PlayerId


---CORREECTION 
With CampaignRegistration_CTE AS
(
	Select C.CampaignId, C.CampaignName, C.CampaignCost, Count(Distinct R.PlayerId) As RegisterPlayer
	From Campaign C
	Left Join Registrations R on R.CampaignID = C.CampaignId
	Group By C.CampaignId, C.CampaignName, C.CampaignCost
),
CampaignDeposit As
(
	Select R.CampaignId, Count(Distinct D.PlayerId) As DepositingPlayer, Coalesce(Sum(D.amount), 0) TotalDeposit
	From Registrations R
	Left Join Deposit D on D.PlayerId = R.PlayerId
	Group By R.CampaignId
),
	CampaignDashboard AS 
( 
	Select CR.CampaignId, CR.CampaignName, CR.CampaignCost,CR.RegisterPlayer,
	Coalesce(CD.DepositingPlayer,0) As DepositingPlayer,
	Coalesce(CD.TotalDeposit, 0) As TotalDeposit,
	Coalesce(CD.DepositingPlayer, 0) * 100.0 / NullIF(CR.RegisterPlayer, 0) As ConvertionRate,
	(Coalesce(CD.TotalDeposit, 0) - CR.CampaignCost) * 100.0 / NullIf(CR.CampaignCost, 0) As ROI
	From CampaignDeposit CD
	Left Join CampaignRegistration_CTE CR on CR.CampaignId = CD.CampaignId
)
Select CampaignId, CampaignName, CampaignCost, Registerplayer, DepositingPlayer, TotalDeposit,
	Rank() Over (Order By ROI DESC) As ROIRank,
	Rank() Over ( Order By TotalDeposit DESC) AS DepositRank
	From CampaignDashboard
	Order By ROIRank

	/***********/



	--------Acquicition performance, 5 traffic source that generated the highest number of register players
	With TrafficSource_CTE As
( 
Select T.TrafficSourceId, T.SourceName, C.CampaignName, C.CampaignID, Count(R.PlayerId) As TotalPlayer
From TrafficSource T
Left Join Campaign C on C.TrafficSourceID = T.TrafficSourceID
Left Join  Registrations R on R.CampaignID = C.CampaignID
Group By T.TrafficSourceId, T.SourceName, C.CampaignName, C.CampaignID
)
 Select TrafficSourceId, SourceName, CampaignName, CampaignID, TotalPlayer,
 Rank() Over ( order by TotalPlayer DESC) As RankingPlayer
 From TrafficSource_CTE

 -----
 Select Top 5 T.TrafficSourceId, T.SourceName, Count (Distinct R.playerID) As TotalREgisterPlayers
 From TrafficSource T
 Left Join Campaign C On C.TrafficSourceID = T.TrafficSourceID
 Left Join Registrations R on R.CampaignID = C.CampaignID
 Group By T.TrafficSourceID, T.SourceName
 Order By TotalREgisterPlayers DESC




--Show monthly deposit performance for the entire business

With DepositPerformance_CTE As
( 
 Select DATEFROMPARTS(Year(DepositDate), Month(DepositDate), 1) as DepositMonth, Count(DepositID) As NumberOfDeposit,
		Count(Distinct PlayerID) As UniqueDepositors, Coalesce(Sum(Amount), 0) As TotalDeposit
		From Deposit 
		Group By Year(DepositDate), Month(DepositDate)
),
 AveragePerformance As
(	
	Select DepositMonth, NumberOfDeposit, UniqueDepositors, TotalDeposit,
	Avg(TotalDeposit) Over( Order By TotalDeposit DESC) As AverageDepositAmount
	From DepositPerformance_CTE
	Group By DepositMonth, NumberOfDeposit, UniqueDepositors, TotalDeposit
)
	Select DepositMonth, NumberOfDeposit, UniqueDepositors, TotalDeposit, AverageDepositAmount
	From AveragePerformance

	------------------
	Select Year(DepositDate) As DepositYear, Month(DepositDate) As DepositMonth,
		Count(DepositId) As NumberOfDeposit, Count(Distinct PlayerId) As UniqueDepositors,
		Sum(Amount) As TotalDeposits, AVG(Amount) As AverageDepositAmount
		From Deposit
		Group By
		Year(DepositDate), Month(DepositDate)
		Order By DepositYear, DepositMonth




---- Player Value Segmentation CRM wants every player classified using their total lifetime deposits
With LifeTimeDeposit_CTE As
(
Select DATEFROMPARTS(YEAR(DepositDate), Month(DepositDate), 1) As DepositMonth, PlayerId,
	Coalesce(Sum(Amount), 0) As TotalDeposit
	From Deposit
	Group By DATEFROMPARTS(YEAR(DepositDate), Month(DepositDate), 1), PlayerID
),
LifeTimeSegment As
(
 Select DepositMonth, PlayerId , TotalDeposit,
 Case
	When Totaldeposit > 50000 Then 'Vip'
	When TotalDeposit Between 10000 And 50000 Then 'HighValue'
	When TotalDeposit Between 1000 And 9999 Then 'Regular'
	Else 'LowValve' End As PlayerSegment
	From LifeTimeDeposit_CTE
)
Select 
	DepositMonth, PlayerId, TotalDeposit, PlayerSegment
	From Lifetimesegment

	------
	
	With LifeTimeDeposit As 
	( Select P.PlayerID, Coalesce(Sum(D.Amount), 0) As TotaLDeposit
	From Players P
	Left Join Deposit D On D.PlayerID = P.PlayerID
	Group By P.PlayerID
	)
	Select PlayerID, TotalDeposit,
		Case 
		When TotalDeposit > 50000 Then 'VIP'
		When TotalDeposit >= 10000 Then 'High Value'
		When TotalDeposit >= 1000 Then 'Regular'
		Else 'Low Value'
		End As PlayerSegment
From LifeTimeDeposit




	---FTD Conversion What percentage of registered players became depositing players
With Registerplayer as
( Select DATEFROMPARTS(YEAR(R.RegistrationDate), Month(R.RegistrationDate), 1) as RegistrationMonth, Count(R.RegistrationID) as RegisterPlayer,
	Count(D.DepositId) As DepositingPlayer
	From Registrations R
	Left Join Deposit D on D.PlayerId = R.PlayerId
	Group By DATEFROMPARTS(YEAR(RegistrationDate), Month(RegistrationDate), 1)
)
Select RegistrationMonth, Registerplayer, DepositingPlayer,
	Coalesce(RegisterPlayer - DepositingPlayer ,0) * 100.0 / NullIf(DepositingPlayer, 0) As Conversionrate
	From RegisterPlayer
	Group By RegistrationMonth, Registerplayer, DepositingPlayer

	--------
	Select Count(Distinct R.PlayerId) As RegisterPlayers,
	Count(Distinct CASE
						When D.Status = 'Completed' Then D.PlayerID
						End) As DepositingPlayer,
	Count(Distinct Case When D.Status = 'Completed' Then D.PlayerID End) * 100.0 / NULLIF(Count(Distinct R.PlayerId), 0) As ConvertionRate
	From Registrations R
	Left Join Deposit D On D.PlayerID = R.playerID






	-----VIP Ranking, Who are our top 10 players by total lifetime deposit value?

	With LifeTimeDeposit_CTE As
(
Select DATEFROMPARTS(YEAR(DepositDate), Month(DepositDate), 1) As DepositMonth, PlayerId,
	Coalesce(Sum(Amount), 0) As TotalDeposit
	From Deposit
	Group By DATEFROMPARTS(YEAR(DepositDate), Month(DepositDate), 1), PlayerID
),
LifeTimeSegment As
(
 Select DepositMonth, PlayerId , TotalDeposit,
 Case
	When Totaldeposit > 50000 Then 'Vip'
	When TotalDeposit Between 10000 And 50000 Then 'HighValue'
	When TotalDeposit Between 1000 And 9999 Then 'Regular'
	Else 'LowValve' End As PlayerSegment
	From LifeTimeDeposit_CTE
)
Select 
	DepositMonth, PlayerId, TotalDeposit, PlayerSegment,
	Rank() Over ( Order By TotalDeposit DESC) As VipRanking
	From Lifetimesegment


--------
With LifeTimeDeposit As
( Select PlayerID, Sum(Amount) As TotalDeposit
From Deposit
Group By PlayerID
),
  RankedPlayers As
  ( Select  PlayerID, TotalDeposit,	
  Rank() Over (Order By TotalDeposit DESC) As PlayerRank
  From LifetimeDeposit
  )
  Select PlayerId, TotalDeposit,PlayerRank
  From RankedPlayers
  Where PlayerRank <=10
  Order By PlayerRank




	-----Latest Deposit, The payments team wants the most recent deposit made by each player.
With LastestDeposit_CTE As
(
Select distinct PlayerID, DATEFROMPARTS(Year(DepositDate), Month(depositDate), 1) As Depositmonth, Sum(Amount) As TotalDeposit
From Deposit
), 
  DepositMonth As
( Select Distinct playerId, TotalDeposit, 
	 Lag(DepositMonth) Over( Order By DepositMonth Rows Between UNBOUNDED PRECEDING  AND CURRENT ROW) As PreviousMonth
	 From LastestDeposit_CTE
)
 Select Distinct PlayerId, TotalDeposit DepositMonth, PreviousMonth
 From DepositMonth

---------------

With LastestDeposit As
(
	Select PlayerId, DepositDate, Amount,
	ROW_NUMBER() Over( Partition By PlayerId Order By DepositDate DESC, DepositId DESC) AS ROWNUM
	From Deposit
	)
	Select PlayerId, DepositDate, Amount
	From LastestDeposit
	Where ROwNum = 1





-----Month-on-Month Deposit Change, Management wants to know whether monthly deposit value is increasing or decreasing

  With MonthlyDeposit_CTE As
  (
	Select Count(DepositID) As TotalDepositor, DATEFROMPARTS(Year(DepositDate), Month(DepositDate), 1) As MonthDeposit, Coalesce(Sum(Amount),0) As CurrentDeposit
	From Deposit
	Group By  DATEFROMPARTS(Year(DepositDate), Month(DepositDate), 1)
	),
	DiffDeposit As
(
Select TotalDepositor, MonthDeposit, CurrentDeposit, 
Lag(CurrentDeposit) Over( Order By MonthDeposit) As PreviousDeposit,
CurrentDeposit - Lag(currentDeposit) Over(Order By MonthDeposit ) As DepositDiff
From MonthlyDeposit_CTE
)
Select TotalDepositor, MonthDeposit, CurrentDeposit, PreviousDeposit, DepositDiff
From DiffDeposit








-----Player Net Value, Finance wants to identify players with the highest net cash value

With DepositValue_CTE As
( 
	Select Distinct PlayerID, Coalesce(Sum(Amount), 0) As TotalDeposit
	From Deposit
	Group By PlayerId
),
 WithDrawalValue As
 ( 
	Select Distinct PlayerId, Coalesce(sum(Amount),0) As TotalWithdrawal
	From Withdrawal
	Group By PlayerID
)
Select DV.PlayerId, DV.TotalDeposit, WV.TotalWithdrawal,
	Dv.TotalDeposit - Coalesce(WV.TotalWithdrawal, 0) As NetPlayerValue
	From DepositValue_CTE DV 
	Left Join WithDrawalValue WV on WV.PlayerID = DV.PlayerId


-----Campaign Performance, Marketing wants campaigns ranked according to performance.

With CampaignPerformance_CTE As 
(
 Select C.CampaignId, Coalesce(Sum(C.CampaignCost), 0) As CampaignCost, C.CampaignName, R.PlayerID, CounT(Distinct R.RegistrationID) As RegisterPlayer
 From Campaign C 
 Left Join Registrations R On C.CampaignId = R.CampaignId
 Group By C.CampaignId, C.CampaignName, R.PlayerID
 ),
 DepositPerformance As
 ( Select PlayerId, Count(Distinct DepositId) As DepositingPlayer, Coalesce(Sum(Amount), 0) As TotalDeposit
 From Deposit
 Group By PlayerID
 ),
 PerformanceRanking As 
 (
  Select CP.CampaignId, CP.CampaignName, CP.RegisterPlayer, DP.DepositingPlayer, CP.CampaignCost,  DP.TotalDeposit,
 Coalesce( DP.DepositingPlayer - CP.RegisterPlayer, 0) * 100.0/ NullIf(CP.RegisterPlayer,0) As ConvertionRate,
 Coalesce (DP.TotalDeposit -CP.CampaignCost, 0) *100.0 / NullIf(CP.CampaignCost,0) ROI
 From CampaignPerformance_CTE CP
 Left Join DepositPerformance DP On CP.PlayerID = DP.PlayerID
 )
 Select CampaignId, CampaignName, RegisterPlayer, DepositingPlayer,
 CampaignCost,  TotalDeposit,
  Rank() Over(  Order By ROI DESC) As ROIRank
 From PerformanceRanking
 

 
 ---------------
 With CampaignIdBase As
 (
 Select C.CampaignID, C.CampaignName, C.CampaignCost,
 Count(Distinct R.PlayerID) As RegisteredPlayers
 From Campaign C
 Left Join registrations R On R.CampaignID = C.CampaignID
 Group By C.CampaignID, C.CampaignName, C.CampaignCost
 ),
	CampaignDeposit As
	( Select  R.CampaignID,
		Count( Distinct Case 
						When D.Status = 'Completed'
						Then D.PlayerId END) As DepositingPlayers,

		Coalesce(SUm(Case 
						When D.Status = 'Completed'
						Then D.Amount End), 0) As TotalDeposits
	From Registrations R
	Left Join Deposit D on D.PlayerID = R.PlayerId
	Group By R.CampaignID
 ),
	CampaignMetrics As
	( 
	Select C.CampaignID, C.CampaignName, C.campaignCost, C.RegisteredPlayers,
	Coalesce(D.DepositingPlayers,0) as DepositingPlayers,
	Coalesce(D.TotalDeposits, 0) as TotalDeposits,
	Coalesce(D.DepositingPlayers, 0) * 100.0 / NULLIF(C.RegisteredPlayers, 0) as ConvertionRate,
	(Coalesce(D.TotalDeposits, 0) - C.CampaignCost) * 100.0 / NullIf(C.CampaignCost, 0) As ROI
From CampaignIdBase C
Left Join CampaignDeposit D on C.CampaignId = D.CampaignID
)
 Select CampaignId, CampaignName, CampaignCost, RegisteredPlayers, DepositingPlayers, TotalDeposits, ConvertionRate, ROI,
 Rank() Over( Order By ROI DESC) As ROIRank
 From CampaignMetrics
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ---GGR Analysis, The Gaming Manager asking to Show monthly GGR and cumulative GGR.
 With BETGGR_CTE As
 ( Select DATEFROMPARTS(Year(BetDate), Month(BetDate), 1) as BetMonth, Coalesce(sum(BetAmount), 0) As TotalBets,
	Coalesce(Sum(WinAmount), 0) As totalWinning, 
	Coalesce(Sum(BetAmount),0) - Coalesce(Sum(WinAmount), 0) As GGR
	From Bet
	Group By DATEFROMPARTS(Year(BetDate), Month(BetDate), 1) 
)
Select BetMonth, TotalBets, TotalWinning, GGR,
Sum(GGR) Over ( Order By BetMonth Rows Between UNBOUNDED PRECEDING  AND CURRENT ROW) As RunningGGR
From BetGGR_CTE


--------------------------888888888888888888-----------------------

With LifeTimeDeposit As
(
Select Distinct  P.PlayerId, Coalesce(Sum(D.Amount), 0) As TotalDeposit
From Players P
Left Join Deposit D on D.playerId = P.playerId
Group By  P.PlayerID
) 
Select PlayerID, ToTalDeposit,
	 Case When TotalDeposit < 50000 Then 'VIP'
		WHEN TotalDeposit Between 10000 And 50000 Then 'High Value'
		When TotalDeposit Between 1000 And 9999 Then 'Regular'
		Else 'Low Value' End As PlayerSegment
From LifeTimeDeposit
	
	
-------------------------

	With DepositConvertion AS
	( Select 
	   Count(Distinct R.PlayerID) As RegisterPlayer, 
	   Count(Distinct 
	  Case 
	  When D.Status = 'Completed' Then D.PlayerId
	  End ) As DepositingPlayer
	From Registrations R 
	left Join Deposit D on D.playerID = R.PlayerId
	)
 Select  RegisterPlayer, DepositingPlayer, DepositingPlayer * 100.0 / RegisterPlayer As ConvertionRate
 From DepositConvertion


---
 With LastestDeposit As
 ( 
 Select  PlayerID, DepositID, DepositDate,Amount
From Deposit
)
Select Distinct Playerid, DepositID, DepositDate, Amount,
Rank() Over(partition By playerId Order By DepositDate DESC) As DepositRank
From LastestDeposit

-------

With CampaignPerformance as 
(
Select CampaignID, CampaignName, CampaignCost
From Campaign
),
DepositPerformance As
( Select R.CampaignId, Count(Distinct R.PlayerId) As RegisterPlayer,
		Count( Distinct Case
		When D.Status = 'Completed' Then D.PlayerID
		End) As DepositingPlayer,
		Coalesce(Sum( Case 
			When D.Status = 'Completed' Then D.Amount END),0) As TotalDeposits
		From Registrations R Left Join
		Deposit D On D.PlayerId = R.PlayerId
		Group By R.CampaignID
),
 RoiConvertionRate As
 (
 Select CP.CampaignName, CP.CampaignCost, DP.RegisterPlayer, Dp.DepositingPlayer, DP.TotalDeposits,
	Coalesce(DP.DepositingPlayer, 0) * 100.0/ NullIf(DP.Registerplayer, 0)  As ConversionRate,
	(Coalesce (DP.TotalDeposits, 0) - Coalesce(CP.CampaignCost,0)) * 100.0 / NullIf(CP.CampaignCost, 0)  As ROI
 From CampaignPerformance CP Left Join
 DepositPerformance DP on CP.CampaignID = DP. CampaignID
 )
 Select CampaignName, CampaignCost, RegisterPlayer, DepositingPlayer, TotalDeposits, ConversionRate, ROI,
 RanK() Over( Order By ROI DESC) As ROIRANK
 From RoiConvertionRate 


 select Sum(betAmount) As TotalBet, Sum(WinAmount) As TotalWin,
         Sum(BetAmount) - Sum(winAmount) As GGR,
		 Sum(WinAmount) / Sum(BetAmount) * 100.0 As Rtp_percentage,
		 (Sum(betAmount) -  Sum(WinAmount)) / Sum(betAmount) * 100.0 As Holdpercentage
		 from Bet


		/* Alter Table Bet
		 Add OriginalWinAmount Float

		 Update Bet
		 Set OriginalWinAmount = WinAmount 

		 Update Bet
		 Set WinAmount = OriginalWinAmount *  0.635610842740223 */




Order By BetMonth
select * from TrafficSource
Select * from Bet
Select * from Registrations
Select * from Withdrawal
Select * from Game
Select * from PlayerSegment
Select * from Countries
Select * From PaymentMethod
Select * From Players
Select * From Campaign
Select * From Deposit
Select * from viplevel 
Select * from Session




/*
Alter Table Players
Add BrandID Int

Alter Table Players
add Constraint FK_Player_Brand
Foreign Key (BrandID)
References Brand(BrandId)

update Players
Set BrandId =
Case 
When PlayerId % 5 = 0 Then 1
When PlayerId % 5 = 1 Then 2
When PlayerId % 5 = 2 Then 3
When PlayerId % 5 = 3 Then 4
else 5 End */



