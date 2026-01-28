-- =========================
-- SCHEMA
-- =========================
CREATE SCHEMA IF NOT EXISTS oficina;
USE oficina;

-- =========================
-- CARGO
-- =========================
CREATE TABLE cargo (
  id_cargo INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_cargo)
);

-- =========================
-- FUNCIONARIO
-- =========================
CREATE TABLE funcionario (
  id_funcionario INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  telefone VARCHAR(45),
  email VARCHAR(45),
  endereco VARCHAR(45),
  id_cargo INT NOT NULL,
  PRIMARY KEY (id_funcionario),
  CONSTRAINT fk_funcionario_id_cargo
    FOREIGN KEY (id_cargo)
    REFERENCES cargo (id_cargo)
);

-- =========================
-- STATUS SERVICO
-- =========================
CREATE TABLE status_servico (
  id_status_servico INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_status_servico),
  CONSTRAINT uq_status_servico_descricao UNIQUE (descricao)
);

-- =========================
-- CLIENTE
-- =========================
CREATE TABLE cliente (
  id_cliente INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_cliente)
);

-- =========================
-- VEICULO
-- =========================
CREATE TABLE veiculo (
  id_veiculo INT NOT NULL,
  placa VARCHAR(45),
  marca VARCHAR(45),
  modelo VARCHAR(45),
  id_cliente INT NOT NULL,
  PRIMARY KEY (id_veiculo),
  CONSTRAINT fk_veiculo_id_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES cliente (id_cliente)
);

-- =========================
-- ORDEM SERVICO
-- =========================
CREATE TABLE ordem_servico (
  id_ordem_servico INT NOT NULL,
  data_emissao DATE NOT NULL,
  data_entrega DATE,
  id_veiculo INT NOT NULL,
  id_status_servico INT NOT NULL,
  valor DOUBLE,
  n_ordem_servico VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_ordem_servico),
  CONSTRAINT fk_ordem_servico_id_veiculo
    FOREIGN KEY (id_veiculo)
    REFERENCES veiculo (id_veiculo),
  CONSTRAINT fk_ordem_servico_id_status_servico
    FOREIGN KEY (id_status_servico)
    REFERENCES status_servico (id_status_servico)
);

-- =========================
-- SERVICO
-- =========================
CREATE TABLE servico (
  id_servico INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_servico)
);

-- =========================
-- PRODUTO
-- =========================
CREATE TABLE produto (
  id_produto INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  modelo VARCHAR(45),
  marca VARCHAR(45),
  PRIMARY KEY (id_produto)
);

-- =========================
-- APROVACAO SERVICO
-- =========================
CREATE TABLE aprovacao_servico (
  id_aprovacao_servico INT NOT NULL,
  situacao VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_aprovacao_servico)
);

-- =========================
-- FUNCIONARIO x ORDEM SERVICO
-- =========================
CREATE TABLE funcionario_has_ordem_servico (
  id_funcionario INT NOT NULL,
  id_ordem_servico INT NOT NULL,
  id_servico INT NOT NULL,
  id_produto INT NOT NULL,
  id_aprovacao_servico_cli INT NOT NULL,
  data_aprovacao_servico_cli DATE,
  id_aprovacao_servico_func INT NOT NULL,
  data_aprovacao_servico_func DATE,
  id_status_servico INT NOT NULL,
  PRIMARY KEY (
    id_funcionario,
    id_ordem_servico,
    id_servico,
    id_produto
  ),
  CONSTRAINT fk_funcionario_has_ordem_servico_id_funcionario
    FOREIGN KEY (id_funcionario)
    REFERENCES funcionario (id_funcionario),
  CONSTRAINT fk_funcionario_has_ordem_servico_id_ordem_servico
    FOREIGN KEY (id_ordem_servico)
    REFERENCES ordem_servico (id_ordem_servico),
  CONSTRAINT fk_funcionario_has_ordem_servico_id_servico
    FOREIGN KEY (id_servico)
    REFERENCES servico (id_servico),
  CONSTRAINT fk_funcionario_has_ordem_servico_id_produto
    FOREIGN KEY (id_produto)
    REFERENCES produto (id_produto),
  CONSTRAINT fk_funcionario_has_ordem_servico_id_aprovacao_servico_cli
    FOREIGN KEY (id_aprovacao_servico_cli)
    REFERENCES aprovacao_servico (id_aprovacao_servico),
  CONSTRAINT fk_funcionario_has_ordem_servico_id_aprovacao_servico_func
    FOREIGN KEY (id_aprovacao_servico_func)
    REFERENCES aprovacao_servico (id_aprovacao_servico),
  CONSTRAINT fk_funcionario_has_ordem_servico_id_status_servico
    FOREIGN KEY (id_status_servico)
    REFERENCES status_servico (id_status_servico)
);

-- =========================
-- VALOR SERVICO
-- =========================
CREATE TABLE valor_servico (
  id_valor_servico INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  valor DOUBLE NOT NULL,
  data_cadastro DATE NOT NULL,
  id_servico INT NOT NULL,
  PRIMARY KEY (id_valor_servico),
  CONSTRAINT fk_valor_servico_id_servico
    FOREIGN KEY (id_servico)
    REFERENCES servico (id_servico)
);

-- =========================
-- VALOR PRODUTO
-- =========================
CREATE TABLE valor_produto (
  id_valor_produto INT NOT NULL,
  descricao VARCHAR(45),
  data_cadastro DATE NOT NULL,
  id_produto INT NOT NULL,
  PRIMARY KEY (id_valor_produto),
  CONSTRAINT fk_valor_produto_id_produto
    FOREIGN KEY (id_produto)
    REFERENCES produto (id_produto)
);
