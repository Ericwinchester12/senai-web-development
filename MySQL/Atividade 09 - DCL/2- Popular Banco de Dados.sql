USE bd_techmarket_normalizado;

INSERT INTO cliente (cpf, nome) VALUES
('111.111.111-11', 'Carlos Marques'),
('222.222.222-22', 'Mariana Silva'),
('333.333.333-33', 'João Pedro Alves'),
('444.444.444-44', 'Ana Beatriz Costa'),
('555.555.555-55', 'Lucas Fernandes');

INSERT INTO emitente (cnpj, razao_social) VALUES
('12.345.678/0001-90', 'TechMarket Matriz Comércio LTDA'),
('98.765.432/0001-10', 'TechMarket Filial Distribuidora S.A.');

INSERT INTO produto (codigo, descricao, valor_unitario, estoque) VALUES
(101, 'Smartphone Samsung Galaxy S23', 4500.00, 50),
(102, 'Notebook Dell Inspiron 15', 3500.00, 30),
(103, 'Placa de Vídeo NVIDIA RTX 4060', 2100.00, 15),
(104, 'Memória RAM Kingston 16GB DDR4', 300.00, 120),
(105, 'SSD NVMe M.2 1TB WD Blue', 450.00, 80),
(106, 'Monitor LG Ultrawide 29"', 1100.00, 25),
(107, 'Teclado Mecânico Redragon Kumara', 250.00, 60),
(108, 'Mouse Gamer Logitech G203', 180.00, 75),
(109, 'Placa de Desenvolvimento ESP32 V3', 45.00, 200),
(110, 'Motor de Portão Garen DZ Full Speed', 450.00, 10);

INSERT INTO enderecos (logradouro, numero, complemento, bairro, cidade, uf, pais, cep) VALUES
('Avenida Rio Branco', '2001', 'Apto 402', 'Centro', 'Juiz de Fora', 'MG', 'Brasil', '36016-310'),
('Rua São Mateus', '350', 'Casa', 'São Mateus', 'Juiz de Fora', 'MG', 'Brasil', '36025-001'),
('Rua Halfeld', '150', 'Sala 12', 'Centro', 'Juiz de Fora', 'MG', 'Brasil', '36010-000'),
('Avenida dos Andradas', '800', 'Bloco B', 'Morro da Glória', 'Juiz de Fora', 'MG', 'Brasil', '36036-000'),
('Rua das Flores', '123', '', 'Jardim Botânico', 'Rio de Janeiro', 'RJ', 'Brasil', '22460-000'),
('Avenida Independência', '3300', 'Galpão Principal', 'Cascatinha', 'Juiz de Fora', 'MG', 'Brasil', '36033-318'),
('Avenida Paulista', '1000', 'Andar 5', 'Bela Vista', 'São Paulo', 'SP', 'Brasil', '01310-100');

INSERT INTO cliente_has_enderecos (cliente_id_cliente, enderecos_id_endereco) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO emitente_has_enderecos (emitente_id_emitente, enderecos_id_endereco) VALUES
(1, 6),
(2, 7);

INSERT INTO nota_fiscal (numero_nota, data_emissao, valor_total, cliente_id_cliente, emitente_id_emitente) VALUES
(1001, '2026-04-02', 4500.00, 1, 1), 
(1002, '2026-04-05', 4190.00, 2, 1), 
(1003, '2026-04-07', 2100.00, 3, 2),
(1004, '2026-04-08', 1530.00, 4, 1), 
(1005, '2026-04-09', 450.00, 5, 1);

INSERT INTO item_nota_fiscal (nota_fiscal_numero, produto_codigo, quantidade, valor_unitario_vendido) VALUES
(1001, 101, 1, 4500.00);

INSERT INTO item_nota_fiscal (nota_fiscal_numero, produto_codigo, quantidade, valor_unitario_vendido) VALUES
(1002, 102, 1, 3500.00),
(1002, 104, 2, 300.00),
(1002, 109, 2, 45.00);

INSERT INTO item_nota_fiscal (nota_fiscal_numero, produto_codigo, quantidade, valor_unitario_vendido) VALUES
(1003, 103, 1, 2100.00);

INSERT INTO item_nota_fiscal (nota_fiscal_numero, produto_codigo, quantidade, valor_unitario_vendido) VALUES
(1004, 106, 1, 1100.00),
(1004, 107, 1, 250.00),
(1004, 108, 1, 180.00);

INSERT INTO item_nota_fiscal (nota_fiscal_numero, produto_codigo, quantidade, valor_unitario_vendido) VALUES
(1005, 110, 1, 450.00); 