import 'package:flutter/foundation.dart';

class TodoState {
  final bool loading;
  final List<Todo> todos;

  TodoState({
    required this.loading,
    required this.todos,
  });
}

class Todo {
  final String title;
  final String description;

  Todo({
    required this.title,
    required this.description,
  });
}
