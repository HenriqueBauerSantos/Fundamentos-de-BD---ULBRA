-- 1: Liste todos os produtos cadastrados e ordene por ordem alfabética de descrição.
select * 
    from produtos
    order by descricao

-- 2:Lista os produtos que foram pedidos e o nome do fornecedor de cada pedido.
select i.id_pedido, f.nome, i.id_produto, r.descricao, i.quantidade
    from pedidos p, produtos r, fornecedor f, pedidos_itens i
    where p.id_fornecedor = f.id and i.id_pedido = p.id and i.id_produto = r.id

-- 3:Mostre os produtos que já foram pedidos e o nome da categoria a que ele pertence.
select i.id_produto, p.descricao, c.nome 
    from pedidos_itens i, produtos p, categoria_produto c
    where i.id_produto = p.id and p.id_categoria = c.id
-- 4:Mostre o nome do fornecedor, a data do último pedido e a descrição do produto que ele pediu.
select f.nome,max(p.data_pedido) as data_ultimo_pedido, r.descricao 
    from pedidos p, fornecedor f, pedidos_itens i, produtos r
    where p.id_fornecedor = f.id and i.id_pedido = p.id and i.id_produto = r.id and f.id = x
