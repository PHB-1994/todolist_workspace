import 'package:flutter/material.dart';

enum AppThemeType {
  purple, // 무료
  pink, // 무료
  blue, // 유료
  ocean,
  forest,
}

// 테마가 변경됨을 전체적으로 설정하기 위해 공지하여 변경하겠다 클래스와 함께 사용
// class ThemeProvider extends ChangeNotifier {
class ThemeProvider with ChangeNotifier {
  AppThemeType _currentTheme = AppThemeType.purple;

  // 구매한 테마로 변경할 수 있게 구매한 테마를 담아놓는 변수
  //      기본적으로 구매하지 않은 기본 테마는 누구나 항상 가질 수 있도록
  //            기본적으로 보라 테마를 포함
  final Set<AppThemeType> _purchasedThemes = {
    AppThemeType.purple,
    AppThemeType.forest
  };

  AppThemeType get currentTheme => _currentTheme;

  bool isThemePurchased(AppThemeType theme) => _purchasedThemes.contains(theme);

  ThemeData get themeData {
    switch (_currentTheme) {
      case AppThemeType.purple:
        return _buildTheme(
            primary: const Color(0xFF6200EE),
            secondary: const Color(0xFF03DAC6));
      case AppThemeType.pink:
        return _buildTheme(
            primary: const Color(0xFFE91E63),
            secondary: const Color(0xFF03DAC6));
      case AppThemeType.blue:
        return _buildTheme(
            primary: const Color(0xFF2196F3),
            secondary: const Color(0xFF00BCD4));
      case AppThemeType.ocean:
        return _buildThemeAdvanced(
          primary: const Color(0xFF006494),      // 깊은 바다색
          onPrimary: const Color(0xFFFFFFFF),    // 흰색 텍스트
          secondary: const Color(0xFF13293D),    // 어두운 네이비
          onSecondary: const Color(0xFFFFFFFF),
          tertiary: const Color(0xFF00A8E8),     // 밝은 하늘색
          error: const Color(0xFFFF6B6B),        // 부드러운 빨강
          surface: const Color(0xFFF0F8FF),      // 연한 하늘색 배경
          background: const Color(0xFF14AAD7),   // 아주 연한 파랑
        );
      case AppThemeType.forest:
        return _buildTheme(
            primary: const Color(0xFF2D6A4F),
            secondary: const Color(0xFF52B788));
    }
  }

  ThemeData _buildTheme({
    required Color primary,
    required Color secondary,
    Color? tertiary,
    Color? error,
    Color? background,
    Color? surface,
  }) {
    return ThemeData(
        useMaterial3: true,
        /*
        colorScheme: ColorScheme(
          primary: primary,
          onPrimary: Colors.white,
          primaryContainer: const Color(0xFFBB86FC),
          onPrimaryContainer: const Color(0xFF3700B3),
          secondary: secondary,
          brightness: null,
          onSecondary: null,
          error: null,
          onError: null,
          surface: null,
          onSurface: null,
        ),
         */
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          secondary: secondary,
          tertiary: tertiary,
          error: error,
          background: background,
          surface: surface
        ),
        // ColorScheme 처럼 세부 속성 설정하며 기본 primary 색상의 규정을
        // 세부 속성 설정 안한 디자인 구역에 배치하겠다.
        scaffoldBackgroundColor:
            const Color(0xFF56FF3c) // 0xFF = 불투명도 100%   F5F5F5 = hex
        );
  }

  ThemeData _buildThemeAdvanced({
    required Color primary,
    required Color secondary,
    Color? tertiary,
    Color? error,
    Color? onPrimary,
    Color? onSecondary,
    Color? surface,
    Color? background,
    Brightness brightness = Brightness.light,
}) {
    return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: brightness,

          // Primary colors
          primary: primary,
          onPrimary: Colors.white, // TODO: 적절한 대비색 선택
          primaryContainer: primary.withOpacity(0.3), // TODO: Container 색상
          onPrimaryContainer: Colors.black, // TODO: 대비색

          // Secondary colors
          secondary: secondary,
          onSecondary: Colors.white, // TODO
          secondaryContainer: secondary.withOpacity(0.3), // TODO
          onSecondaryContainer: Colors.black, // TODO

          // Tertiary colors
          tertiary: tertiary ?? Colors.green, // TODO
          onTertiary: Colors.white, // TODO
          tertiaryContainer: (tertiary ?? Colors.green).withOpacity(0.3), // TODO
          onTertiaryContainer: Colors.black, // TODO

          // Error colors
          error: error ?? Colors.red, // TODO
          onError: Colors.white, // TODO
          errorContainer: (error ?? Colors.red).withOpacity(0.3), // TODO
          onErrorContainer: Colors.black, // TODO

          // Surface colors
          surface: Colors.white, // TODO: brightness에 따라 변경
          onSurface: Colors.black, // TODO
          surfaceContainerHighest: Colors.grey[200]!, // TODO
          onSurfaceVariant: Colors.grey[700]!, // TODO

          // Other
          outline: Colors.grey, // TODO
          shadow: Colors.black, // TODO
        ),
    );
  }

  void changeTheme(AppThemeType theme) {
    // 만약에 구매한 테마가 있고, 구매한 테마로 변경하겠다 선택하면 전체적으로 테마 교체
    if (_purchasedThemes.contains(theme)) {
      _currentTheme = theme;
      notifyListeners();
    }
  }

  // 테마 구매 = 나중에는 토스 결제 로직이 들어가야 한다.
  Future<bool> purchaseTheme(AppThemeType theme) async {
    // 실제 결제 로직 변경하는 구간

    await Future.delayed(const Duration(seconds: 1)); // 결제가 되는 듯한 시뮬레이션

    _purchasedThemes.add(theme);
    notifyListeners();
    return true;
  }

  String getThemeName(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.purple:
        return 'Purple (Default)';
      case AppThemeType.pink:
        return 'Pink Theme';
      case AppThemeType.blue:
        return 'Blue Theme';
      case AppThemeType.ocean:
        return 'Ocean Theme';
      case AppThemeType.forest:
        return 'Forest Theme';
    }
  }

  String getThemePrice(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.purple:
        return 'Free';
      case AppThemeType.pink:
        return '2,200';
      case AppThemeType.blue:
        return '3,300';
      case AppThemeType.ocean:
        return '10,000';
      case AppThemeType.forest:
        return 'Free';
    }
  }
}
