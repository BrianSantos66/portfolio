--1
INSERT INTO Fornecedor
VALUES('Ambev'),('P&G'),('Dist. PPG')

INSERT INTO Produto(Nome, ID_FornecedorPadrao)
VALUES('Skol', 1),('Fralda Pampers', 2)


INSERT INTO Compra(NF, DiasEntrega, Valor, [Data])
VALUES('#112434', 3, 8243.00, '20171021'),('#324235', 10, 1230.00, '201021'),
('#455464', 2, 500.00, '20171026')

INSERT INTO ItemCompra(ID_Produto, ID_Fornecedor, NF_Compra, QTDE)
VALUES( 1, 1, '#112434', 300),(2, 2, '#324235', 25), (2, 3, '#455464', 10)


--2
DELETE FROM ItemCompra WHERE ID_Produto = 1
DELETE FROM Compra WHERE NF = '#112434'
DELETE FROM Produto WHERE ID_FornecedorPadrao = 1
DELETE FROM Fornecedor WHERE ID = 1

--3 
UPDATE Compra
SET [Data] = '20171028'
WHERE NF = '#455464'