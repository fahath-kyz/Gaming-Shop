import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/game.dart';

class GameProvider with ChangeNotifier {
  List<Game> _games = [];
  final String _baseUrl = 'http://localhost:5000/api/games';

  List<Game> get games => [..._games];

  Future<void> fetchGames() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:5000/api/games'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      
      if (response.statusCode == 200) {
        final List<dynamic> gamesData = json.decode(response.body);
        _games = gamesData.map((game) => Game.fromJson(game)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load games');
      }
    } catch (error) {
      print('Error fetching games: $error');
      throw Exception('Error fetching games: $error');
    }
  }

  Future<void> addGame(Game game) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(game.toJson()),
      );

      if (response.statusCode == 201) {
        final newGame = Game.fromJson(json.decode(response.body));
        _games.add(newGame);
        notifyListeners();
      } else {
        throw Exception('Failed to add game');
      }
    } catch (error) {
      throw Exception('Error adding game: $error');
    }
  }

  Future<void> updateGame(String id, Game game) async {
    try {
      final response = await http.put(
        Uri.parse('$_baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(game.toJson()),
      );

      if (response.statusCode == 200) {
        final gameIndex = _games.indexWhere((g) => g.id == id);
        if (gameIndex >= 0) {
          _games[gameIndex] = game;
          notifyListeners();
        }
      } else {
        throw Exception('Failed to update game');
      }
    } catch (error) {
      throw Exception('Error updating game: $error');
    }
  }

  Future<void> deleteGame(String id) async {
    try {
      final response = await http.delete(Uri.parse('$_baseUrl/$id'));
      if (response.statusCode == 200) {
        _games.removeWhere((game) => game.id == id);
        notifyListeners();
      } else {
        throw Exception('Failed to delete game');
      }
    } catch (error) {
      throw Exception('Error deleting game: $error');
    }
  }
}