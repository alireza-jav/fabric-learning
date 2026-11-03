CREATE TABLE [dbo].[FactInternetSales] (
    [ProductKey]            BIGINT         NULL,
    [OrderDateKey]          BIGINT         NULL,
    [DueDateKey]            BIGINT         NULL,
    [ShipDateKey]           BIGINT         NULL,
    [CustomerKey]           BIGINT         NULL,
    [PromotionKey]          BIGINT         NULL,
    [CurrencyKey]           BIGINT         NULL,
    [SalesTerritoryKey]     BIGINT         NULL,
    [SalesOrderNumber]      VARCHAR (8000) NULL,
    [SalesOrderLineNumber]  BIGINT         NULL,
    [RevisionNumber]        BIGINT         NULL,
    [OrderQuantity]         BIGINT         NULL,
    [UnitPrice]             FLOAT (53)     NULL,
    [ExtendedAmount]        FLOAT (53)     NULL,
    [UnitPriceDiscountPct]  BIGINT         NULL,
    [DiscountAmount]        BIGINT         NULL,
    [ProductStandardCost]   FLOAT (53)     NULL,
    [TotalProductCost]      FLOAT (53)     NULL,
    [SalesAmount]           FLOAT (53)     NULL,
    [TaxAmt]                FLOAT (53)     NULL,
    [Freight]               FLOAT (53)     NULL,
    [CarrierTrackingNumber] VARCHAR (8000) NULL,
    [CustomerPONumber]      VARCHAR (8000) NULL,
    [OrderDate]             DATE           NULL,
    [DueDate]               DATE           NULL,
    [ShipDate]              DATE           NULL
);


GO