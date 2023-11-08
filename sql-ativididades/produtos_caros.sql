CREATE DATABASE IF NOT EXISTS produtos_caros;
USE produtos_caros;

CREATE TABLE IF NOT EXISTS produtos_caros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

INSERT INTO produtos_caros (nome, preco) VALUES
    ('Laptop', 1500.00),
    ('Smartphone', 800.00),
    ('Câmera DSLR', 1200.00),
    ('TV 4K', 1100.00);

CREATE OR REPLACE VIEW vw_produtos_caros AS
SELECT nome, preco
FROM produtos_caros
WHERE preco > 1000;

SELECT * FROM vw_produtos_caros;
