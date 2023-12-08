import 'dart:convert'; // Pour utiliser jsonEncode et jsonDecode

import 'package:http/http.dart' as http;

import 'package:listeusers/user.dart'; // Pour utiliser File

class UserRepository {
  Future<List<User>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> jsonPosts = json.decode(response.body);
      List<User> posts = jsonPosts.map((json) => User.fromJson(json)).toList();
      return posts;
    } else {
      throw Exception('Erreur de chargement');
    }
  }
}
