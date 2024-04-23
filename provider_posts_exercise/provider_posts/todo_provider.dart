import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Todo {
  final String title;
  final String description;

  Todo({
    required this.title,
    required this.description,
  });
}

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  bool _loading = false;

  List<Todo> get todos => _todos;
  bool get loading => _loading;

  Future<void> fetchTodos() async {
    _loading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(
          'https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        _todos = jsonData
            .map((item) => Todo(
                  title: item['title'],
                  description: item['description'],
                ))
            .toList();
      } else {
        _todos = [];
      }
    } catch (e) {
      _todos = [];
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
