import 'dart:html';

import 'package:flutter/material.dart';
import 'package:listeusers/repository.dart';

import 'user.dart';

import 'package:flutter/material.dart';

class ListUserPage extends StatefulWidget {
  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Utilisateurs'),
      ),
      body: FutureBuilder<List<User>>(
        future: UserRepository().fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                User user = snapshot.data![index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nom d\'utilisateur: ${user.username}'),
                      Text('Email: ${user.email}'),
                      Text('Téléphone: ${user.phone}'),
                      Text('Entreprise: ${user.company.name}'),
                      Text('Phrase d\'accroche: ${user.company.catchPhrase}'),
                      Text('Slogan de l\'entreprise: ${user.company.bs}'),
                      Text(
                          'Adresse: ${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}'),
                      Text(
                          'Coordonnées géographiques: ${user.address.geo.lat}, ${user.address.geo.lng}'),
                      // Ajoutez d'autres informations de l'utilisateur si nécessaire
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Utilisateurs'),
      ),
      body: FutureBuilder<List<User>>(
        // Remplacez cette fonction de récupération de données par votre propre logique
        future: UserRepository().fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Afficher un indicateur de chargement en attendant les données
          } else if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          } else {
            // Afficher la liste d'utilisateurs
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                User user = snapshot.data![index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.username),
                  // Ajoutez d'autres informations de l'utilisateur si nécessaire
                );
              },
            );
          }
        },
      ),
    );
  }
}
