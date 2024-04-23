import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todo_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo App',
        home: TodoListScreen(),
      ),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

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
