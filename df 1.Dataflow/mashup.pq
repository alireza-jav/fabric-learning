[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = Lakehouse.Contents([EnableFolding = false]){[workspaceId = "fd0500ad-0174-495a-b7f6-0010b21c538e"]}[Data]{[lakehouseId = "5ab3a860-3f2c-4786-a4c9-42e142c44afb"]}[Data];
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimProduct_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "ProductKey", DestinationColumnName = "ProductKey"], [SourceColumnName = "ProductAlternateKey", DestinationColumnName = "ProductAlternateKey"], [SourceColumnName = "ProductSubcategoryKey", DestinationColumnName = "ProductSubcategoryKey"], [SourceColumnName = "WeightUnitMeasureCode", DestinationColumnName = "WeightUnitMeasureCode"], [SourceColumnName = "SizeUnitMeasureCode", DestinationColumnName = "SizeUnitMeasureCode"], [SourceColumnName = "EnglishProductName", DestinationColumnName = "EnglishProductName"], [SourceColumnName = "SpanishProductName", DestinationColumnName = "SpanishProductName"], [SourceColumnName = "FrenchProductName", DestinationColumnName = "FrenchProductName"], [SourceColumnName = "StandardCost", DestinationColumnName = "StandardCost"], [SourceColumnName = "FinishedGoodsFlag", DestinationColumnName = "FinishedGoodsFlag"], [SourceColumnName = "Color", DestinationColumnName = "Color"], [SourceColumnName = "SafetyStockLevel", DestinationColumnName = "SafetyStockLevel"], [SourceColumnName = "ReorderPoint", DestinationColumnName = "ReorderPoint"], [SourceColumnName = "ListPrice", DestinationColumnName = "ListPrice"], [SourceColumnName = "Size", DestinationColumnName = "Size"], [SourceColumnName = "SizeRange", DestinationColumnName = "SizeRange"], [SourceColumnName = "Weight", DestinationColumnName = "Weight"], [SourceColumnName = "DaysToManufacture", DestinationColumnName = "DaysToManufacture"], [SourceColumnName = "ProductLine", DestinationColumnName = "ProductLine"], [SourceColumnName = "DealerPrice", DestinationColumnName = "DealerPrice"], [SourceColumnName = "Class", DestinationColumnName = "Class"], [SourceColumnName = "Style", DestinationColumnName = "Style"], [SourceColumnName = "ModelName", DestinationColumnName = "ModelName"], [SourceColumnName = "LargePhoto", DestinationColumnName = "LargePhoto"], [SourceColumnName = "EnglishDescription", DestinationColumnName = "EnglishDescription"], [SourceColumnName = "FrenchDescription", DestinationColumnName = "FrenchDescription"], [SourceColumnName = "ChineseDescription", DestinationColumnName = "ChineseDescription"], [SourceColumnName = "ArabicDescription", DestinationColumnName = "ArabicDescription"], [SourceColumnName = "HebrewDescription", DestinationColumnName = "HebrewDescription"], [SourceColumnName = "ThaiDescription", DestinationColumnName = "ThaiDescription"], [SourceColumnName = "GermanDescription", DestinationColumnName = "GermanDescription"], [SourceColumnName = "JapaneseDescription", DestinationColumnName = "JapaneseDescription"], [SourceColumnName = "TurkishDescription", DestinationColumnName = "TurkishDescription"], [SourceColumnName = "StartDate", DestinationColumnName = "StartDate"], [SourceColumnName = "EndDate", DestinationColumnName = "EndDate"], [SourceColumnName = "Status", DestinationColumnName = "Status"]}], DynamicSchema = true, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared DimProduct = let
  Source = Excel.Workbook(Web.Contents("https://idodata.com/wp-content/uploads/2025/08/FabricData.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "DimProduct", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ProductKey", Int64.Type}, {"ProductAlternateKey", type text}, {"ProductSubcategoryKey", type text}, {"WeightUnitMeasureCode", type text}, {"SizeUnitMeasureCode", type text}, {"EnglishProductName", type text}, {"StandardCost", type text}, {"FinishedGoodsFlag", Int64.Type}, {"Color", type text}, {"SafetyStockLevel", Int64.Type}, {"ReorderPoint", Int64.Type}, {"ListPrice", type text}, {"Size", type text}, {"SizeRange", type text}, {"DaysToManufacture", Int64.Type}, {"ProductLine", type text}, {"DealerPrice", type text}, {"Class", type text}, {"Style", type text}, {"ModelName", type text}, {"LargePhoto", type text}, {"EnglishDescription", type text}, {"FrenchDescription", type text}, {"ChineseDescription", type text}, {"ArabicDescription", type text}, {"HebrewDescription", type text}, {"ThaiDescription", type text}, {"GermanDescription", type text}, {"JapaneseDescription", type text}, {"TurkishDescription", type text}, {"StartDate", type datetime}, {"EndDate", type text}, {"Status", type text}, {"SpanishProductName", type text}, {"FrenchProductName", type text}, {"Weight", type number}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimProductCategory_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared DimProductCategory = let
  Source = Excel.Workbook(Web.Contents("https://idodata.com/wp-content/uploads/2025/08/FabricData.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "DimProductCategory", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ProductCategoryKey", Int64.Type}, {"ProductCategoryAlternateKey", Int64.Type}, {"EnglishProductCategoryName", type text}, {"SpanishProductCategoryName", type text}, {"FrenchProductCategoryName", type text}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimProductSubcategory_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared DimProductSubcategory = let
  Source = Excel.Workbook(Web.Contents("https://idodata.com/wp-content/uploads/2025/08/FabricData.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "DimProductSubcategory", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ProductSubcategoryKey", Int64.Type}, {"ProductSubcategoryAlternateKey", Int64.Type}, {"EnglishProductSubcategoryName", type text}, {"SpanishProductSubcategoryName", type text}, {"FrenchProductSubcategoryName", type text}, {"ProductCategoryKey", Int64.Type}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "FactInternetSales_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared FactInternetSales = let
  Source = Excel.Workbook(Web.Contents("https://idodata.com/wp-content/uploads/2025/08/FabricData.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "FactInternetSales", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ProductKey", Int64.Type}, {"OrderDateKey", Int64.Type}, {"DueDateKey", Int64.Type}, {"ShipDateKey", Int64.Type}, {"CustomerKey", Int64.Type}, {"PromotionKey", Int64.Type}, {"CurrencyKey", Int64.Type}, {"SalesTerritoryKey", Int64.Type}, {"SalesOrderNumber", type text}, {"SalesOrderLineNumber", Int64.Type}, {"RevisionNumber", Int64.Type}, {"OrderQuantity", Int64.Type}, {"UnitPrice", type number}, {"ExtendedAmount", type number}, {"UnitPriceDiscountPct", Int64.Type}, {"DiscountAmount", Int64.Type}, {"ProductStandardCost", type number}, {"TotalProductCost", type number}, {"SalesAmount", type number}, {"TaxAmt", type number}, {"Freight", type number}, {"CarrierTrackingNumber", type text}, {"CustomerPONumber", type text}, {"OrderDate", type date}, {"DueDate", type date}, {"ShipDate", type date}})
in
  #"Changed column type";
shared DimProduct_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "fd0500ad-0174-495a-b7f6-0010b21c538e"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "5ab3a860-3f2c-4786-a4c9-42e142c44afb"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "DimProduct", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared DimProductCategory_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "fd0500ad-0174-495a-b7f6-0010b21c538e"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "5ab3a860-3f2c-4786-a4c9-42e142c44afb"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "DimProductCategory", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared DimProductSubcategory_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "fd0500ad-0174-495a-b7f6-0010b21c538e"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "5ab3a860-3f2c-4786-a4c9-42e142c44afb"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "DimProductSubcategory", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared FactInternetSales_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "fd0500ad-0174-495a-b7f6-0010b21c538e"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "5ab3a860-3f2c-4786-a4c9-42e142c44afb"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "FactInternetSales", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
