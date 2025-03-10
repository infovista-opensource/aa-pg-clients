# aa-psql-client

![Static Badge](https://img.shields.io/badge/Postgres_Client-17-blue) ![Static Badge](https://img.shields.io/badge/alpine-3.21.3-brightgreen)



Collection of tools PostgreSQL clients. Available tools:

* [pg_amcheck](https://www.postgresql.org/docs/17/app-pgamcheck.html)
* [pg_basebackup](https://www.postgresql.org/docs/17/app-pgbasebackup.html)
* [pg_dump](https://www.postgresql.org/docs/17/app-pgdump.html)
* [pg_dumpall](https://www.postgresql.org/docs/17/app-pg-dumpall.html)
* [pg_isready](https://www.postgresql.org/docs/17/app-pg-isready.html)
* [pg_receivewal](https://www.postgresql.org/docs/17/app-pgreceivewal.html)
* [pg_recvlogical](https://www.postgresql.org/docs/17/app-pgrecvlogical.html)
* [pg_restore](https://www.postgresql.org/docs/17/app-pgrestore.html)
* [pg_verifybackup](https://www.postgresql.org/docs/17/app-pgverifybackup.html)
* [pgbench](https://www.postgresql.org/docs/17/pgbench.html)
* [psql](https://www.postgresql.org/docs/17/app-psql.html)


## Docker

Docker image are available on [piccio/aa-pg-clients](https://hub.docker.com/repository/docker/piccio/aa-pg-clients/general) repository

Image specification: `piccio/aa-pg-clients`:`<pg_client_major_version>`-r`<internal_build>`

i.e. : `piccio/aa-pg-clients`:**17-r0**


## Use Cases

## Docker

```shell
$ kubectl port-forward -n empirix-cloud svc/nla-postgres-ha-psqlha-pgpool 5432:5432
Forwarding from 127.0.0.1:5432 -> 5432
Forwarding from [::1]:5432 -> 5432
...
```


Run 


```shell
$ docker run -it --rm --network host piccio/aa-pg-client:17-r0 psql -h 127.0.0.1 -U postgres postgres -c "select version()"
Password for user postgres: 
                                          version                                           
--------------------------------------------------------------------------------------------
 PostgreSQL 14.11 on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
(1 row)

```

```shell
$ docker run --rm --network host -e PGPASSWORD=<PASSWORD> piccio/aa-pg-client:17-r0 psql -h 127.0.0.1 -U postgres postgres -c "select version()"
                                          version                                           
--------------------------------------------------------------------------------------------
 PostgreSQL 14.11 on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
(1 row)
```


```shell
$ docker run piccio/aa-pg-client psql <psql_args> 
docker run -it --rm --network host piccio/aa-pg-client:17-r0 psql -h 127.0.0.1 -U postgres postgres
Password for user postgres: <THE PASSWORD>
postgres=# select version();
                                          version                                           
--------------------------------------------------------------------------------------------
 PostgreSQL 14.11 on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
```



```
$ docker run -it --rm piccio/aa-pg-client:17-r0  /bin/sh
~ $ id
uid=1001 gid=0(root) groups=0(root)
~ $ psql --help
psql is the PostgreSQL interactive terminal.

Usage:
  psql [OPTION]... [DBNAME [USERNAME]]
[ ... ]
```

## Kubernetes

```shell
kubectl -n  empirix-cloud run foo --image=piccio/aa-pg-client:17-r0 --rm -it --command -- /bin/sh

foo:/# psql -h nla-postgres-ha-psqlha-pgpool.empirix-cloud.svc -p 5432 -U postgres
Password for user postgres: 
psql (16.6, server 16.3)
Type "help" for help.

postgres=# \l
                                                       List of databases
   Name    |  Owner   | Encoding | Locale Provider |   Collate   |    Ctype    | ICU Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+-------------+-------------+------------+-----------+-----------------------
 postgres  | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |            |           | 
 repmgr    | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |            |           | 
 template0 | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |            |           | =c/postgres          +
           |          |          |                 |             |             |            |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |            |           | =c/postgres          +
           |          |          |                 |             |             |            |           | postgres=CTc/postgres
(4 rows)

postgres=# \q
foo:/# exit
exit
```
