CREATE DATABASE IF NOT EXISTS funcionarios;
USE funcionarios;

CREATE TABLE IF NOT EXISTS tbFuncionarios (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255),
    Departamento VARCHAR(50)
);

INSERT INTO tb_Funcionarios (Nome, Departamento)
VALUES ('Alice', 'Recursos Humanos'),
       ('Carlos', 'Administrativo'),
       ('Fernanda', 'Administrativo');

CREATE OR REPLACE VIEW vw_Funcionarios_departamentos AS
SELECT Id, Nome, Departamento
FROM tb_Funcionarios
WHERE Departamento = 'Administrativo';

SELECT * FROM vw_Funcionarios_departamentos;
