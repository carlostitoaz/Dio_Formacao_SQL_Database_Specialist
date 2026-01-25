# 🛒 Terceiro Desafio de Projeto – Banco de Dados E-commerce

## 🎯 Objetivo
Desenvolver o projeto lógico de um banco de dados para um cenário de E-commerce, aplicando corretamente os conceitos de modelagem conceitual, lógica e relacional, incluindo chaves primárias, chaves estrangeiras, constraints e relacionamentos do tipo EER (Enhanced Entity-Relationship).

O projeto contempla a criação do esquema do banco de dados em SQL, a persistência de dados para testes e o desenvolvimento de consultas SQL complexas para análise das informações.

---

## 📌 Escopo do Projeto

O banco de dados foi modelado para atender um sistema de E-commerce contendo:

- Cadastro de clientes (Pessoa Física ou Pessoa Jurídica)
- Cadastro de produtos e suas categorias
- Controle de fornecedores e seus produtos
- Gestão de estoques, incluindo quantidade bloqueada
- Tabela de preços com histórico por produto e estoque
- Registro de formas de pagamento (um cliente pode ter várias)
- Controle de pedidos, contendo:
  - Status do pedido
  - Código de rastreio
  - Transportadora
  - Valor total e frete
- Relacionamento entre pedido e produtos
- Controle de entrega e origem da compra

---

## ✅ Refinamentos Aplicados ao Modelo

Conforme solicitado no desafio, foram aplicados os seguintes refinamentos:

- Cliente PF e PJ  
  Uma conta pode ser Pessoa Física ou Pessoa Jurídica, mas nunca ambas, controlado pelo campo tipo_cliente.

- Pagamento  
  Um cliente pode cadastrar mais de uma forma de pagamento, representado pela tabela forma_pagamento.

- Entrega  
  O pedido possui:
  - Status (status_pedido)
  - Código de rastreio (cod_rastreio)
  - Data de entrega (data_entrega)
  - Transportadora associada

- Relacionamentos EER
  - Produto ↔ Fornecedor (N:N)
  - Produto ↔ Estoque (N:N com atributos)
  - Pedido ↔ Produto (N:N)

---

## 🗂️ Diagrama Desenvolvido

### 🛒 Diagrama EER – E-commerce
![Diagrama E-commerce](img/eer%20diagrama%20e-commerce.png)

---

## 🛠️ Tecnologias Utilizadas

- MySQL
- SQL (DDL e DML)
- Modelagem EER
- Git & GitHub

---

## 🧱 Estrutura do Banco de Dados

O projeto contempla a criação das seguintes tabelas principais:

- cliente
- forma_pagamento
- produto
- categoria
- fornecedor
- produto_fornecedor
- estoque
- estoque_produto
- tabelaPrecoDescricao
- tabelaPrecoItens
- pedido
- pedido_produto
- transportadora
- origem
- terceirizacao
- terceirizacao_produto

Todas as tabelas foram criadas respeitando:

- Chaves primárias
- Chaves estrangeiras
- Constraints de unicidade
- Integridade referencial

---

## 🧪 Persistência de Dados

Após a criação do esquema do banco de dados, foram inseridos dados para testes, permitindo a validação dos relacionamentos, constraints e consultas SQL.

---

## 🔍 Consultas SQL Desenvolvidas

As consultas desenvolvidas atendem aos requisitos do desafio e incluem:

- Recuperações simples com SELECT
- Filtros com WHERE
- Atributos derivados com expressões SQL
- Ordenações com ORDER BY
- Filtros em grupos com HAVING
- Junções entre tabelas com JOIN

### 📊 Exemplos de Perguntas Respondidas

- Quantos pedidos foram feitos por cada cliente?
- Algum vendedor também é fornecedor?
- Relação de produtos, fornecedores e estoques
- Relação entre nomes dos fornecedores e nomes dos produtos
- Quais clientes possuem pedidos com alto valor agregado?
- Quais produtos possuem maior quantidade disponível em estoque?

As consultas completas encontram-se no arquivo queries.sql.
