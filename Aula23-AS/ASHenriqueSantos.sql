-- 1.
-- Alternativa correta: B) 1:N e 1:N 
--      Onde um cliente pode ter muitos pedidos,
--      E um pedido pode ter muitos itens.
--
-- Alternativas incorretas:
-- A) O incorreto é que um cliente pode ter muitos pedidos, e não apenas um.
-- C) O incorreto é que um pedido pode ter muitos itens, e não apenas um.
-- D) e E) Não existe cardinalidades com Muitos (N) de minimo.


-- 2.
--  Correta é a B)
--  Incorretas:
-- # A afirmação 1 esta incorreta porque não necessariamente é necessario a criação da
--   tabela Aluno antes da tabela de Disciplina.
-- # A afirmação 3 esta incorreta porque a tabela Curso não pode ser a ultima, a tabela
--   Turma precisa referenciar ela.


-- 3.Marque a sentença que permite listar todas os nomes dos alunos juntamente com o nome da cidade onde moram, ordenado pelo nome do aluno.
-- Correta é : E)

select a.nome as nome_aluno, c.nome as nome_cidade 
    from aluno a 
        inner join cidade c 
            on a.idcid = c.idcid
	order by nome_aluno

-- 4.Faça um SQL que permite atualizar o valor do crédito do curso de nome “ADS” com o acréscimo de 10%.
-- Consulta previa:
select valorcredito
    from Curso
    where nomecurso = "ADS"

-- Acréscimo 10%:
update Curso
    set valorcredito = (valorcredito*1.1)
    where nomecurso = "ADS";

-- 5.  Marque a sentença que permite listar os códigos(id) das turmas com o nome da disciplina e a sala. 
-- A correta é a alternativa A)
select t.idturma, d.nome as nome_disciplina, t.sala 
    from Turdisc td 
        inner join turma t 
            on td.idturma = t.idturma
        inner join Disciplina d 
            on d.iddisc = td.iddisc

-- 6.Defina o comando SQL para listar o nome do curso e valor do crédito para o curso que tem o valor mais baixo de crédito(valorcredito).

-- A correta é a alternativa A)
-- Não é necessario utilizar JOINS. Os dados de nome do curso e valor de crédito estão na mesma tabela.

-- 7.Explique o conceito Integridade Referencial. De um exemplo SQL DDL para ilustrar melhor a sua explicação, usando a modelagem relacional (“Academico”).

-- A integridade relacional garante todos os relacionamentos corretos entre as tabelas, que todos os dados sejam conectados de
-- forma correta. Como exemplo temos na propia AS:

-- Turma(idturma, idprof,  sala, capacidade, idcurso)

-- Disciplina(iddidisc, nome)

-- Turdisc(idturma, iddisc)

-- Vemos que 'idturma' e 'iddisc' são relacionados com as tabelas Turma e Disciplina,  na forma de FK. Garantindo a conexão
-- correta dos dados.
-- Na imagem junto a pasta, vemos também a integridade relacional de Country em City, e de City em Address.


-- 8.Faça um SQL para adicionar a coluna data_entrada na tabela matricula.
alter table matricula
    add data_entrada date not null

-- 9.Faça um SQL para selecionar os alunos que não moram na cidade onde estudam. Considerando que a cidade onde estudam é Torres.
-- Exibir o código, o nome do aluno e a cidade onde ele mora.
select a.idaluno, a.nome as nome_aluno, c.nome as nome_cidade
    from Aluno a 
        inner join Cidade c 
            on a.idcid = c.idcid
    where a.cidade != 'Torres'

-- 10.
--Faça um SQL para exibir o nome do aluno, o código do curso, o nome do curso e o nome do professor da turma e
-- a data que ele se matriculou. Apresentar somente para alunos que tenham se matriculado entre semestre 1 de 2022,
-- considere que as matrículas iniciam em janeiro.

select a.nome as nome_aluno,c.idcurso as codigo_curso, c.nome as nome_curso, p.nome as nome_professor, m.data_entrada 
    from Aluno a 
        inner join Matricula m 
            on a.idaluno = m.idaluno
        inner join Turma t 
            on m.idturma = t.idturma
        inner join Curso c 
            on t.idcurso = c.idcurso
        inner join Professor p 
            on t.idprof = p.idprof
    where m.data_entrada >='2022-01-01' and m.data_entrada <='2022-07-01'


-- 11.
-- Faça um SQL que liste os 2 professores que mais turmas já atenderam. Importante mostrar o nome do professor.
select p.nome as nome_professor, count(t.idprof) as  quant_turmas
    from professor p 
        inner join Turma t 
            on t.idprof = p.idprof
    group by t.idprof
    order by quant_turmas desc
    limit 0,2;


