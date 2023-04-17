--Exercicio 1:
create table editoras(
    id int auto_increment primary key,
    nome varchar(40) not null
);
create table assuntos(
    id int auto_increment primary key,
    descricao varchar(40) not null
);
create table livros(
    id int auto_increment primary key,
    titulo varchar(40) not null,
    preco float not null,
    data_lancamento date,
    id_editora int not null,
    id_assunto int not null,
    constraint fk_editora_livro
        foreign key(id_editora) references editoras(id)
        on delete restrict
        on update cascade,
    constraint fk_assunto_livro
        foreign key(id_assunto) references assuntos(id)
        on delete restrict
        on update cascade
);
create table autores(
    id int auto_increment primary key,
    nome varchar(40) not null,
    CPF varchar(11) unique not null,
    endereco varchar(50),
    data_nascimento date,
    nacionalidade varchar(30)
);
create table autores_livros(
    id_autor int not null,
    id_livro int not null,
    constraint fk_autor_autores_livros
        foreign key(id_autor) references autores(id)
        on delete restrict
        on update cascade,
    constraint fk_livro_autores_livros
        foreign key(id_livro) references livros(id)
        on delete restrict
        on update cascade
)

--Exercicio 2
insert into editoras (nome) 
    VALUES
        ('Mirandela Editora'),
        ('Editora via-norte'),
        ('Editora Ilhas Tijucas'),
        ('Maria José Editora');

SELECT * FROM editoras
INSERT INTO assuntos ( descricao)
VALUES
('Banco de Dados'),
('Programação'),
('Redes'),
('Sistemas Operacionais');
alter table livros add column preco decimal(12,2) default 0;
INSERT INTO livros (titulo, preco, data_lancamento, id_editora, id_assunto)
VALUES
('Bancos de Dados para a WEB', 31.20, '1999-01-10', '1', '3'),
('Programando em Linguagem C', 30.00, '1997-10-01', '1', '2'),
('Programando em Linguagem C++', 111.50, '1998-11-01', '3', '1'),
('Bancos de Dados na Bioinformática', 48.00,'1998-07-01' , '2', '4'),
('Redes de Computadores', 42.00, '1996-09-01', '2', '2');

INSERT INTO autores (nome, CPF, endereco, data_nascimento, nacionalidade)
VALUES
('Roberta Del Gato', '12345678910', 'Av. assis brasil', '1998-07-01', 'Brasileira'),
('Ricardo Yago Brito', '12345678911', 'Av. assis brasil', '1998-07-01', 'Brasileira'),
('Elaine Lívia Moura', '12345678912', 'Av. assis brasil', '1998-07-01', 'Brasileira'),
('Carlos Eduardo Lima', '12345678913', 'Av. assis brasil', '1998-07-01', 'Brasileira'),
('Isabela da Rocha', '12345678914', 'Av. assis brasil', '1998-07-01', 'Brasileira');

insert into autores_livros (id_autor, id_livro)
	values
		(1,1),
        (1,2),
        
        (2,1),
        (2,3),
        (2,4),
        
        (3,4),
        (4,4),
        (5,5),
        (2,5),
        (3,5),
        (4,5);
