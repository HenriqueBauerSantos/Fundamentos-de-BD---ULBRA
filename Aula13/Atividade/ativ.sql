create table fornecedores(
    id int auto_increment primary key,
    codigo int not null unique,
    nome char(100) not null
);
create table categoria_produto(
    id int auto_increment primary key,
    nome varchar(100) not null
);
create table produtos(
    id int auto_increment primary key,
    codigo int not null unique,
    descricao varchar(150) not null,
    valor_unitario decimal(12,2) not null,
    data_cadastro date not null,
    id_categoria int not null,
    constraint fk_categoria_produto
        foreign key(id_categoria) references categoria_produto(id)
        on delete restrict
        on update cascade
        
);
create table pedidos(
    id int auto_increment primary key,
    data_pedido date not null,
    id_fornecedor int not null,   
    constraint fk_fornecedor_pedido
        foreign key(id_fornecedor) references fornecedores(id)
        on delete restrict
        on update cascade
);
create table pedidos_itens(
    id_produto int not null,
    valor_unitario decimal(10,3) default 0,
    quantidade float not null,
    id_pedido int not null,
    constraint fk_produto_pedidos_itens
        foreign key(id_produto) references produtos(id)
        on delete restrict
        on update cascade
    constraint fk_pedidos_pedidos_itens
        foreign key(id_pedido) references pedidos(id)
        on delete restrict
        on update cascade
)
alter table fornecedores(
    add data_ultima_compra date
)

alter table pedidos(
    rename column data_pedido to data_pedido_at
)

alter table produtos
    drop data_cadastro

alter table categoria_produto
    on delete cascade
    on update restrict 

alter table fornecedores
    alter nome to varchar(130)

drop table fornecedores cascade

alter table pedidos
    add numero_pedido varchar(50)

insert into categoria_produto(nome) value ('Limpeza')
insert into categoria_produto(nome) value ('higiene')
insert into categoria_produto(nome) value ('Bebidas')

insert into fornecedores(codigo,nome) value (951753,'Roma')

insert into produtos(codigo,descricao,valor_unitario,data_cadastro,id_categoria) value (1479632,'Colgate',7.5,2020-11-11,1)