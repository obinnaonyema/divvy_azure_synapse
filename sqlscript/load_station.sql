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

CREATE EXTERNAL TABLE station (
	[station_id] varchar(50),
	[name] varchar(100),
	[latitude] varchar(50),
	[longitude] varchar(50)
	)
	WITH (
	LOCATION = 'publicstation.csv',
	DATA_SOURCE = [divvy_divvy_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat2]
	)
GO


SELECT TOP 100 * FROM dbo.station
GO