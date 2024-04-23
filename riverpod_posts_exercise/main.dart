import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'todo_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final todoProvider = watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Center(
        child: todoProvider.loading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: todoProvider.todos.length,
                itemBuilder: (ctx, index) {
                  final todo = todoProvider.todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoProvider.fetchTodos();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
