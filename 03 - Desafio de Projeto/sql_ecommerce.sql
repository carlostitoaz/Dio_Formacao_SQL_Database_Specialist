DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;

CREATE TABLE IF NOT EXISTS fornecedor ( 
	id_fornecedor INT NOT NULL AUTO_INCREMENT,
    razao_social VARCHAR(100) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    PRIMARY KEY(id_fornecedor),
    CONSTRAINT uq_fornecedor_cnpj UNIQUE(cnpj)
);

CREATE TABLE IF NOT EXISTS categoria (
	id_categoria INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_categoria)
);

CREATE TABLE IF NOT EXISTS produto (
	id_produto INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY(id_produto),
    CONSTRAINT fk_categoria_id_categoria 
		FOREIGN KEY (id_categoria) 
        REFERENCES categoria(id_categoria)
);
    
CREATE TABLE IF NOT EXISTS estoque (
	id_estoque INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_estoque),
    CONSTRAINT uq_estoque_descricao UNIQUE(descricao)
);

CREATE TABLE IF NOT EXISTS tabelaPrecoDescricao (
	id_tabelaPrecoDescricao INT NOT NULL AUTO_INCREMENT, 
	descricao VARCHAR(100) NOT NULL,
	PRIMARY KEY(id_tabelaPrecoDescricao)
);

CREATE TABLE IF NOT EXISTS tabelaPrecoItens (
	id_tabelaPrecoItens INT NOT NULL AUTO_INCREMENT,
    valor DECIMAL(10, 2) NOT NULL,
    data_preco DATE NOT NULL,
    id_produto INT NOT NULL,
    id_estoque INT NOT NULL,
    id_tabelaPrecoDescricao INT NOT NULL,
    PRIMARY KEY(id_tabelaPrecoItens),
    CONSTRAINT fk_produto_id_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    CONSTRAINT fk_estoque_id_estoque FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque),
    CONSTRAINT fk_tabelaPrecoDescricao_id_tabelaPrecoDescricao FOREIGN KEY (id_tabelaPrecoDescricao) REFERENCES tabelaPrecoDescricao(id_tabelaPrecoDescricao)
);

CREATE TABLE IF NOT EXISTS produto_fornecedor (
	id_produto INT NOT NULL,
    id_fornecedor INT NOT NULL,
    PRIMARY KEY (id_produto, id_fornecedor),
    CONSTRAINT fk_produto_id_produto1 FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    CONSTRAINT fk_fornecedor_id_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

CREATE TABLE IF NOT EXISTS terceirizacao (
	id_terceirizacao INT NOT NULL AUTO_INCREMENT,
    razao_social VARCHAR(100) NOT NULL,
    endereco VARCHAR(100),
    nome_fantasia VARCHAR(100),
    PRIMARY KEY(id_terceirizacao),
    CONSTRAINT uq_terceirizacao_razao_social UNIQUE(razao_social)
);

CREATE TABLE IF NOT EXISTS transportadora (
	id_transportadora INT NOT NULL AUTO_INCREMENT,
    razao_social VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(45),
    endereco VARCHAR(100),
    PRIMARY KEY(id_transportadora)
);

CREATE TABLE IF NOT EXISTS cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT,
    p_nome VARCHAR(30) NOT NULL COMMENT 'Primeiro nome',
    m_nome VARCHAR(30) NOT NULL COMMENT 'Nome do meio', 
    u_nome VARCHAR(50) NOT NULL COMMENT 'Último nome', 
    cnpj_cpf CHAR(14) NOT NULL,
    endereco VARCHAR(100),
    tipo_cliente INT NOT NULL DEFAULT 1 COMMENT 'Cliente pessoa física 1, cliente pessoa jurídica 2', 
    data_nascimento DATE,
    PRIMARY KEY(id_cliente),
    CONSTRAINT uq_cliente_cnpj_cpf UNIQUE(cnpj_cpf)
);

CREATE TABLE IF NOT EXISTS forma_pagamento (
	id_forma_pagamento INT NOT NULL AUTO_INCREMENT,
	n_conta VARCHAR(45) NOT NULL,
    banco VARCHAR(45) NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY(id_forma_pagamento),
    CONSTRAINT fk_cliente_id_cliente 
		FOREIGN KEY (id_cliente) 
        REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS terceirizacao_produto (
	id_terceirizacao INT NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY(id_terceirizacao, id_produto),
    CONSTRAINT fk_terceirizacao_id_terceirizacao 
		FOREIGN KEY (id_terceirizacao) 
        REFERENCES terceirizacao(id_terceirizacao),
	CONSTRAINT fk_produto_id_produto2
		FOREIGN KEY (id_produto) 
		REFERENCES produto(id_produto)       
);

CREATE TABLE IF NOT EXISTS estoque_produto (
	estoque_produto INT NOT NULL AUTO_INCREMENT,
	id_estoque INT NOT NULL,
    id_produto INT NOT NULL,
	data_entrada DATE NOT NULL,
    qtd INT NOT NULL,
    qtd_bloqueado INT NOT NULL DEFAULT 0 COMMENT 'Quantidade de itens que estão bloqueados para movimentação',
    custo DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(estoque_produto),
    CONSTRAINT fk_estoque_id_estoque1
		FOREIGN KEY (id_estoque) 
        REFERENCES estoque(id_estoque),
	CONSTRAINT fk_produto_id_produto3
		FOREIGN KEY (id_produto) 
		REFERENCES produto(id_produto)       
);

CREATE TABLE IF NOT EXISTS origem (
	id_origem INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_origem),
    CONSTRAINT uq_origem_descricao UNIQUE(descricao)
);
    
CREATE TABLE IF NOT EXISTS pedido (
	id_pedido INT NOT NULL AUTO_INCREMENT,
    status_pedido ENUM('Em Andamento', 'Processando', 'Enviado', 'Entregue', 'Cancelado') DEFAULT 'Processando',
    descricao VARCHAR(45),
    frete DECIMAL(10, 2),
    cod_rastreio VARCHAR(45),
    data_entrega DATE,
    valor_total DECIMAL(10, 2) NOT NULL,
    id_transportadora INT NOT NULL,
    id_cliente INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    id_origem INT NOT NULL,
    PRIMARY KEY(id_pedido),
    CONSTRAINT fk_transportadora_id_transportadora 
		FOREIGN KEY (id_transportadora) 
		REFERENCES transportadora(id_transportadora),
	CONSTRAINT fk_cliente_id_cliente1
		FOREIGN KEY (id_cliente) 
		REFERENCES cliente(id_cliente),
	CONSTRAINT fk_cliente_id_forma_pagamento
		FOREIGN KEY (id_forma_pagamento) 
		REFERENCES forma_pagamento(id_forma_pagamento),
	CONSTRAINT fk_origem_id_origem FOREIGN KEY (id_origem) REFERENCES origem(id_origem)
);

CREATE TABLE IF NOT EXISTS pedido_produto ( 
	id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    qtd INT NOT NULL,
    PRIMARY KEY(id_pedido, id_produto),
    CONSTRAINT fk_pedido_id_pedido
		FOREIGN KEY (id_pedido) 
        REFERENCES pedido(id_pedido),
	CONSTRAINT fk_produto_id_produto4
		FOREIGN KEY (id_produto) 
		REFERENCES produto(id_produto)       
);