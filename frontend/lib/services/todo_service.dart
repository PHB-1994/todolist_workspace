import 'package:dio/dio.dart';
import 'package:todo_app/common/constants.dart';
import '../models/todo_model.dart';

class TodoService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<List<TodoModel>> fetchTodos() async {
    try {
      final response = await _dio.get('/todos');
      final List<dynamic> data = response.data;
      return data.map((json) => TodoModel.fromJson(json)).toList();
    } on DioException catch(e){
      if(e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout){
        throw Exception(ErrorMessages.networkError);
      } else if(e.response?.statusCode != null && e.response!.statusCode! >= 500){
        throw Exception(ErrorMessages.serverError);
      }
      throw Exception(ErrorMessages.loadFailed);
    } catch (e) {
      throw Exception(ErrorMessages.loadFailed);
    }
  }

  Future<void> addTodo(String content) async {
    try {
      await _dio.post('/todos', data: {
        'content': content,
        'isCompleted': false,
      });
    } on DioException catch (e) {
      throw Exception('Failed to add todo: ${e.message}');
    }
  }

  Future<void> toggleTodo(int id, bool isCompleted) async {
    try {
      await _dio.put('/todos/$id', data: {
        'isCompleted': isCompleted,
      });
    } on DioException catch (e) {
      throw Exception('Failed to update todo: ${e.message}');
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      await _dio.delete('/todos/$id');
    } on DioException catch (e) {
      throw Exception('Failed to delete todo: ${e.message}');
    }
  }
}
