# Projeto de Banco de Dados

Projeto feito para a disciplina de [Projeto de Banco de Dados (IF692)] do curso de Ciência da Computação do [CIn/UFPE].

## Criando banco de dados

O banco de dados utilizado no projeto é o [MySQL Community Edition] versão 5.7+ que utiliza a engine [InnoDB].

Para realizar a criação do banco, basta entrar no console do MySQL e importar o _script_ principal, `AVidaEBela.sql`:

```sql
source AVidaEBela.sql
```

###### Setup de um usuário e suas permissões

```sql
CREATE USER 'avidaebela'@'localhost' IDENTIFIED BY 'querobrownie';

GRANT ALL ON my_db.* TO 'new_user'@'localhost';

FLUSH PRIVILEGES;
```

###### Debugando problemas com chaves estrangeiras

Em caso de erros ou _warnings_ ao gerar o BD. Utilize-se do comando `SHOW ENGINE INNODB STATUS;` e procure por `LATEST FOREIGN KEY ERROR` na mensagem gerada.

###### Importando dados de exemplo

Esse projeto está acompanhado de uma lista de dados de exemplo que pode ser facilmente persistida no banco de dados através do seguinte comando:

```sql
source Inserts.sql
```

## Alunos

* Daniel Sulman de Albuquerque Eloi
* Ihago Henrique Lucena e Silva
* Marcio Guilherme Tavares Cordeiro
* Maria Helena Andrade Souza
* Mayara Cavalcanti de Albuquerque Moreira
* Rafael Nunes Machado
* Rodrigo Alves Vieira
* Thiago Pinheiro Lima

[MySQL Community Edition]: https://www.mysql.com/products/community/
[InnoDB]: http://dev.mysql.com/doc/refman/5.7/en/innodb-storage-engine.html
[Projeto de Banco de Dados (IF692)]: http://www.cin.ufpe.br/~if692/
[CIn/UFPE]: http://www2.cin.ufpe.br/site/index.php
