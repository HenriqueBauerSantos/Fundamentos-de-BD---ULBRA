create table colaborador(
    id int auto_increment primary key,
    matricula varchar(20) not null unique,
    nome varchar(100) not null,
    email varchar(30) not null,
    senha varchar(10)
);
create table projeto(
    id int auto_increment primary key,
    nome varchar(100) not null,
    descricao varchar(200) not null,
    duracao float not null
);
create table ColaboradorProjeto(
    id int auto_increment primary key,
    id_colaborador int not null,
    id_projeto int not null,
    constraint fk_colaborador
            foreign key(id_colaborador) references colaborador(id),
    constraint fk_projeto
            foreign key(id_projeto) references projeto(id)
);
create table comentario(
    id int auto_increment primary key,
    comentario varchar(300) not null,
    data_e_hora timestamp not null,
    id_colaborador int not null,
    constraint fk_colaborador_comentario
            foreign key(id_colaborador) references colaborador(id)
);  
create table melhoriaprojeto(
    id auto_increment primary key,
    departamento int not null,
    resultado_esperado varchar(200) not null,
    id_projeto int not null,
    constraint fk_projeto_melhoriaprojeto
            foreign key(id_projeto) references projeto(id)
);
create table social(
    id int auto_increment primary key,
    publico_beneficiado varchar(200) not null,
     id_projeto int not null,
    constraint fk_projeto_social
            foreign key(id_projeto) references projeto(id)
);