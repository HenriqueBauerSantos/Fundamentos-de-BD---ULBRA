--Criar tabelas:
create table casas(
    id int auto_increment primary key,
    descricao varchar(50) not null,
    capacidade_max int not null,
	endereco varchar(50),
    preco float not null
);
create table clientes(
	id int auto_increment primary key,
    nome varchar(40) not null,
    CPF varchar(11) unique not null,
    endereco varchar(50),
    data_nascimento date,
    nacionalidade varchar(30)
);
create table alugueis(
	id int auto_increment primary key,
    id_cliente int not null,
    id_casa int not null,
    data_entrada date not null,
    data_saida date,
    constraint fk_cliente_alugueis
        foreign key(id_cliente) references clientes(id)
        on delete restrict
        on update cascade,
    constraint fk_casa_alugeuis
        foreign key(id_casa) references casas(id)
        on delete restrict
        on update cascade
);

--Inserir dados:
SELECT * FROM casas;

insert into clientes (nome, CPF, endereco, data_nascimento, nacionalidade) 
    VALUES
        ('Mirandela Editora','12345678910', 'Av. assis brasil, 123', '1998-07-01', 'Brasileira'),
        ('Editora via-norte','12345678911', 'Av. Jose, 123', '1990-01-10', 'Brasileira'),
        ('Editora Ilhas Tijucas','12345678912', 'Rua H, 123', '1980-10-01', 'Brasileira'),
        ('Maria José Editora','12345678913', 'Rua Bandeira, 123', '1995-09-11', 'Brasileira');

insert into casas (descricao, capacidade_max, endereco, preco) 
    VALUES
        ('Casa Amarela',7, 'Av. assis brasil, 1750', 137.5),
        ('Apartamento frente mar',6, 'ARua beira mar, 501', 207.7),
        ('Casa esquina',4, 'Rua das dunas, 475', 99.9),
        ('Chalé',5, 'Rua verde, 237', 100.0);

insert into alugueis (id_cliente, id_casa, data_entrada, data_saida) 
    VALUES
        ('5','1', '2022-10-12', '2023-07-01'),
        ('6','1', '2022-10-12', '2023-08-10'),
        ('7','3', '2022-11-12', null),
        ('8','4', '2022-12-12', '2023-02-12');

-- Clientes por casa:
select id_casa, count(id_cliente) as clientes_por_casa
    from alugueis
    group by id_casa

-- Maior preco:
select id, max(preco) as maior_preco
    from casas;

--Menor preco:
select id, min(preco) as menor_preco
    from casas;

--Mostrar os clientes da casa id 1, nomes, e CPF:
select a.id as id_casa, cs.descricao, c.id as id_cliente,c.nome, c.CPF  
    from alugueis a 
        inner join clientes c 
            on c.id = a.id_cliente
		inner join casas cs 
            on cs.id = a.id_casa
	where a.id_casa = 1

-- 2 ou mais clientes por casa:
select id_casa, count(id_cliente) as clientes_por_casa
    from alugueis
    group by id_casa
    having clientes_por_casa>=2
