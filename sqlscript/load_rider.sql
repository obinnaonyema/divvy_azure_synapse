IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat2') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat2] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 STRING_DELIMITER = '"',
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

CREATE EXTERNAL TABLE rider (
	[rider_id] varchar(50),
	[first] varchar(50),
	[last] varchar(50),
	[address] varchar(200),
	[birthday] varchar(50),
	[account_start_date] varchar(50),
	[account_end_date] varchar(50),
	[is_member] varchar(10)
	)
	WITH (
	LOCATION = 'publicrider.csv',
	DATA_SOURCE = [divvy_divvy_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat2]
	)
GO


SELECT TOP 100 * FROM dbo.rider
GO