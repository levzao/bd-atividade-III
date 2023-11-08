CREATE DATABASE IF NOT EXISTS dependente;
USE dependente;

CREATE TABLE IF NOT EXISTS tb_funcionarios (
    idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tb_dependentes (
    idDependente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    idFuncionario INT,
    FOREIGN KEY (idFuncionario) REFERENCES tb_funcionarios (idFuncionario)
);

DELIMITER //

CREATE TRIGGER tg_exclusao_dependentes
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    DELETE FROM tb_dependentes
    WHERE idFuncionario = OLD.idFuncionario;
END; //

DELIMITER ;

INSERT INTO tb_funcionarios (Nome)
VALUES ('Carlos');

INSERT INTO tb_dependentes (Nome, idFuncionario)
VALUES ('Ana', 1);

DELETE FROM tb_funcionarios
WHERE idFuncionario = 1;

SELECT * FROM tb_dependentes;
