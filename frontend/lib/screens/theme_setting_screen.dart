import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/theme/theme_list.dart';
import '../common/theme_provider.dart';
/*
lib
├──── widgets/
│        ├──── theme_card.dart            # 테마 카드 메인
│        ├──── theme_purchase_dialog.dart # 구매 다이얼로그
│        └──── theme_list.dart            # 테마 목록
│
└──── screen/
         └──── theme_setting_screen.dart  # 테마 설정 화면

 */
class ThemeSettingScreen extends StatelessWidget {
  const ThemeSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("테마 설정"),
        leading: IconButton(onPressed: () => context.go('/'), icon: const Icon(Icons.arrow_back)),
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child){
          return ThemeList(themeProvider: themeProvider);
        }
      ),
    );
  }
}