### SCRIPTS PARA ALMOXARIFADOS:


# TABELA:
CREATE TABLE almoxarifados (
	id_almoxarifado INT PRIMARY KEY AUTO_INCREMENT,
    codigo INT NOT NULL UNIQUE,
    almoxarifado VARCHAR(100) NOT NULL,
    descricao TEXT
);

# PESQUISA:
DELIMITER $$
CREATE PROCEDURE pesquisa_almoxarifado ( pesquisaIn VARCHAR(100) )
BEGIN
	SELECT codigo, almoxarifado FROM almoxarifados WHERE codigo REGEXP pesquisaIn OR almoxarifado REGEXP pesquisaIn;
END $$
DELIMITER ;


# CODIGO AUTOMATICO:
DELIMITER $$
CREATE PROCEDURE codigo_almoxarifado ( )
BEGIN
	SELECT IFNULL(MAX(codigo), 0) +1 AS codigo FROM almoxarifados;
END $$
DELIMITER ;


# NOVO REGISTRO:
DELIMITER $$
CREATE PROCEDURE novo_almoxarifado ( codigoIn INT, almoxarifadoIn VARCHAR(100), descricaoIn TEXT)
BEGIN
	IF NOT EXISTS ( SELECT id_almoxarifado FROM almoxarifados WHERE codigo = codigoIn ) THEN
		INSERT INTO almoxarifados ( codigo, almoxarifado, descricao ) VALUES ( codigoIn, almoxarifadoIn, descricaoIn );
	ELSE
		SELECT id_almoxarifado FROM almoxarifados WHERE codigo = codigoIn;
	END IF;
END $$
DELIMITER ;