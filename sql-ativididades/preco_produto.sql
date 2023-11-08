CREATE DATABASE IF NOT EXISTS preco_prod;
USE preco_prod;

CREATE TABLE IF NOT EXISTS Produto_Preco (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(255),
  Preco DECIMAL(10, 2)
);

DELIMITER //

CREATE TRIGGER tg_aumentar_Preco_Produto
AFTER INSERT ON Produto_Preco
FOR EACH ROW
BEGIN
   UPDATE Produto_Preco SET Preco = Preco * 1.10 WHERE Id = NEW.Id;
END; //

DELIMITER ;

INSERT INTO Produto_Preco(Nome, Preco)
VALUES ('Escova', 100);

UPDATE Produto_Preco
SET Preco = 200
WHERE id = 1;

SELECT * FROM Produto_Preco
WHERE Id = 1;
