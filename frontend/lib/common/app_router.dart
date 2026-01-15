import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/map_screen.dart';
import 'package:todo_app/screens/theme_setting_screen.dart';
import 'package:todo_app/screens/todo_list_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MapScreen()),
    GoRoute(
        path: ('/home'),
        name: 'home',
        builder: (context, state) => const TodoListScreen()),
    GoRoute(
        path: '/theme-settings',
        name: 'theme',
        builder: (context, state) => const ThemeSettingScreen()),
    GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen()),
  ],
    // errorBuilder:
  );
}
