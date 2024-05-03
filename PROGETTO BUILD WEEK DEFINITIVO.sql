-- Creazione database
CREATE DATABASE VendiCoseSPA;

-- Utilizzo database creato
USE VendiCoseSPA;
    

CREATE TABLE Product(
		ProductKey INT,
		ProductName VARCHAR(100),
        ListPrice DECIMAL(10,2),
        CategoryName VARCHAR(100),
        CONSTRAINT PK_Product PRIMARY KEY(ProductKey)
        );

CREATE TABLE Depot(
		DepotID INT,
        DepotName VARCHAR(100),
        City VARCHAR(100),
        Cap  CHAR(5),                
        Street VARCHAR(100),
        CONSTRAINT PK_Depot PRIMARY KEY(DepotID)
        );

CREATE TABLE Store(
		StoreID INT,
        StoreName VARCHAR(100),
        City VARCHAR(100),
        Cap  CHAR(5),
        Street VARCHAR(100),
        DepotID INT,
        CONSTRAINT PK_Store PRIMARY KEY(StoreID),
        CONSTRAINT FK_Store FOREIGN KEY(DepotID) REFERENCES Depot(DepotID)
		);

CREATE TABLE Sales( 
		SalesOrderNumber INT,
        SalesOrderLineNumber INT,
        OrderQuantity INT,
        UnitPrice DECIMAL(10,2),
        SalesAmount DECIMAL(15,2),
        ProductKey INT,
        StoreID INT,
        OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT PK_Sales PRIMARY KEY(SalesOrderNumber,SalesOrderLineNumber),
        CONSTRAINT FK_Sales_1 FOREIGN KEY (ProductKey) REFERENCES PRODUCT(ProductKey),
        CONSTRAINT FK_Sales_2 FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
		);
      
CREATE TABLE StockDetail(
		ProductKey INT,
        DepotID INT,
        Stock INT,
        RestockLevel INT,
        LastUpdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT PK_Stock PRIMARY KEY(ProductKey,DepotID),
        CONSTRAINT FK_Stock1 FOREIGN KEY (ProductKey) REFERENCES Product(ProductKey),
        CONSTRAINT FK_Stock2 FOREIGN KEY (DepotID) REFERENCES Depot(DepotID)
        );

-- Popolamento della tabella Product
INSERT INTO Product (ProductKey, ProductName, ListPrice, CategoryName)
VALUES
    (1, 'Laptop', 999.99, 'Elettronica'),
    (2, 'Smartphone', 699.99, 'Elettronica'),
    (3, 'TV', 899.99, 'Elettronica'),
    (4, 'Cuffie wireless', 149.99, 'Elettronica'),
    (5, 'Frigorifero', 1499.99, 'Elettrodomestici'),
    (6, 'Lavatrice', 899.99, 'Elettrodomestici'),
    (7, 'Tostapane', 29.99, 'Elettrodomestici'),
    (8, 'Libro', 19.99, 'Libri'),
    (9, 'Felpa', 39.99, 'Abbigliamento'),
    (10, 'Scarpe sportive', 79.99, 'Abbigliamento');

-- Popolamento della tabella Depot
INSERT INTO Depot (DepotID, DepotName, City, Cap, Street)
VALUES
    (1001, 'Deposito principale', 'Roma', '00100', 'Via Roma'),
    (1002, 'Deposito secondario', 'Milano', '20100', 'Via Milano'),
    (1003, 'Deposito magazzino', 'Napoli', '80100', 'Via Napoli'),
    (1004, 'Deposito logistico', 'Torino', '10100', 'Via Torino'),
    (1005, 'Deposito di distribuzione', 'Firenze', '50100', 'Via Firenze');
    
-- Popolamento della tabella Store
INSERT INTO Store (StoreID, StoreName, City, Cap, Street, DepotID)
VALUES
    (2001, 'Negozio principale', 'Roma', '00100', 'Via Roma', 1001),
    (2002, 'Negozio di centro città', 'Milano', '20100', 'Via Milano', 1002),
    (2003, 'Negozio periferico', 'Napoli', '80100', 'Via Napoli', 1003),
    (2004, 'Negozio di quartiere', 'Torino', '10100', 'Via Torino', 1004),
    (2005, 'Negozio centrale', 'Firenze', '50100', 'Via Firenze', 1005),
    (2006, 'Negozio di provincia', 'Bologna', '40100', 'Via Bologna', 1001),
    (2007, 'Negozio di montagna', 'Bolzano', '39100', 'Via Bolzano', 1002),
    (2008, 'Negozio di mare', 'Genova', '16100', 'Via Genova', 1003),
    (2009, 'Negozio di campagna', 'Verona', '37100', 'Via Verona', 1004),
    (2010, 'Negozio di periferia', 'Padova', '35100', 'Via Padova', 1005);

