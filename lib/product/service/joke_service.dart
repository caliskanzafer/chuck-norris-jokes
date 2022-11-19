import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/joke.dart';

class JokeService {
  Future<Joke> getJoke() async {
    final response =
        await http.get(Uri.https("matchilling-chuck-norris-jokes-v1.p.rapidapi.com", "/jokes/random"), headers: {
      "accept": "application/json",
      "X-RapidAPI-Key": "65aa7ccb84mshcaa31dcaa027802p121f29jsn6d63a5fa7058",
      "X-RapidAPI-Host": "matchilling-chuck-norris-jokes-v1.p.rapidapi.com"
    });
    log('${response.statusCode}');
    if (response.statusCode == HttpStatus.ok) {
      return Joke.fromJson(json.decode(response.body));
    }
    return Joke();
  }
}
