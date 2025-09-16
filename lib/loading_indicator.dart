import 'package:flutter/material.dart';
import 'package:movie/shared/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(12)
        ),
        child: const Center(
          child: CircularProgressIndicator(color: AppTheme.yellow),
        ),
      ),
    );
  }
}