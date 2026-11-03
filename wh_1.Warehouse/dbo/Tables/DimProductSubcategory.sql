CREATE TABLE [dbo].[DimProductSubcategory] (
    [ProductSubcategoryKey]          BIGINT         NULL,
    [ProductSubcategoryAlternateKey] BIGINT         NULL,
    [EnglishProductSubcategoryName]  VARCHAR (8000) NULL,
    [SpanishProductSubcategoryName]  VARCHAR (8000) NULL,
    [FrenchProductSubcategoryName]   VARCHAR (8000) NULL,
    [ProductCategoryKey]             BIGINT         NULL
);


GO