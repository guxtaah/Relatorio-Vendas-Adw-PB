CREATE OR ALTER VIEW Resultados_ADW AS
(SELECT 
	fis.SalesOrderNumber AS 'Nº Pedido',
	fis.OrderDate AS 'Data Pedido',
	dpc.EnglishProductCategoryName AS 'Categoria Produto',
	dc.CustomerKey AS 'ID Cliente',
	dc.FirstName + ' ' + LastName AS 'Nome Cliente',
	REPLACE(REPLACE(dc.Gender, 'M', 'Masculino'), 'F','Femino') AS 'Genero',
	dg.EnglishCountryRegionName AS 'Pais',
	fis.OrderQuantity AS 'Qtd Vedida',
	fis.SalesAmount AS 'Receita Venda',
	fis.TotalProductCost AS 'Custo Venda',
	fis.SalesAmount - TotalProductCost AS 'Lucro Venda'
FROM FactInternetSales fis
INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
INNER JOIN DimGeography dg ON dc.GeographyKey = dg.GeographyKey)

SELECT * FROM Resultados_ADW

DROP VIEW Resultados_ADW