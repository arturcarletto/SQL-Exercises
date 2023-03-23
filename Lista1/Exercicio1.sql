/*

Exercício 1

a. Faça os scripts para a criação das tabelas, sem as constraints;
b. Faça os scripts para a criação das chaves primárias das tabelas criadas;
c. Faça os scripts para a criação das chaves secundárias das tabelas criadas;
d. Crie um índice para a chave estrangeira da tabela de produtos;
e. Crie um índice para a chave estrangeira da tabela de pedidos;
f. Adicione o campo endereço na tabela de fornecedores;
g. Faça a inserção de um novo cliente com os seguintes dados: Nome = Fabiano,
Telefone = 99879375 e Endereço = Rua Tijucas, 110, Centro, Joinville – S.C;
h. Faça a inserção de um novo pedido com os seguintes dados: Data do Pedido =
31/01/2008, Cliente = Fabiano (exercício i), Data de Entrega = 05/02/2008 e
Total = 54,00;
i. Atualize o telefone do cliente Fabiano (exercício i) para 99012567;
j. Apague as inserções feitas nos exercícios i e j;
k. Faça o script para excluir todas as tabelas criadas no exercício a.

*/

--a. Faça os scripts para a criação das tabelas, sem as constraints;
CREATE TABLE PRODUCTREQUEST 
(
    CDPRODUCTREQUEST INT NOT NULL,
    CDREQUEST INT NOT NULL,
    CDPRODUCT INT NOT NULL,
    QTPRODUCT INT NOT NULL,
    VLTOTAL DECIMAL(10,2) NOT NULL
)

CREATE TABLE REQUEST
(
    CDREQUEST INT NOT NULL,
    DTREQUEST DATE NOT NULL,
    CDCUSTOMER INT NOT NULL,
    DTDELIVER DATE NOT NULL,
    VLTOTAL DECIMAL(10,2) NOT NULL
)

CREATE TABLE CUSTOMER
(
    CDCUSTOMER INT NOT NULL,
    NMCUSTOMER VARCHAR(50) NOT NULL,
    NRFONE VARCHAR(50) NOT NULL,
    DSADRESS VARCHAR(50) NOT NULL
)

CREATE TABLE PRODUCT
(
    CDPRODUCT INT NOT NULL,
    NMPRODUCT VARCHAR(50) NOT NULL,
    CDSUPPLIER INT NOT NULL,
    VLPRICE DECIMAL(10,2) NOT NULL,
    QTSTOCK INT NOT NULL
)

CREATE TABLE SUPPLIER
(
    CDSUPPLIER INT NOT NULL,
    NMSUPPLIER VARCHAR(50) NOT NULL,
    NRFONE VARCHAR(50) NOT NULL
)

--b. Faça os scripts para a criação das chaves primárias das tabelas criadas;
ALTER TABLE PRODUCTREQUEST ADD CONSTRAINT PK_PRODUCTREQUEST PRIMARY KEY (CDPRODUCTREQUEST);
ALTER TABLE REQUEST ADD CONSTRAINT PK_REQUEST PRIMARY KEY (CDREQUEST);
ALTER TABLE CUSTOMER ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (CDCUSTOMER);
ALTER TABLE PRODUCT ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (CDPRODUCT);
ALTER TABLE SUPPLIER ADD CONSTRAINT PK_SUPPLIER PRIMARY KEY (CDSUPPLIER);

-- c. Faça os scripts para a criação das chaves secundárias das tabelas criadas;
ALTER TABLE PRODUCTREQUEST ADD CONSTRAINT FK_PRODUCTREQUEST_REQUEST FOREIGN KEY (CDREQUEST) REFERENCES REQUEST(CDREQUEST);
ALTER TABLE PRODUCTREQUEST ADD CONSTRAINT FK_PRODUCTREQUEST_PRODUCT FOREIGN KEY (CDPRODUCT) REFERENCES PRODUCT(CDPRODUCT);
ALTER TABLE REQUEST ADD CONSTRAINT FK_REQUEST_CUSTOMER FOREIGN KEY (CDCUSTOMER) REFERENCES CUSTOMER(CDCUSTOMER);
ALTER TABLE PRODUCT ADD CONSTRAINT FK_PRODUCT_SUPPLIER FOREIGN KEY (CDSUPPLIER) REFERENCES SUPPLIER(CDSUPPLIER);

--d. Crie um índice para a chave estrangeira da tabela de produtos;
CREATE INDEX IDX_PRODUCT_CDSUPPLIER ON PRODUCT(CDSUPPLIER);

--e. Crie um índice para a chave estrangeira da tabela de pedidos;
CREATE INDEX IDX_REQUEST_CDCUSTOMER ON REQUEST(CDCUSTOMER);

-- f. Adicione o campo endereço na tabela de fornecedores;
ALTER TABLE SUPPLIER ADD DSADRESS VARCHAR(50);

-- g. Faça a inserção de um novo cliente com os seguintes dados: Nome = Fabiano,
-- Telefone = 99879375 e Endereço = Rua Tijucas, 110, Centro, Joinville – S.C;
INSERT INTO CUSTOMER (CDCUSTOMER, NMCUSTOMER, NRFONE, DSADRESS) VALUES (1, 'Fabiano', '99879375', 'Rua Tijucas, 110, Centro, Joinville – S.C');

-- h. Faça a inserção de um novo pedido com os seguintes dados: Data do Pedido =
-- 31/01/2008, Cliente = Fabiano (exercício i), Data de Entrega = 05/02/2008 e Total = 54,00;
INSERT INTO REQUEST (CDREQUEST, DTREQUEST, CDCUSTOMER, DTDELIVER, VLTOTAL) VALUES (1, '2008-01-31', 1, '2008-02-05', 54.00);

-- i. Atualize o telefone do cliente Fabiano (exercício i) para 99012567;
UPDATE CUSTOMER SET NRFONE = '99012567' WHERE CDCUSTOMER = 1;

-- j. Apague as inserções feitas nos exercícios i e j;
DELETE FROM CUSTOMER WHERE CDCUSTOMER = 1;

-- k. Faça o script para excluir todas as tabelas criadas no exercício a.
DROP TABLE PRODUCTREQUEST;
DROP TABLE REQUEST;
DROP TABLE CUSTOMER;
DROP TABLE PRODUCT;
DROP TABLE SUPPLIER;