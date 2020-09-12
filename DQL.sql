----------------------------------DQL EDITORA CASTOR--------------------------------
--Retornar o nome do produto, a categoria a qual pertence e nome do funcionário que cadastrou o produto
select produto.nome as produto,
categoria.nome as categoria,
funcionario.nome as funcionario
from produto, categoria, funcionario
where produto.id_categoria = categoria.id_categoria 
and produto.id_funcionario = funcionario.id_funcionario
group by produto.nome
order by categoria.id_categoria;

--Retornar a quantidade de produtos vendidos por categoria
select categoria.nome as categoria,
count (carrinho.quantidade_solicitada) as quantidade_vendida
from categoria, carrinho, produto
where categoria.id_categoria = produto.id_categoria 
and produto.id_produto = carrinho.id_produto
group by categoria.nome
order by count (carrinho.quantidade_solicitada);

--Quantidade de estoque por categoria e quantidade de produto por categoria 
select categoria.nome as categoria,
sum(produto.quantidade_estoque) as quantidade_estoque,
count (categoria.id_categoria ) as quantidade_produto
from categoria, produto
where categoria.id_categoria = produto.id_categoria
group by categoria.id_categoria 
order by count(categoria.id_categoria);

--SQL para construção da nota fiscal
create view nota_fiscal as select pedido.id_pedido as nota_fiscal,
editora_castor.cnpj as cnpj,
editora_castor.endereco as endereco_empresa,
cliente.nome as nome_cliente,
cliente.cpf as cpf,
cliente.endereco as endereco_cliente,
produto.nome as produto,
carrinho.quantidade_solicitada as quantidade,
produto.valor_unitario as valor_unitário,
pedido.valor_pedido 
from pedido, carrinho, cliente, produto, editora_castor
where pedido.id_pedido = pedido.id_cliente 
and produto.cnpj_empresa = editora_castor.cnpj 
and produto.cnpj_empresa = editora_castor.cnpj 
and pedido.id_cliente = cliente.id_cliente 
and pedido.id_pedido = carrinho.id_pedido
and produto.id_produto = carrinho.id_produto;

select * from nota_fiscal
where nota_fiscal = 4