-- Popolamento della tabella StockDetail
INSERT INTO StockDetail (ProductKey, DepotID, Stock, RestockLevel) VALUES 
(1, 1001, 10, 5),
(1, 1002, 15, 7),
(1, 1003, 20, 10),
(1, 1004, 8, 3),
(1, 1005, 12, 6),
(2, 1001, 18, 9),
(2, 1002, 22, 11),
(2, 1003, 25, 12),
(2, 1004, 30, 15),
(2, 1005, 14, 7),
(3, 1001, 5, 2),
(3, 1002, 10, 5),
(3, 1003, 15, 7),
(3, 1004, 20, 10),
(3, 1005, 25, 12),
(4, 1001, 7, 3),
(4, 1002, 9, 4),
(4, 1003, 12, 6),
(4, 1004, 5, 2),
(4, 1005, 10, 5),
(5, 1001, 25, 12),
(5, 1002, 30, 15),
(5, 1003, 35, 18),
(5, 1004, 40, 20),
(5, 1005, 20, 10),
(6, 1001, 15, 7),
(6, 1002, 18, 9),
(6, 1003, 22, 11),
(6, 1004, 10, 5),
(6, 1005, 25, 12),
(7, 1001, 10, 5),
(7, 1002, 10, 5),
(7, 1003, 12, 6),
(7, 1004, 15, 7),
(7, 1005, 6, 3),
(8, 1001, 20, 10),
(8, 1002, 25, 12),
(8, 1003, 30, 15),
(8, 1004, 35, 18),
(8, 1005, 15, 7),
(9, 1001, 12, 6),
(9, 1002, 15, 7),
(9, 1003, 18, 9),
(9, 1004, 20, 10),
(9, 1005, 8, 4),
(10, 1001, 30, 15),
(10, 1002, 35, 18),
(10, 1003, 40, 20),
(10, 1004, 45, 22),
(10, 1005, 20, 10);

-- Popolamento della tabella Sales
INSERT INTO Sales (SalesOrderNumber, SalesOrderLineNumber, OrderQuantity, UnitPrice, SalesAmount, ProductKey, StoreID) VALUES 
(11101, 1, 2, 99.99, 199.98, 1, 2001),
(11101, 2, 1, 149.99, 149.99, 2, 2001),
(11101, 3, 3, 199.99, 599.97, 3, 2001),
(22202, 1, 1, 29.99, 29.99, 4, 2002),
(22202, 2, 2, 399.99, 799.98, 5, 2002),
(22202, 3, 1, 99.99, 99.99, 6, 2002),
(33303, 1, 4, 49.99, 199.96, 7, 2003),
(33303, 2, 2, 79.99, 159.98, 8, 2003),
(33303, 3, 1, 19.99, 19.99, 9, 2003),
(44404, 1, 3, 129.99, 389.97, 10, 2004),
(44404, 2, 2, 89.99, 179.98, 1, 2004),
(44404, 3, 1, 199.99, 199.99, 2, 2004),
(55505, 1, 3, 149.99, 449.97, 3, 2005),
(55505, 2, 1, 39.99, 39.99, 4, 2005),
(55505, 3, 2, 499.99, 999.98, 5, 2005),
(66606, 1, 1, 119.99, 119.99, 6, 2006),
(66606, 2, 4, 59.99, 239.96, 7, 2006),
(66606, 3, 2, 89.99, 179.98, 8, 2006),
(77707, 1, 1, 29.99, 29.99, 9, 2007),
(77707, 2, 3, 149.99, 449.97, 10, 2007),
(77707, 3, 2, 99.99, 199.98, 1, 2007),
(88808, 1, 1, 199.99, 199.99, 2, 2008),
(88808, 2, 3, 199.99, 599.97, 3, 2008),
(88808, 3, 1, 29.99, 29.99, 4, 2008),
(99909, 1, 2, 399.99, 799.98, 5, 2009),
(99909, 2, 1, 99.99, 99.99, 6, 2009),
(99909, 3, 4, 49.99, 199.96, 7, 2009),
(101010, 1, 2, 79.99, 159.98, 8, 2010),
(101010, 2, 1, 19.99, 19.99, 9, 2010),
(101010, 3, 3, 129.99, 389.97, 10, 2010),
(111111, 1, 2, 89.99, 179.98, 1, 2001);


