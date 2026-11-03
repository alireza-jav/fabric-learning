CREATE TABLE [dbo].[publicholidays] (
    [countryOrRegion]      VARCHAR (8000) NULL,
    [holidayName]          VARCHAR (8000) NULL,
    [normalizeHolidayName] VARCHAR (8000) NULL,
    [isPaidTimeOff]        BIT            NULL,
    [countryRegionCode]    VARCHAR (8000) NULL,
    [date]                 DATETIME2 (6)  NULL
);


GO