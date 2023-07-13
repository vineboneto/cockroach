# Estudando CockroachDB

Este guia irá ajudá-lo a configurar e explorar o CockroachDB, um banco de dados distribuído SQL escalável e altamente disponível. Vamos abordar os passos necessários para executar o CockroachDB em um ambiente Docker e como se conectar a ele utilizando o haproxy para balanceamento de carga.

## Pré-requisitos

- Docker instalado em sua máquina

## Executando o CockroachDB com balanceamento de carga usando o haproxy

**1.** Clone o repositório do CockroachDB no GitHub:

```shell
git clone https://github.com/cockroachdb/cockroach
```

**2.** Acesse o diretório do CockroachDB:

```shell
cd cockroach
```

**3.** Execute o CockroachDB com o Docker Compose para criar um cluster de dois nós (roach1 e roach2) com balanceamento de carga usando o haproxy:

```shell
docker-compose up -d
```

**4.** Aguarde até que os contêineres sejam inicializados. Verifique se todos os contêineres estão em execução utilizando o comando:

```shell
docker-compose ps
```

**5.** Conecte-se ao cluster utilizando o haproxy. Utilize o seguinte comando para acessar o shell do PostgreSQL no contêiner:

```shell
docker run -it --network=roachnet postgres psql "postgresql://root@haproxy:26257/defaultdb?sslmode=disable"
```

**6.** Agora você está conectado ao cluster CockroachDB através do haproxy. Você pode executar comandos SQL para interagir com o banco de dados.

**7.** Para conectar-se diretamente a um nó específico do cluster, execute o seguinte comando:

```shell
docker exec -it roach1 ./cockroach sql --insecure -e 'select now()'
```

**8.** Você também pode acompanhar as logs do script Ruby que está sendo executado. Utilize o seguinte comando:

```shell
docker exec -it rubyscript tail -f logfile.log
```

## Parando e reiniciando os nós do cluster

- Para parar um dos nós do cluster, utilize o seguinte comando:

```shell
docker stop roach1
```

- O script Ruby continuará sendo executado, pois temos duas instâncias do banco de dados. Você pode verificar as logs do script utilizando o comando:

```shell
docker exec -it rubyscript tail -f logfile.log
```

- Para reiniciar um nó do cluster, utilize o seguinte comando:

```shell
docker start roach1
```

Agora você está pronto para explorar e estudar o CockroachDB em um ambiente distribuído. Certifique-se de verificar a documentação oficial do CockroachDB para obter mais informações sobre suas funcionalidades e recursos.

**Observação:** Certifique-se de adaptar os comandos e as configurações de acordo com o seu ambiente específico.

**Extra:** Ver consumo de memória e processador: `docker stats $(docker ps -aq)`
