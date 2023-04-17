-- mostrar todos os produtos que foram pedidos 
select pd.id as produto, pd.descricao as name_prod, pi.valor_unit as valor_ped, pi.qtd,
         pi.qtd* pi.valor_unit as valor_total_item, c.nome as categoria, 
from   produtos pd 
            inner join pedidos_itens pi
                on pi.id_produto = pd.id 
            inner join categorias c 
                on c.id = pd.id_categoria
            inner join pedidos p 
                on p.id = pi.id_pedido 
            inner join clientes cli 
                on  cli.id = p.id_cliente