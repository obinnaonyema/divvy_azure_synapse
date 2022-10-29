IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'divvy_divvy_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [divvy_divvy_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://divvy@divvy.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE payment (
	[payment_id] varchar(50),
	[date] varchar(50),
	[amount] varchar(100),
	[rider_id] varchar(50)
	)
	WITH (
	LOCATION = 'publicpayment.csv',
	DATA_SOURCE = [divvy_divvy_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.payment
GO