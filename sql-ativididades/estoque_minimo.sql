CREATE DATABASE IF NOT EXISTS ESTOQUE;
USE ESTOQUE;

CREATE TABLE IF NOT EXISTS PRODUTOS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(255) NOT NULL,
    QUANTIDADE INT NOT NULL
);

INSERT INTO PRODUTOS (NOME, QUANTIDADE)
VALUES ('Sabonete', 50),
       ('Shampoo', 30),
       ('Escova de Dentes', 100),
       ('Toalha de Papel', 20),
       ('Detergente', 40);

CREATE OR REPLACE VIEW VW_ESTOQUE_INSUFICIENTE AS
SELECT ID, NOME, QUANTIDADE
FROM PRODUTOS 
WHERE QUANTIDADE < 25;

SELECT * FROM VW_ESTOQUE_INSUFICIENTE;
