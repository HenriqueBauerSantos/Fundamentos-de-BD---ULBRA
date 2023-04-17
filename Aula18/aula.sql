-- Anotaçoes / comandos aula:
insert into categorias (nome)
    values ('acessorios');

select * from produtos 
    where id = 202

update produtos
    set preco = 9.90
    where id = 202 

delete from produtos
    where id = 204

-- buscar produtos com valor maior que 1000;
select id,nome,preco from produtos
    where preco>=1000

-- na consulta anterior add 10% ao preco
select id,nome,preco,(preco*1.1) as novo_preco from produtos
    where preco>=1000

-- buscar produtos com valor maior que 1000 e vendido em novembro;
select id,nome,preco from produtos
    where preco>=1000 and data_cadastro >= '2022-11-01' and data_cadastro '2022-11-30'

-- soma dos produtos cad de set e out:
select sum(preco) as soma from produtos
    where data_cadastro >= '2022-09-01' and data_cadastro<='2022-10-31'

--Quantas tuplas:
select count(id) as quantos from produtos

--Mostrar o nome da categoria que pertence: (JUNÇÃO DE TABELAS)
select p.id, p.nome, c.nome as categoria  from produtos p, categorias c 
    where p.id_categoria = c.id

-- o que o cliente 104 comprou em outubro:
select p.id, p.nome, vi. quant from vendas v, vendas_intens vi, produtos p 
    where vi.id = vi.id_venda and p.id = vi.id_produto and v.id_cliente = 104

-- todos produtos vendidos em out e o valor total dos intens
select p.id, p.nome, vi.quant, vi.valor_unit, (quant*vi.valor_unit) as total 
    from vendas v, vendas_intens vi, produtos p 
    where vi.id = vi.id_venda and p.id = vi.id_produto and v.data >='2022-10-01' and v.data <='2022-10-31'

select c.nome as categoria, max (p.preco) as valor_alto
    from categoria c, produtos p
    where c.id = p.id_categoria
    group by c.nome

--Mostrar em uma order descendente: (asc= ascendente, desc= descendente)
select * from produtos
    order by preco desc

--mostrar quantos alunos tem em cada sala: (CONTA QUANTOS TEM DE ACORDO COM OUTRO ATRIBUTO,(group by))
select sala, count(id)as num
    from alunos
    group by sala

