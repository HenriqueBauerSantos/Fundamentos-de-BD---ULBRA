--Comando de criação da tabela:

create table enderecos(
    id int auto_increment primary key,
    rua char(100) not null,
    numero bigint not null,
    cep int not null,
    uf char(2) not null
);
create table clientes(
    id int auto_increment primary key,
    nome char(100) not null,
    cpf bigint not null unique,
    telefone int not null,
    id_endereco int,
    constraint fk_endereco_clientes
        foreign key(id_endereco) references enderecos(id)
        on delete restrict
        on update cascade
);
create table marcas(
    id int auto_increment primary key,
    marca char(100) not null,
    modelo char(100) not null,
    ano int not null
);
create table carros(
    id int auto_increment primary key,
    placa char(7) not null unique,
    id_marca int not null,
    constraint fk_marcas_carros
        foreign key(id_marca) references marcas(id)
        on delete restrict
        on update cascade
);
create table alugueis(
    id int auto_increment primary key,
    data_aluguel DATE,
    data_devolucao DATE,
    valor_diaria float not null,
    id_cliente int not null,
    id_carro int not null,
    constraint fk_cliente_aluguel
        foreign key(id_cliente) references clientes(id)
        on delete restrict
        on update cascade,
    constraint fk_carro_aluguel
        foreign key(id_carro) references carros(id)
        on delete restrict
        on update cascade
)

-- Comandos de inserção: (Foram usados os mesmos comando com dados diferentes)

SELECT * FROM marcas 

INSERT  INTO  marcas (marca , modelo , ano ) VALUES (   
   'toyota' ,
  'corola' ,
  '2021'
) ; 
INSERT  INTO  carros (placa , id_marca ) VALUES (   
   'abc1234' ,
  '3'
) ; 
SELECT * FROM carros

INSERT  INTO  enderecos (rua , numero,cep,uf ) VALUES (   
   'abc' ,
  '300',
  '95585000',
  'rs'
) ; 
SELECT * FROM enderecos

INSERT  INTO  clientes (nome,telefone ,id_endereco,cpf ) VALUES (   
   'paulo souza' ,
    '123456489',
  '2',
  '03635073026'
) ; 
SELECT * FROM clientes

INSERT  INTO  alugueis (data_aluguel,data_devolucao ,valor_diaria,id_cliente,id_carro ) VALUES (   
   '2021/09/10' ,
    '2021/09/25',
  '70.00',
  '1',
  '2'
) ; 
SELECT * FROM alugueis

-- Comandos de Consulta/Modificação:

SELECT * FROM alugueis
WHERE year(data_aluguel)=2021 and month(data_aluguel)=9

SELECT * FROM clientes
WHERE nome LIKE '%Silva%'

UPDATE alugueis
SET valor_diaria = (valor_diaria*1.2)