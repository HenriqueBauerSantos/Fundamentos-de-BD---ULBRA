--Comando de criação da tabela:

create table enderecos(
    id int auto_increment primary key,
    rua char(100) not null,
    numero int not null,
    cep int not null,
    uf char(2) not null
);
create table tipos_socios(
    id int auto_increment primary key,
    codigo int not null unique,
    descricao char(150) not null
);
create table socios(
    id int auto_increment primary key,
    nome char(100) not null,
    cpf bigint not null unique,
    telefone bigint not null,
    id_endereco int not null,
    id_tipo_socio int not null,
    constraint fk_endereco_clientes
        foreign key(id_endereco) references enderecos(id)
        on delete restrict
        on update cascade,
    constraint fk_tipo_socio_socios
        foreign key(id_tipo_socio) references tipos_socios(id)
        on delete restrict
        on update cascade
);
create table tipo_servicos(
    id int auto_increment primary key,
    codigo int not null unique,
    descricao char(100) not null
);
create table servicos(
    id int auto_increment primary key,
    data_referencia DATE,
    valor_pago float not null,
    id_tipo_servico int not null,
    id_socio int not null,
    constraint fk_tipo_servico_servicos
        foreign key(id_tipo_servico) references tipo_servicos(id)
        on delete restrict
        on update cascade,
    constraint fk_socio_servicos
        foreign key(id_socio) references socios(id)
        on delete restrict
        on update cascade
)

-- Comandos de inserção: (Foram usados os mesmos comando com dados diferentes)
INSERT  INTO  enderecos (rua,numero,cep,uf )
VALUES (' Barão do Rio Branco','100','95560000','RS'),
       (' Barão do Rio Branco','150','95560000','RS' ),
       (' Assis Brasil','100','955585000','RS' );
SELECT * from enderecos

INSERT  INTO  tipos_socios (codigo,descricao )
VALUES (' 1','socio Benemerito'),
       (' 2','socio honorario' ),
       (' 3','socio exemplar' );
 SELECT * FROM tipos_socios
 
INSERT  INTO  socios ( nome, cpf,telefone,id_endereco,id_tipo_socio)
VALUES (' lucas','57982700098','51453248595','1','1'),
       (' pedro','33782144066','51619679563','2','2' ),
       (' paulo','82279975033','51689955484','3','3' );
SELECT *from socios

INSERT  INTO  tipo_servicos (codigo,descricao)
VALUES ('1','colocaçao de piso'),
       ('2','troca de pneus' ),
       ('3','pintura predial' );
 SELECT * from tipo_servicos
 
 INSERT into servicos(data_referencia,valor_pago,id_tipo_servico,id_socio) 
 VALUES ('2020-10-01','1000','1','1'),
        ('2021-10-30','100','2','2' ),
        ('2020-01-01','500','3','3' );
 SELECT * from servicos


-- Comandos de Consulta/Modificação:
 
 /* seleciona os valores maiores que 500*/
SELECT * from servicos
WHERE valor_pago >500
/* seleciona a data  do mes 1  de 2020*/
SELECT * FROM servicos
WHERE year(data_referencia)=2020 and month(data_referencia)=1
/* seleciona o endereço que contem barao deo rio branco*/
select * from enderecos
WHERE rua like 'Barão do Rio Branco%'