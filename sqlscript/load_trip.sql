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

CREATE EXTERNAL TABLE trip (
	[trip_id] varchar(50),
	[rideable_type] varchar(50),
	[start_at] varchar(50),
	[ended_at] varchar(50),
	[start_station_id] varchar(50),
	[end_station_id] varchar(50),
	[rider_id] varchar(50)
	)
	WITH (
	LOCATION = 'publictrip.csv',
	DATA_SOURCE = [divvy_divvy_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat2]
	)
GO


SELECT TOP 100 * FROM dbo.trip
GO