-- Esploriamo la tabella Stock
SELECT *
FROM StockDetail;

-- Esplorazione Sales
SELECT * FROM Sales;

-- Esplorazione Store
SELECT * FROM Store;

-- Esplorazione Depot
SELECT * FROM Depot;

/* Andiamo ad effettuare una INNER JOIN di Sales con Store usando il campo StoreID, in modo tale da ottenere una tabella in cui in ogni record 
abbiamo una riga di scontrino con specificato il prodotto venduto (Productkey), lo store in cui è stato venduto (StoreID) ed il deposito che serve
quello store (DepotID). Dopodichè, andiamo a fare un INNER JOIN di tale tabella risultante con la tabella StockDetail, usando la combinazione di campi ProductKey
e DepotID, in modo da avere associato per ogni record della tabella di partenza anche il dato del LastUpdate, ossia l'istante in cui 
il dato della giacenza di quel prodotto presente in quel deposito servente risulta essere stata aggiornato.
Andiamo a considerare tutte quelle transazioni che si sono verificate dopo l'ultimo aggiornamento della giacenza */

SELECT *
FROM Sales
INNER JOIN Store
ON Sales.StoreID=Store.StoreID
INNER JOIN StockDetail AS Stock 
ON Sales.ProductKey=Stock.ProductKey AND Store.DepotID=Stock.DepotID
WHERE Sales.OrderDate>Stock.LastUpdate
;

-- Trasformiamo la tabella sovrastante, di cui considero solo i campi di interesse, in una VIEW, che chiamo "NewSales"
CREATE VIEW NewSales AS (SELECT Sales.SalesOrderNumber,Sales.SalesOrderLineNumber,Sales.OrderDate,Sales.OrderQuantity,Sales.ProductKey,Sales.UnitPrice,Sales.SalesAmount,
									   Sales.StoreID,Store.DepotID 
								FROM Sales 
								INNER JOIN Store 
								ON Sales.StoreID=Store.StoreID
								INNER JOIN StockDetail AS Stock
								ON Sales.ProductKey=Stock.ProductKey AND Store.DepotID=Stock.DepotID
								WHERE Sales.OrderDate>Stock.LastUpdate);

-- Testiamo la VIEW appena creata (lista delle nuove transazioni)
SELECT DepotID,ProductKey,StoreID,OrderQuantity,SalesOrderNumber,SalesOrderLineNumber
FROM NewSales
ORDER BY DepotID,ProductKey;


/* Effettuiamo sulla tabella ottenuta un raggruppamento che ci consente di ottenere in output una tabella che per ogni coppia deposito-prodotto
ci fa visualizzare la somma delle nuove quantità vendute di quel prodotto negli store serviti da quel deposito, laddove tale somma
equivale alla quantità da sottrarre alla giacenza corrente di quel prodotto in quel deposito*/
SELECT DepotID,ProductKey,SUM(OrderQuantity) AS QuantitàDaSottrarre
FROM NewSales
GROUP BY DepotID,ProductKey;


-- Creiamo una VIEW basata sulla tabella sovrastante, chiamata "QuantitàDaSottrarreProdottoPerDeposito"
CREATE VIEW QuantitàDaSottrarreProdottoPerDeposito AS  (SELECT DepotID,ProductKey,SUM(OrderQuantity) AS QuantitàDaSottrarre
														FROM NewSales
														GROUP BY DepotID,ProductKey);

-- Testiamo la VIEW appena creata
SELECT * 
FROM QuantitàDaSottrarreProdottoPerDeposito;

