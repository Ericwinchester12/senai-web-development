-- Criando e acessando o Banco de Dados

DROP DATABASE IF EXISTS bd_techmarket_normalizado;
CREATE DATABASE bd_techmarket_normalizado;
USE bd_techmarket_normalizado;

-- =====================================================================
-- BLOCO 1: ENTIDADES PRINCIPAIS (As tabelas independentes)
-- =====================================================================

CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  cpf VARCHAR(14) NOT NULL,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE emitente (
  id_emitente INT AUTO_INCREMENT PRIMARY KEY,
  cnpj VARCHAR(18) NOT NULL,
  razao_social VARCHAR(100) NOT NULL
);

CREATE TABLE produto (
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(100) NOT NULL,
  valor_unitario DECIMAL(10,2) NOT NULL,
  estoque INT NOT NULL
);

-- =====================================================================
-- BLOCO 2: TABELA DE ENDEREÇOS
-- O endereço fica isolado para ser reutilizado por qualquer um.
-- =====================================================================

CREATE TABLE enderecos (
  id_endereco INT AUTO_INCREMENT PRIMARY KEY,
  logradouro VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  complemento VARCHAR(50),
  bairro VARCHAR(50) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  uf VARCHAR(2) NOT NULL,
  pais VARCHAR(100) NOT NULL,
  cep VARCHAR(10) NOT NULL
);

-- =====================================================================
-- BLOCO 3: TABELAS ASSOCIATIVAS DE ENDEREÇO (Relacionamento N:N)
-- Ligando os Endereços aos Clientes e aos Emitentes.
-- =====================================================================

CREATE TABLE cliente_has_enderecos (
  cliente_id_cliente INT,
  enderecos_id_endereco INT,
  
  PRIMARY KEY (cliente_id_cliente, enderecos_id_endereco),
  FOREIGN KEY (cliente_id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (enderecos_id_endereco) REFERENCES enderecos(id_endereco)
);

CREATE TABLE emitente_has_enderecos (
  emitente_id_emitente INT,
  enderecos_id_endereco INT,
  
  PRIMARY KEY (emitente_id_emitente, enderecos_id_endereco),
  FOREIGN KEY (emitente_id_emitente) REFERENCES emitente(id_emitente),
  FOREIGN KEY (enderecos_id_endereco) REFERENCES enderecos(id_endereco)
);

-- =====================================================================
-- BLOCO 4: O CORAÇÃO DO SISTEMA (A Nota Fiscal e seus Itens)
-- =====================================================================

CREATE TABLE nota_fiscal (
  numero_nota INT AUTO_INCREMENT PRIMARY KEY,
  data_emissao DATE NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  cliente_id_cliente INT NOT NULL,
  emitente_id_emitente INT NOT NULL,
  
  FOREIGN KEY (cliente_id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (emitente_id_emitente) REFERENCES emitente(id_emitente)
);

-- Tabela Associativa N:N (Quais produtos estão em qual nota)
CREATE TABLE item_nota_fiscal (
  nota_fiscal_numero INT,
  produto_codigo INT,
  quantidade INT NOT NULL,
  valor_unitario_vendido DECIMAL(10,2) NOT NULL,
  
  PRIMARY KEY (nota_fiscal_numero, produto_codigo),
  FOREIGN KEY (nota_fiscal_numero) REFERENCES nota_fiscal(numero_nota),
  FOREIGN KEY (produto_codigo) REFERENCES produto(codigo)
);