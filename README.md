![RedRounRobinLogo](https://i.imgur.com/3Dcv4vs.png)

# Github Actions configurations

Repository per la configurazione della CI, dei .gitignore e dell'installazione docker

### Install

> :fire: Ricordare di abilitare le porte sul droplet

1. Scaricare la repo
2. Entrare sulla cartella install/
3. chmod +x mr_wolf.sh
4. Avviare mr_wolf.sh


### Configurazione

- server.port=9999
- spring.postgres.url=jdbc:postgresql://core.host.redroundrobin.site:6543/postgre
- spring.timescale.url=jdbc:postgresql://core.host.redroundrobin.site:3456/timescale
- telegram.url=http://core.host.redroundrobin.site:3000/