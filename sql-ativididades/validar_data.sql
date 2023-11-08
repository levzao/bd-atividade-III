CREATE DATABASE IF NOT EXISTS produto;
USE produto;

CREATE TABLE IF NOT EXISTS tb_produto (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(255),
  Validade DATE
);

DELIMITER //

CREATE TRIGGER tg_validar_data_validade
BEFORE INSERT ON tb_produto
FOR EACH ROW
BEGIN
    IF NEW.validade < '2025-01-01' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O produto está com a data de validade vencida';
    END IF;
END //

DELIMITER ;

INSERT INTO tb_produto (nome, validade) VALUES ('Arroz', '2025-12-31');
