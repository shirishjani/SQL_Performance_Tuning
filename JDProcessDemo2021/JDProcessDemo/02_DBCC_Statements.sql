--Remind John to show use 05_TableScan_ClusteredScan
USE TestDB
GO
SELECT DB_ID()
GO

SELECT * FROM Accounting.BankAccounts
GO

DBCC TRACEON(3604) 
DBCC PAGE(0, 1, 26176, 3)
--DBCC IND(0,'Accounting.BankAccounts',-1)


---New demonstration on Always Encrypted
--column encryption setting = enabled




--New in SQL Server 2016
SELECT * FROM sys.dm_db_database_page_allocations
(DB_ID(), object_ID('Accounting.BankAccounts'), NULL, NULL, 'LIMITED')

--New in SQL Server 2019
SELECT * FROM sys.dm_db_page_info(DB_ID(), 1, 336, 'Detailed')