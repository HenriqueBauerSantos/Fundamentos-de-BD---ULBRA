-- Comandos de criação da tabela:

create table pesquisadores(
    id int auto_increment primary key,
    codigo int not null unique,
    nome char(100) not null
);
create table editoras(
    id int auto_increment primary key,
    nome char(100) not null
);
create table periodicidades(
    id int auto_increment primary key,
    periodo char(50) not null,
    codigo_periodicidade int not null
);
create table artigos(
    id int auto_increment primary key,
    titulo char(150) not null,
    pag_inicial int not null,
    pag_final int not null,
    id_periodicidade int not null,
    id_editora int not null,
    constraint fk_periodicidade_artigos
        foreign key(id_periodicidade) references periodicidades(id)
        on delete restrict
        on update cascade,
    constraint fk_editora_artigos
        foreign key(id_periodicidade) references editoras(id)
        on delete restrict
        on update cascade
);
create table pesquisadores_artigos(
    id_pesquisador int not null,
    id_artigo int not null,
    constraint fk_pesquisador_pesquisadores_artigos
        foreign key(id_pesquisador) references pesquisadores(id)
        on delete restrict
        on update cascade,
    constraint fk_artigo_pesquisadores_artigos
        foreign key(id_artigo) references artigos(id)
        on delete restrict
        on update cascade
)

-- Comandos de inserção: (Foram usados os mesmos comando com dados diferentes)

SELECT * FROM pesquisadores

INSERT  INTO  pesquisadores (codigo, nome) VALUES (   
   '741852',
   'Jose Machado'
   ) ;
 
SELECT * FROM editoras

INSERT  INTO  editoras (nome) VALUE (   
   'Saraiva'
   ) ;
 
SELECT * FROM periodicidades

INSERT  INTO  periodicidades (periodo, codigo_periodicidade) VALUES (   
   'Semestral',
  	'15'
   ) ;

    SELECT * FROM artigos

INSERT  INTO  artigos (titulo, pag_inicial, pag_final, id_periodicidade, id_editora) VALUES (   
   'Cabana',
  	'5',
  	'410',
  	'3',
  	'3'
   ) ;
   
SELECT * FROM pesquisadores_artigos

INSERT  INTO  pesquisadores_artigos (id_pesquisador, id_artigo) VALUES (   
   '1',
  	'6'
   ) ;

-- Comandos de Consulta/Modificação:

   SELECT * FROM artigos
WHERE codigo LIKE '%1234%'

SELECT id FROM editoras
WHERE nome LIKE '%Saraiva%'

SELECT * FROM artigos
WHERE id_editora =3