/* Adesso andiamo ad effettuare un INNER JOIN della tabella QuantitàDaSottrarreProdottoPerDeposito con la tabella StockDetail usando i campi
-- DepotID e ProductKey, in modo che in ogni record della tabella risultante abbiamo, per un deposito, in relazione ad un prodotto
-- la quantità da sottrarre alla giacenza di quel prodotto in quel deposito e la giacenza corrente */
SELECT s.DepotID, s.ProductKey, s.Stock, s.RestockLevel, q.QuantitàDaSottrarre
FROM QuantitàDaSottrarreProdottoPerDeposito AS q 
INNER JOIN StockDetail AS s
ON q.DepotID=s.DepotID AND q.ProductKey=s.ProductKey;

-- Da questa andiamo a considerare solo i campi che mi interessano e calcolo la nuova giacenza per ogni prodotto in ogni deposito
SELECT q.DepotID,q.ProductKey,s.Stock-q.QuantitàDaSottrarre AS UpdatedStock
FROM QuantitàDaSottrarreProdottoPerDeposito AS q INNER JOIN StockDetail AS s
ON q.DepotID=s.DepotID AND q.ProductKey=s.ProductKey;

-- Creiamo una VIEW basata su tale tabella e la chiamiamo "NewStock"
CREATE VIEW NewStock AS (SELECT q.ProductKey,q.DepotID,s.Stock-q.QuantitàDaSottrarre AS UpdatedStock
						FROM QuantitàDaSottrarreProdottoPerDeposito AS q INNER JOIN StockDetail AS s
						ON q.DepotID=s.DepotID AND q.ProductKey=s.ProductKey);

-- Testiamo la VIEW
SELECT *
FROM NewStock;

-- Verifica funzionamento aggiornamento automatico dei dati di giacenza
START TRANSACTION;

-- Consideriamo un record della tabella StockDetail
SELECT ProductKey,DepotID,Stock
FROM StockDetail
ORDER BY ProductKey,DepotID 
LIMIT 1;

-- Vediamo se, alla luce delle nuove vendite, a questo prodotto in questo deposito bisogna associare un dato aggiornato della giacenza (UpdatedStock)
SELECT *
FROM NewStock
WHERE ProductKey= (SELECT ProductKey FROM StockDetail ORDER BY ProductKey,DepotID  LIMIT 1) AND DepotID=(SELECT DepotID FROM StockDetail ORDER BY ProductKey,DepotID  LIMIT 1);

-- Aggiorniamo la giacenza di tale prodotto in tale deposito
UPDATE StockDetail AS s 
INNER JOIN NewStock AS ns 
ON s.ProductKey = ns.ProductKey AND s.DepotID = ns.DepotID
SET s.Stock = ns.UpdatedStock; 

-- Vediamo se in StockDetail tale giacenza è stata aggiornata
SELECT *
FROM StockDetail
ORDER BY ProductKey,DepotID 
LIMIT 1;

ROLLBACK;

-- TRIGGER - Automatizziamo la tabella StockDetails ad ogni nuova vendita
START TRANSACTION;

-- Creazione trigger per aggiornamento automatico dei dati di giacenza
DELIMITER //
CREATE TRIGGER after_insert_sales
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    UPDATE StockDetail AS s 
		INNER JOIN NewStock AS ns 
		ON s.ProductKey = ns.ProductKey AND s.DepotID = ns.DepotID
		SET s.Stock = ns.UpdatedStock;
END;
//
DELIMITER ;

-- Nuova vendita per testare il trigger
INSERT INTO Sales (SalesOrderNumber, SalesOrderLineNumber, OrderQuantity, UnitPrice, SalesAmount, ProductKey, StoreID) VALUES 
(12481, 1, 2, 99.99, 199.98, 1, 2001);

SELECT * 
FROM StockDetail
WHERE ProductKey=1 AND DepotID=1001;

ROLLBACK;

-- ISTRUZIONI PER VERIFICARE QUANTE UNITA' DI PRODOTTO CI SONO IN UN DATO MAGAZZINO
-- Partiamo con delle INNER JOIN per ottenere una tabella con tutte le informazioni che ci interessano
SELECT *
FROM StockDetail AS s
INNER JOIN Product AS p
ON s.ProductKey=p.ProductKey
INNER JOIN Depot AS d
ON s.DepotID=d.DepotID;

-- Consideriamo solo i campi che mi interessano
SELECT p.ProductName,d.DepotName,s.Stock,s.RestockLevel
FROM StockDetail AS s
INNER JOIN Product AS p
ON s.ProductKey=p.ProductKey
INNER JOIN Depot AS d
ON s.DepotID=d.DepotID;



