import 'package:flutter/material.dart';

class StatisticsBar extends StatelessWidget {
  final int totalCount;
  final int activeCount;
  final int completedCount;

  const StatisticsBar({
    super.key, // StatelessWidget 에 기본으로 존재하는 변수들
    required this.totalCount,
    required this.activeCount,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('statistics_bar is working'),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String count;
  final Color color;

  const StatCard({
    super.key,
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

}