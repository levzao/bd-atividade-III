CREATE DATABASE IF NOT EXISTS RH;
USE RH;

CREATE TABLE IF NOT EXISTS tb_funcionarios (
    idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tb_funcionarios_demitidos (
    idDemitido INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(255)
);

DELIMITER //

CREATE TRIGGER tg_registro_exclusao
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO tb_funcionarios_demitidos (idDemitido, nome, cargo)
    VALUES (OLD.idFuncionario, OLD.nome, OLD.cargo);
END; //

DELIMITER ;

INSERT INTO tb_funcionarios (nome, cargo)
VALUES ('Alice', 'Analista de RH');

DELETE FROM tb_funcionarios
WHERE idFuncionario = 1;

SELECT * FROM tb_funcionarios_demitidos;
