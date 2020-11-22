# VAGRANTFILE 
#2ASIX - ASO - 2020


[![N|Solid](http://www.institutpedralbes.cat/wp-content/uploads/2020/02/logo.jpg)](http://www.institutpedralbes.cat/)



Aquest Vagrantfile juntament amb l'script d'aprovisionament ens permet executar de manera automàtica una MV integrada amb un stack LAMP i un panell d'administració ADMINER.


[![N|Solid](https://www.adminer.org/static/images/adminer.png)](https://www.adminer.org/)

[![N|Solid](https://www.apachefriends.org/images/xampp-logo-ac950edf.svg)](https://www.apachefriends.org/index.html)

# Instal·lació
  - Descarregar vagrant i virtualbox!
  ```sh
  $ sudo su
  # sudo apt install virtualbox
  # sudo apt update
  # sudo apt install ./vagrant_2.2.6_x86_64.deb
  $ vagrant --version
  ```
  - Crear una carpeta al nostre lloc de treball on muntarem la MV
  ```sh
 # mkdir /asixMV
  ```
  
  - Una vegada dintre, hem de crear un arxiu de text anomenat Vagrantfile
```sh
# vim Vagrantfile
```
  - Copiarem i enganxarem el codi d'aquest Vagrantfile al nostre desitjat
  
  - Hem de tindre, apart del Vagrantfile el nostre script d'aprovisionament que ens instal·larà Adminer i l'STACK 
 ```sh
 # mv ~/aprovisionament.sh /asixMV
 ```
  - Finalment, amb el nostre script i el Vagrantfile realitzarem un:
  ```sh
 # vagrant up
  ```






> Aquest script/Vagrantfile son merament 
> arxius de prova i/o no pretenen substituir cap software 
> professional.


This text you see here is *actually* written in Markdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.


### Installation

Dillinger requires [Node.js](https://nodejs.org/) v4+ to run.

Install the dependencies and devDependencies and start the server.

```sh
$ cd dillinger
$ npm install -d
$ node app
```

For production environments...

```sh
$ npm install --production
$ NODE_ENV=production node app
```








   

