import 'package:flutter/material.dart';
import '../../common/theme_provider.dart';

class ThemeCard extends StatelessWidget{
  final ThemeProvider themeProvider;
  final AppThemeType theme;
  final Color color;
  final VoidCallback onPurchaseRequested; // void = 반환없이 실행만 Callback 가지고 온거 사용

  const ThemeCard({
    super.key,
    required this.themeProvider,
    required this.theme,
    required this.color,
    required this.onPurchaseRequested
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = themeProvider.currentTheme == theme;
    final isPurchased = themeProvider.isThemePurchased(theme);

    return Card(
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(12),
        side: BorderSide(
          color: isSelected ? color : Colors.transparent,
          width: 2
        )
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        // 테마를 선택할 때 구매한 것만 적용, 구매 전이면 구매하기 버튼 호출
        onTap: isPurchased ? () => themeProvider.changeTheme(theme) : onPurchaseRequested,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8)
                )
              ),
              SizedBox(height: 16),
              // 테마 정보
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        themeProvider.getThemeName(theme),
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      )
                    ],
                  )
              ),
              // 구매 내역에 따른 상태 아이콘 표기
              Icon(
                isSelected ? Icons.check_circle : (isPurchased ? Icons.circle_outlined : Icons.lock_outline),
                color: isSelected ? color : Colors.grey[400],
                size: 28
              ),
            ],
          )
        )
      ),
    );
  }
}