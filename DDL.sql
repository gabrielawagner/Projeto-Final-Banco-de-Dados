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