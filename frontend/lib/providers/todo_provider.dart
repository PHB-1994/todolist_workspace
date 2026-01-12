import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../services/todo_service.dart';

class TodoProvider with ChangeNotifier {
  // TODO: private 변수들 선언
  final TodoService _todoService = TodoService();
  List<TodoModel> _todos = [];
  bool _isLoading = false;
  String? _errorMessage = null;

  // TODO: getter들 구현
  List<TodoModel> get todos => _todos;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int get totalCount => _todos.length;
  int get completedCount => _todos.where((t) => t.isCompleted).length;
  int get activeCount => _todos.where((t) => !t.isCompleted).length;

  // TODO: loadTodos() 메서드 구현
  Future<void> loadTodos() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _todos = await _todoService.fetchTodos();
    } catch(e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }

  }

  // TODO: addTodo() 메서드 구현
  Future<void> addTodo(String content) async {
    try {
      await _todoService.addTodo(content);
      await loadTodos();
    } catch(e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // TODO: toggleTodo() 메서드 구현
  Future<void> toggleTodo(int id, bool isCompleted) async {
    try {
      await _todoService.toggleTodo(id, isCompleted);
      await loadTodos();
    } catch(e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  // TODO: removeTodo() 메서드 구현
  Future<void> removeTodo(int id) async {
    try {
      await _todoService.deleteTodo(id);
      await loadTodos();
    } catch(e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}