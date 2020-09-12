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