CREATE DATABASE IF NOT EXISTS notificacao;
USE notificacao;

CREATE TABLE IF NOT EXISTS pedidos (
    idPedidos INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO pedidos (nome)
VALUES ('Pedido 1'),
       ('Pedido 2'),
       ('Pedido 3');

CREATE TABLE IF NOT EXISTS status_pedido (
    idStatus INT PRIMARY KEY AUTO_INCREMENT,
    status_pedido VARCHAR(50),
    idPedidos INT,
    FOREIGN KEY (idPedidos) REFERENCES pedidos(idPedidos)
);

INSERT INTO status_pedido (status_pedido, idPedidos)
VALUES ('Entregue', 1),
       ('Pendente', 2),
       ('Pendente', 3);

CREATE OR REPLACE VIEW vw_pedidos_pendentes AS
SELECT p.idPedidos, p.nome AS 'Nome do Pedido', sp.status_pedido AS 'Status do Pedido'
FROM pedidos p
JOIN status_pedido sp ON p.idPedidos = sp.idPedidos
WHERE sp.status_pedido = 'Pendente';

SELECT * FROM vw_pedidos_pendentes;
