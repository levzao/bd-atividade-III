CREATE DATABASE IF NOT EXISTS relacionamento;
USE relacionamento;

CREATE TABLE IF NOT EXISTS relacionamento (
    idRelacionamento INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255) NOT NULL
);

INSERT INTO relacionamento (tipo) VALUES
    ('Parente'),
    ('Amigo'),
    ('Conhecido');

CREATE TABLE IF NOT EXISTS cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idRelacionamento INT,
    FOREIGN KEY (idRelacionamento) REFERENCES relacionamento(idRelacionamento)
);

INSERT INTO cliente (nome, idRelacionamento) VALUES
    ('Joao', 1),
    ('Maria', 2),
    ('Carlos', 3);

CREATE TABLE IF NOT EXISTS vendedor (
    idVendedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

INSERT INTO vendedor (nome, idCliente) VALUES
    ('Pedro', 1),
    ('Lucas', 2),
    ('Ana', 3);

CREATE OR REPLACE VIEW vw_relacionamento_cliente_vendedor AS
SELECT
    c.idCliente,
    c.nome AS 'Nome do Cliente',
    v.idVendedor,
    v.nome AS 'Nome do Vendedor',
    r.idRelacionamento,
    r.tipo AS 'Tipo do Relacionamento'
FROM cliente c
INNER JOIN vendedor v ON c.idCliente = v.idCliente
INNER JOIN relacionamento r ON c.idRelacionamento = r.idRelacionamento
ORDER BY c.idCliente;

SELECT * FROM vw_relacionamento_cliente_vendedor;
