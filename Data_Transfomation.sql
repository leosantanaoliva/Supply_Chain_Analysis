-- Set the database context
USE DATABASE Supply_chain;
USE SCHEMA public; 

-- Create Dimension Tables
CREATE OR REPLACE TABLE Dimension_ProductType (
    ProductTypeID INTEGER AUTOINCREMENT PRIMARY KEY,
    ProductType VARCHAR(255) NOT NULL
);

CREATE OR REPLACE TABLE Dimension_Product (
    SKU VARCHAR(50) PRIMARY KEY,
    ProductDescription VARCHAR(255)
);

CREATE OR REPLACE TABLE Dimension_StockLevel (
    StockLevelID INTEGER AUTOINCREMENT PRIMARY KEY,
    StockLevels VARCHAR(50)
);

CREATE OR REPLACE TABLE Dimension_LeadTime (
    LeadTimeID INTEGER AUTOINCREMENT PRIMARY KEY,
    LeadTime VARCHAR(50)
);

CREATE OR REPLACE TABLE Dimension_ShippingTime (
    ShippingTimeID INTEGER AUTOINCREMENT PRIMARY KEY,
    ShippingTime VARCHAR(50)
);

CREATE OR REPLACE TABLE Dimension_ShippingCarrier (
    ShippingCarrierID INTEGER AUTOINCREMENT PRIMARY KEY,
    ShippingCarrier VARCHAR(255)
);

CREATE OR REPLACE TABLE Dimension_Supplier (
    SupplierID INTEGER AUTOINCREMENT PRIMARY KEY,
    SupplierName VARCHAR(255),
    Location VARCHAR(255)
);

CREATE OR REPLACE TABLE Dimension_TransportationMode (
    TransportationModeID INTEGER AUTOINCREMENT PRIMARY KEY,
    TransportationMode VARCHAR(255)
);

CREATE OR REPLACE TABLE Dimension_Route (
    RouteID INTEGER AUTOINCREMENT PRIMARY KEY,
    Routes VARCHAR(255)
);

-- Create Fact Table
CREATE OR REPLACE TABLE Fact_SupplyChain (
    FactID INTEGER AUTOINCREMENT PRIMARY KEY,
    ProductTypeID INTEGER,
    SKU VARCHAR(50),
    Price DECIMAL(10, 2),
    Availability VARCHAR(50),
    NumberOfProductsSold INTEGER,
    RevenueGenerated DECIMAL(15, 2),
    StockLevelID INTEGER,
    LeadTimeID INTEGER,
    OrderQuantity INTEGER,
    ShippingTimeID INTEGER,
    ShippingCarrierID INTEGER,
    ShippingCost DECIMAL(10, 2),
    SupplierID INTEGER,
    TransportationModeID INTEGER,
    RouteID INTEGER,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (ProductTypeID) REFERENCES Dimension_ProductType(ProductTypeID),
    FOREIGN KEY (SKU) REFERENCES Dimension_Product(SKU),
    FOREIGN KEY (StockLevelID) REFERENCES Dimension_StockLevel(StockLevelID),
    FOREIGN KEY (LeadTimeID) REFERENCES Dimension_LeadTime(LeadTimeID),
    FOREIGN KEY (ShippingTimeID) REFERENCES Dimension_ShippingTime(ShippingTimeID),
    FOREIGN KEY (ShippingCarrierID) REFERENCES Dimension_ShippingCarrier(ShippingCarrierID),
    FOREIGN KEY (SupplierID) REFERENCES Dimension_Supplier(SupplierID),
    FOREIGN KEY (TransportationModeID) REFERENCES Dimension_TransportationMode(TransportationModeID),
    FOREIGN KEY (RouteID) REFERENCES Dimension_Route(RouteID)
);
