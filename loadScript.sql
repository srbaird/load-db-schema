/*
	Load the currency meta data
*/
SELECT "Update currency meta data";

INSERT INTO pData.currencies (dsCode, ISOFrom, ISOTo) 
SELECT 	l.dsCode
,		l.ISOFrom
,		l.ISOTo
FROM 	pLoad.currencyMeta l
ON DUPLICATE KEY UPDATE 
		ISOFrom = l.ISOFrom
,		ISOTo 	= l.ISOTo;

SELECT * FROM pData.currencies;


/*
	Load the currency values
*/
SELECT "Update currency values";

INSERT INTO pData.currencyValues (dsCode, valueDate, value) 
SELECT 	l.dsCode
,		l.valueDate
,		l.rate
FROM 	pLoad.currencyLoad l
ON DUPLICATE KEY UPDATE
		valueDate = l.valueDate
,		value = l.rate;

SELECT Count(*) FROM pData.currencyValues;



/*
	Load the rates meta data
*/
SELECT "Update rates meta data";

INSERT INTO pData.rates (dsCode, dsDescription) 
SELECT 	l.dsCode
,		l.dsDescription
FROM 	pLoad.ratesMeta l
ON DUPLICATE KEY UPDATE dsDescription = l.dsDescription;

SELECT Count(*) FROM pData.rates;

/*
	Load the rate values
*/
SELECT "Update rate values";

INSERT INTO pData.rateValues (dsCode, valueDate, value) 
SELECT 	l.dsCode
,		l.valueDate
,		l.value
FROM 	pLoad.ratesLoad l
ON DUPLICATE KEY UPDATE
		valueDate = l.valueDate
,		value = l.value;

SELECT Count(*) FROM pData.rateValues;


/*
	Load the Equities meta data
*/
SELECT "Update equities meta data";

INSERT INTO pData.equities (dsCode, dsDescription) 
SELECT 	l.dsCode
,		l.dsDescription
FROM 	pLoad.equitiesMeta l
ON DUPLICATE KEY UPDATE dsDescription = l.dsDescription;


SELECT	Count(*)
FROM	pData.equities;

SELECT * FROM pData.equities;

/*
	Load the Equities price data
*/
SELECT "Update equities price data";

INSERT INTO pData.equityPrices (dsCode, valueDate, openPrice, highPrice, lowPrice, closePrice, volume ) 
SELECT 	l.dsCode
, 		l.valueDate
, 		l.openPrice
, 		l.highPrice
, 		l.lowPrice
, 		l.closePrice
, 		l.volume
FROM 	pLoad.equitiesLoad l
ON DUPLICATE KEY UPDATE 
		valueDate 	=	l.valueDate
,		openPrice	=	l.openPrice
,		highPrice	=	l.highPrice
,		lowPrice	= 	l.lowPrice
,		closePrice	=	l.closePrice
,		volume 		=	l.volume;

SELECT Count(*) FROM pData.equityPrices;

