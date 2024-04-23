import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class Todo {
  final String title;
  final String description;

  Todo({
    required this.title,
    required this.description,
  });
}

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(loading: false, todos: []));

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is FetchTodosEvent) {
      yield state.copyWith(loading: true);

      try {
        final response = await http.get(Uri.parse(
            'https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8'));

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body) as List<dynamic>;
          final todos = jsonData
              .map((item) => Todo(
                    title: item['title'],
                    description: item['description'],
                  ))
              .toList();

          yield state.copyWith(loading: false, todos: todos);
        } else {
          yield state.copyWith(loading: false, todos: []);
        }
      } catch (e) {
        yield state.copyWith(loading: false, todos: []);
      }
    }
  }
}

class TodoEvent {}

class FetchTodosEvent extends TodoEvent {}

class TodoState {
  final bool loading;
  final List<Todo> todos;

  TodoState({
    required this.loading,
    required this.todos,
  });

  TodoState copyWith({
    bool? loading,
    List<Todo>? todos,
  }) {
    return TodoState(
      loading: loading ?? this.loading,
      todos: todos ?? this.todos,
    );
  }
}
