-- Sinaxe de tabelas:
-- create table nome_da_tabela
-- (
--     nome_do_atributo | dominio | vazios | chaves,
--     nome_do_atributo | dominio | vazios | chaves,
--     nome_do_atributo | dominio | vazios | chaves

-- );

create table clientes
(
    id int not null primary key,
    nome varchar(100) not null,
    CPF varchar(14) not null unique

);

create table enderecos
(
    id int not null primary key,
    logradouro varchar(100) not null,
    numero char(10),
    bairro varchar(100),
    cidade varchar(100),
    estado char(2),
    id_client int not null,
        constraint fk_clientes_enderecos
            foreign key(id_client) references clientes(id)

);

create table engenheiros
(
    id int not null primary key,
    nome varchar(100) not null
);
create table projetos
(
    id int not null primary key,
    nome varchar(100)
);
create table atuacoes
(
    id int not null primary key,
    id_engenheiro int not null,
    id_projeto int not null,
    funcao varchar(100) not null,
        constraint fk_engenheiro_atuacoes
            foreign key(id_engenheiro) references engenheiros(id),
        constraint fk_projeto_atuacoes
            foreign key(id_projeto) references projetos(id)

);


-- atividade slide 18:
create table aluno
(
    id int primary key,
    nome varchar(100) not null
);

create table departamento 
(
    id int primary key,
    nome varchar(100) not null
);
create table cursos
(
    id int primary key,
    nome varchar(100) not null,
    id_departamento int not null,
        constraint fk_departamento_cursos
            foreign key(id_departamento) references departamento(id)
);
create table professores
(
    id int primary key,
    nome varchar(100) not null
);
create table disciplinas
(
    id int primary key,
    nome varchar(100) not null,
    id_professor int not null,
        constraint fk_disciplina_professor
            foreign key(id_professor) references professores(id)
);
create table matriculas
(
    id int primary key;
    data_matricula date not null,
    id_aluno int not null,
    id_disciplica int not null, 
        constraint fk_aluno_matricula
                foreign key(id_aluno) references aluno(id)
        constraint fk_disciplina_matricula
            foreign key(id_disciplica) references disciplinas(id),
        
);


