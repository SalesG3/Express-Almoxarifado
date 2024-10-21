### TABELA PARA USUÁRIOS:

CREATE TABLE usuarios (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(25) NOT NULL UNIQUE,
    nome VARCHAR(75) NOT NULL,
    senha VARCHAR(100) NOT NULL
);

	# USUÁRIO PADRÃO
    INSERT INTO usuarios (login, nome, senha) VALUES ('ROOT', 'ROOT', '21232f297a57a5a743894a0e4a801fc3');

### PROCEDURES USUÁRIOS:

# VALIDAR LOGIN:
DELIMITER $$
CREATE PROCEDURE login_usuario ( loginIn VARCHAR(25), senhaIn VARCHAR(100))
BEGIN
	IF EXISTS ( SELECT id_usuario, nome FROM usuarios WHERE login = loginIn AND senha = senhaIn) THEN
		SELECT id_usuario, nome FROM usuarios WHERE login = loginIn AND senha = senhaIn;
	END IF;
END $$
DELIMITER ;