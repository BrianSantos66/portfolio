CREATE DATABASE Rodizio_Compras
GO
USE Rodizio_Compras
GO
--Criação das Tabelas
CREATE TABLE Pessoa(
	 ID INT IDENTITY NOT NULL,
	 Nome VARCHAR(20) NOT NULL,
	 CONSTRAINT PK_Pessoa PRIMARY KEY (ID)
)

CREATE TABLE Compra(
	ID INT IDENTITY NOT NULL,
	ID_Pessoa INT NOT NULL,
	Dia_Compra DATE NOT NULL,
	Total SMALLMONEY NOT NULL,
	CONSTRAINT PK_Compra PRIMARY KEY (ID),
	CONSTRAINT FK_Pessoa FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa (ID)
)

CREATE TABLE ItemCompra(
	ID_Compra INT NOT NULL,
	Produto VARCHAR(20) NOT NULL,
	Preco SMALLMONEY NOT NULL,
	CONSTRAINT FK_Compra FOREIGN KEY (ID_Compra) REFERENCES Compra (ID)
)
--Inserindo Pessoas
INSERT INTO Pessoa
VALUES('Cleiton'), ('Astolfo'), ('Ednaldo')

--Inserindo Compras
INSERT INTO Compra
VALUES(1,'20220502',231.22), (2,'20220505',84.62),(3,'20220515',100.00),(1,'20220601',507.54)

--Inserindo Itens das Compras
INSERT INTO ItemCompra
VALUES(1,'Sabão em Pó', 10.99),(1,'Arroz', 25.99),(2,'Queijo', 10.99),(2,'Pão', 24.99),
(3,'Presunto', 10.99),(3,'Feijão', 10.99)

--Conferência
SELECT * FROM Pessoa
SELECT * FROM Compra
SELECT * FROM ItemCompra


--1
SELECT P.Nome, C.Dia_Compra AS 'Data da Compra'
FROM Pessoa AS P INNER JOIN Compra AS C ON P.ID = C.ID_Pessoa

--2
SELECT P.Nome, COUNT(*) AS 'Quantidade de idas ao mercado por pessoa'
FROM Pessoa AS P INNER JOIN Compra AS C ON P.ID = C.ID_Pessoa
GROUP BY P.Nome

--3
SELECT P.Nome, MAX(C.Dia_Compra) AS 'Última compra realizada'
FROM Pessoa AS P INNER JOIN Compra AS C ON P.ID = C.ID_Pessoa
GROUP BY P.Nome
ORDER BY 'Última compra realizada' DESC