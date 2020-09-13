----------------------------------DDL EDITORA CASTOR--------------------------------
create table editora_castor(
cnpj text PRIMARY KEY NOT NULL,
endereco text
);

create table categoria(
id_categoria integer primary key autoincrement not null,
nome text not null,
descricao text
);

create table cliente(
id_cliente integer primary key autoincrement not null,
nome text not null,
nome_usuario text not null unique,
email text not null unique,
cpf text not null unique,
data_nascimento date,
endereco text not null,
numero_cartao integer not null unique,
validade_cartao text not null,
cvc integer not null
);

create table funcionario(
id_funcionario integer primary key autoincrement not null,
nome text not null,
cpf text not null unique
);

create table produto(
id_produto integer primary key autoincrement not null,
nome text not null,
autor text not null,
descricao text,
quantidade_estoque integer,
data_fabricacao date,
valor_unitario real not null,
id_categoria integer not null,
cnpj_empresa text not null,
id_funcionario integer not null,
foreign key(id_categoria)references categoria(id_categoria),
foreign key(id_funcionario) references funcionario(id_funcionario),
foreign key(cnpj_empresa) references editora_castor(cnpj)
);

create table pedido(
id_pedido integer primary key autoincrement not null,
data_solicitado date,
valor_pedido real not null,
status_pedido text not null,
id_cliente integer not null,
foreign key(id_cliente) references cliente(id_cliente)
);

create table carrinho(
id_carrinho integer primary key autoincrement not null,
id_produto integer not null,
quantidade_solicitada integer,
id_pedido integer not null,
foreign key(id_produto) references produto(id_produto),
foreign key(id_pedido) references pedido(id_pedido)
);

----------------------------------DML EDITORA CASTOR--------------------------------
insert into Editora_Castor (cnpj,endereco) values  
(15436940000103, 'Rua Professor José Reuther, 125, Mosela, Petrópolis-Rio de Janeiro');

insert into cliente (nome , nome_usuario , email , cpf , data_nascimento , endereco , numero_cartao , validade_cartao, cvc) values
('João Silva', 'josi1975', 'joao_silva@hotmail.com', '00534768780', '23/11/1975', 'Rua Maceió, 23, Quintandinha, Petropolis-RJ',346858877795, '05/2025', 237),
('Maria da Conceição Veloso', 'mar4588', 'maria-veloso@gmail.com', '38485600757', '01/03/1994', 'Rua Bingem, 23, Bingem, Petropolis-RJ',384848585868, '03/2022', 138),
('Thiago Braga cardoso', 'TBC1000', 'thiago1996@globo.com', '23745655749', '04/05/1996', 'Rua Pedro da Rocha, 23,Tijuca , Rio de Janeiro-RJ',504203486480, '09/2024', 734),
('Sérgio Bastos', 'SERBA555', 'serginho_bastos@uol.com', '47854228138', '07/09/1988', 'Rua 15 de Abril, 865, Olivais, Baurú-SP',124588673579, '05/2024', 165),
('Vilma Haroldo Vianna', 'VIVI456', 'vivi_haroldo@hotmail.com', '00245833478', '30/03/1998', 'Rua dos mineiros, 1588, Inconfidentes, Lageado-MG',124400084576, '02/2025', 348);

insert into funcionario (nome, cpf) values
('Caio Marques', '16052877621'),
('Cristopher Costa', '29482347826'),
('Gabriela Wagner', '14480912573'),
('Ronaldo Ramos', '17773584958'),
('Wenny Campos ', '05927156736'),
('Maria Luiza Mondelli', '14467598307');

delete from funcionario 
where nome= 'Maria Luiza Mondelli';

insert into categoria (nome, descricao) values
('Autoajuda', 'A literatura de autoajuda trabalha em prol do autoconhecimento do indivíduo.'),
('Romance', 'Histórias capazes de emocionar e cativar todos os públicos.'),
('Ficção Científica', 'Se aprofunde mais nos conceitos científicos e tecnológicos de um futuro próximo'),
('Política', 'Intere-se sobre assuntos pertinentes ao assuntos da política brasileira e global'),
('Suspense', 'Mergulhe em mistérios nebulosos a serem resolvidos pelos leitores');

