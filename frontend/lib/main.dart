import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_router.dart';
import 'package:todo_app/common/theme_provider.dart';
import 'package:todo_app/providers/game_provider.dart';
import 'package:todo_app/screens/game_screen.dart';
import 'common/app_styles.dart';
import 'common/constants.dart';
import 'providers/todo_provider.dart';
import 'screens/todo_list_screen.dart';


/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            theme: themeProvider.themeData,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (_) => GameProvider(),
        child: MaterialApp(
          home: Center(
            child: Container(
              width: 400, // 모바일 가로 크기
              height: 800, // 모바일 세로 크기
              child: const GameScreen(),
            ),
          )
          // home:GameScreen(),
        ),

      );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (_) => GameProvider(),
//         /*
//         * Consumer<GameProvider>( 와
//         * builder: (context, gameProvider, child) 를
//         * 이쪽에서 작성하지 않고
//         * GameScreen 에서 작성한 의도 확인
//         * */
//         child: MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           routerConfig: AppRouter.router,
//         )
//     );
//   }
// }

/*
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TodoProvider())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme:  ThemeData(
          useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            scaffoldBackgroundColor: AppColors.background
        ),
          home: const TodoListScreen()
      ),
    );
  }
}


 */
