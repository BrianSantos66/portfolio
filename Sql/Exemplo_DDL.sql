CREATE DATABASE AC1
USE AC1

CREATE TABLE tbCompra(
    NF INT NOT NULL,
    Dias_Entrega TINYINT NOT NULL,
    Valor MONEY NOT NULL,
    [Data] DATE NOT NULL,
    CONSTRAINT PK_tbCompra PRIMARY KEY (NF)
)

CREATE TABLE tbFornecedor(
    ID INT IDENTITY NOT NULL,
    Nome VARCHAR(40) NOT NULL,
    CONSTRAINT PK_tbFornecedor PRIMARY KEY (ID)
)

CREATE TABLE tbProduto(
    ID INT IDENTITY NOT NULL,
    Nome VARCHAR(30),
    ID_Fornecedor_Padrao INT NOT NULL,
    CONSTRAINT FK_tbFornecedor_Padrao FOREIGN KEY (ID_Fornecedor_Padrao) REFERENCES tbFornecedor (ID),
    CONSTRAINT PK_tbProduto PRIMARY KEY (ID)
)

CREATE TABLE tbItem_Compra(
    ID_Produto INT NOT NULL,
    ID_Fornecedor INT NOT NULL,
    NF_Compra INT NOT NULL,
    Quantidade INT NOT NULL,
    CONSTRAINT FK_tbProduto FOREIGN KEY (ID_Produto) REFERENCES tbProduto (ID),
    CONSTRAINT FK_tbFornecedor FOREIGN KEY (ID_Fornecedor) REFERENCES tbFornecedor (ID),
    CONSTRAINT FK_tbCompra FOREIGN KEY (NF_Compra) REFERENCES tbCompra (NF)
)