insert into produto (nome ,autor ,descricao ,quantidade_estoque ,data_fabricacao ,valor_unitario, id_funcionario, cnpj_empresa,id_categoria ) values
('O milagre da manhã', 'Hal Elrod' , 'Explica  os benefícios de acordar cedo', 37, '19/02/2020', 39.90 , 2, 15436940000103, 1),
('O poder do agora', 'Eckhart Tolle', 'Se queremos realmente mudar nossas vidas, precisamos começar neste momento', 15, '21/01/2020', 36.90, 1, 15436940000103, 1),
('Livre pra recomeçar', 'Paola Aleksandra', 'Anastácia precisará enfrentar o passado e descobrir como recomeçar', 29, '05/03/2020', 49.90, 5, 15436940000103, 2),
('O Duque e eu', 'Julia Quinn', 'Relata a envolvente história entre Daphine e o Duque Simon', 32, '17/04/2020', 33.90, 4 , 15436940000103, 2),
('O conto da Aia', 'Margaret Atwood', 'Distopia que se passa num futuro possível e tem como cenário um governo autoritário', 50, '24/06/2020', 29.90, 3, 15436940000103,3),
('Admirável mundo novo', 'Aldous Huxley', 'Clássico moderno para quem procura um dos exemplos mais marcantes de Estados autoritários', 43, '04/02/2020', 44.90, 1, 15436940000103, 3),
('A elite do atraso: Da escravidão ao Bolsonaro', 'Jessé Souza', 'Apresenta uma interpretação abrangente, inovadora e ousada da sociedade brasileira.', 25, '14/03/2020', 34.90, 2, 15436940000103, 4),
('Podres de mimados', 'Anthony Daniels', 'Trata de meninos mimados que regem o Brasil', 22,'25/04/2020', 54.90, 4, 15436940000103, 4),
('A mulher na janela', 'A. J. Finn', 'Suspense psicológico engenhoso e comovente que remete ao melhor de Hitchcock', 35, '15/01/2020', 28.90, 3, 15436940000103, 5),
('O colecionador de ossos', 'Jeffery Deaver', 'Relata a história de um homem solitário em sua busca insaciável pelo fêmur esquerdo de suas vítimas', 0, '23/01/2020', 79.90, 5, 15436940000103,5 );

insert into pedido (id_cliente,data_solicitado, valor_pedido ,status_pedido ) values
(1,'24/07/2020', 0,'Em processo'),
(2,'20/07/2020', 0,'Pago'),
(3,'04/05/2020', 0,'Pendente'),
(4,'13/06/2020', 0,'Pago'),
(5,'10/07/2020', 0,'Pago');

update pedido
set status_pedido = 'Pago'
where pedido.id_pedido=1
and pedido.status_pedido = 'Em processo';

insert into carrinho (id_produto , id_pedido, quantidade_solicitada ) values
(1,1,1), 
(10,1,1),
(3,2,1),
(4,3,1), 
(3,3,1),
(7,4,1),
(5,4,1),
(9,5,1);

update pedido
set valor_pedido = (select sum(p.valor_unitario * c.quantidade_solicitada)
                    from produto p
                    inner join carrinho c on p.id_produto = c.id_produto
                    where c.id_pedido = 1
                    group by c.id_pedido)
where id_pedido = 1

update pedido
set valor_pedido = (select sum(p.valor_unitario * c.quantidade_solicitada)
                    from produto p
                    inner join carrinho c on p.id_produto = c.id_produto
                    where c.id_pedido = 2
                    group by c.id_pedido)
where id_pedido = 2

update pedido
set valor_pedido = (select sum(p.valor_unitario * c.quantidade_solicitada)
                    from produto p
                    inner join carrinho c on p.id_produto = c.id_produto
                    where c.id_pedido = 3
                    group by c.id_pedido)
where id_pedido = 3

update pedido
set valor_pedido = (select sum(p.valor_unitario * c.quantidade_solicitada)
                    from produto p
                    inner join carrinho c on p.id_produto = c.id_produto
                    where c.id_pedido = 4
                    group by c.id_pedido)
where id_pedido = 4

update pedido
set valor_pedido = (select sum(p.valor_unitario * c.quantidade_solicitada)
                    from produto p
                    inner join carrinho c on p.id_produto = c.id_produto
                    where c.id_pedido = 5
                    group by c.id_pedido)
where id_pedido = 5

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
produto.valor_unitario as valor_unitÃ¡rio,
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