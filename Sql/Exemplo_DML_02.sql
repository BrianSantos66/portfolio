-- 1
INSERT INTO Livro(Nome,Copia,[Status])
VALUES ('A Arte da Guerra', 1, 'Atrasado'),
	   ('A Arte da Guerra', 2,'Livre'),
	   ('O Pequeno Principe', 1, 'Emprestado')
GO

INSERT INTO Cliente(ID, Nome, Telefone)
VALUES (1,'José da Silva', 991235344),
       (2, 'Igor Pereira', 33120123)
GO

INSERT INTO Emprestimo(Livro, Copia, ID_Cliente, DataEmprestimo, DataDevolucaoProposta, Multa)
VALUES ('A Arte da Guerra', 1, 1, '20171008', '20170910', 11.00),
	   ('O Pequeno Principe', 1, 2, '20170915', '20171015', NULL)
GO

-- 2 
DELETE FROM Emprestimo WHERE Livro = 'O pequeno Principe'
DELETE FROM Livro WHERE Nome = 'O pequeno Principe'

-- 3
INSERT INTO Emprestimo(Livro, Copia, ID_Cliente, DataEmprestimo, DataDevolucaoProposta)
VALUES ('A Arte da Guerra', 2, 2, '20170321', '20170421')
GO

UPDATE Livro SET [Status] = 'Emprestado'
WHERE Nome = 'A Arte da Guerra' AND Copia = 2

SELECT * FROM Livro
SELECT * FROM Cliente
SELECT * FROM Emprestimo
