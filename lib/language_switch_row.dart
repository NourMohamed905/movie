import 'package:flutter/material.dart';
import 'package:movie/shared/app_theme.dart';
import 'package:svg_flutter/svg_flutter.dart';

class LanguageSwitchRow extends StatelessWidget {
  final String currentLang;
  final Function(String) onSelect;

  const LanguageSwitchRow({
    super.key,
    required this.currentLang,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 120,
      height: 55,
      decoration: BoxDecoration(
        color: AppTheme.backgrounddark,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.yellow, width: 3),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => onSelect("en"),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: currentLang == "en"
                        ? AppTheme.yellow
                        : AppTheme.backgrounddark,
                    width: 3,
                  ),
                ),
                child: ClipOval(
                  child: SvgPicture.asset(
                    "assets/icons/en.svg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ),
            GestureDetector(
              onTap: () => onSelect("ar"),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: currentLang == "ar"
                        ? AppTheme.yellow
                        : AppTheme.backgrounddark,
                    width: 3,
                  ),
                ),
                child: ClipOval(
                  child: SvgPicture.asset(
                    "assets/icons/ar.svg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}