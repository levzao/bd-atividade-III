CREATE DATABASE IF NOT EXISTS produto_venda;
USE produto_venda;

CREATE TABLE IF NOT EXISTS Produtos (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Estoque INT
);

CREATE TABLE IF NOT EXISTS Venda_Produto (
    idVenda INT AUTO_INCREMENT PRIMARY KEY,
    idProduto INT,
    Quantidade INT,
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);

DELIMITER //

CREATE TRIGGER tg_atualizar_estoque_produto
AFTER INSERT ON venda_produto
FOR EACH ROW
BEGIN
    UPDATE produtos
    SET Estoque = Estoque - NEW.quantidade
    WHERE idProduto = NEW.idProduto;
END; //

DELIMITER ;

INSERT INTO Produtos (Nome, Estoque)
VALUES ('Vassoura', 100);

INSERT INTO Venda_Produto (idProduto, Quantidade)
VALUES (1, 90);

SELECT * FROM Produtos;
