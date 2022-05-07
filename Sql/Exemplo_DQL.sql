--1
SELECT Nome AS 'Nome dos Produtos'
FROM Produto

--2
SELECT NF AS 'Nota Fiscal'
FROM Compra 
WHERE [Data] > '20170101' AND DiasEntrega > 10
-- Como no enunciado foi utilizado o termo 'superior á 10' e não 'superior ou igual á 10', interpretei que o uso do '>' seria o correto.

--3
SELECT P.Nome AS 'Nome do Produto', F.Nome AS 'Nome do Fornecedor', I.QTDE AS 'Quantidade fornecida'
FROM Produto AS P INNER JOIN ItemCompra AS I ON P.ID = I.ID_Produto
				  INNER JOIN Fornecedor AS F ON F.ID = I.ID_Fornecedor

--4
SELECT P.Nome AS 'Nome do Produto', F.Nome AS 'Nome do Fornecedor Padrão'
FROM Produto AS P INNER JOIN Fornecedor AS F ON F.ID = P.ID_FornecedorPadrao

--5
SELECT C.NF AS 'Nota Fiscal', P.Nome AS 'Nome do Produto', C.[Data] AS 'Data da Compra', I.QTDE AS 'Quantidade', C.Valor AS 'Valor Cobrado'
FROM Compra AS C INNER JOIN ItemCompra AS I ON C.NF = I.NF_Compra
				 INNER JOIN Produto AS P ON P.ID = I.ID_Produto