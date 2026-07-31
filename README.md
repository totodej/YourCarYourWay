# Your Car Your Way
Ce projet est une démonstration de faisabilité (POC) pour une application de chat en temps réel.
L'objectif est de montrer la mise en œuvre d'un système de communication entre utilisateurs permettant l'échange de messages en direct.

## Project Structure

```
YourCarYourWay/
│
├── backend/     → Spring Boot application (Java 21)
│
├── frontend/    → Angular 20 application
│
└── README.md    → This file
```

## Installation
### Cloner le projet
Dans le terminal de votre IDE :
```sh
git clone https://github.com/totodej/YourCarYourWay.git
```
### Frontend - Installer les dépendances
```sh
npm install
```
### Backend - Installer le projet
Dans le terminal de votre IDE :
```sh
mvn install
```

## Lancement
### Lancer le Frontend
A partir du terminal de votre IDE Front
```sh
npm run start
```
### Lancer le Backend
A partir de votre IDE Java, lancer le projet.
```sh
mvn spring-boot:run
```

### Accès au POC
Vous pouvez maintenant accèder au site en local à partir de l'adresse : http://localhost:4200/
