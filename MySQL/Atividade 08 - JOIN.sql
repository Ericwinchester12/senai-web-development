use bd_techmarket_normalizado;

-- 1. cidade e estado dos clientes
select c.nome as 'Nome do Cliente', e.cidade as 'Cidade', e.uf as 'Estado'
from cliente c
join cliente_has_enderecos che on c.id_cliente = che.cliente_id_cliente
join enderecos e on che.enderecos_id_endereco = e.id_endereco
order by e.uf asc;

-- 2. qtd de clientes por bairro em jf
select e.bairro as 'Bairro', count(c.id_cliente) as 'Qtd de Clientes'
from cliente c
join cliente_has_enderecos che on c.id_cliente = che.cliente_id_cliente
join enderecos e on che.enderecos_id_endereco = e.id_endereco
where e.cidade = 'Juiz de Fora'
group by e.bairro
order by e.bairro asc;

-- 3. notas por emitente
select em.razao_social as 'Razão Social', count(nf.numero_nota) as 'Qtd de NF-es', sum(nf.valor_total) as 'Valor Total'
from emitente em
join nota_fiscal nf on em.id_emitente = nf.emitente_id_emitente
group by em.id_emitente, em.razao_social
order by sum(nf.valor_total) desc;

-- 4. notas por cliente
select c.nome as 'Nome Cliente', count(nf.numero_nota) as 'Qtd de NF-es', sum(nf.valor_total) as 'Valor Total'
from cliente c
join nota_fiscal nf on c.id_cliente = nf.cliente_id_cliente
group by c.id_cliente, c.nome
order by sum(nf.valor_total) desc;

-- 5. produto mais vendido em abril
select month(nf.data_emissao) as 'Mês', p.codigo as 'Cod Produto', p.descricao as 'Nome do Produto',
sum(inf.quantidade) as 'Qtd Vendida', sum(inf.quantidade * inf.valor_unitario_vendido) as 'Valor Total'
from item_nota_fiscal inf
join nota_fiscal nf on inf.nota_fiscal_numero = nf.numero_nota
join produto p on inf.produto_codigo = p.codigo
where month(nf.data_emissao) = 4
group by p.codigo, p.descricao, month(nf.data_emissao)
order by sum(inf.quantidade * inf.valor_unitario_vendido) desc
limit 1;
