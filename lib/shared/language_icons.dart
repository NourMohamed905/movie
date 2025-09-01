import 'package:flutter/material.dart';
import 'package:movie/shared/app_theme.dart';
import 'package:svg_flutter/svg_flutter.dart';

class LanguageIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric( vertical: 1 , horizontal: 2),

      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primary)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/en.svg'),
          SizedBox(width: 10),
          SvgPicture.asset('assets/icons/ar.svg'),
        ],
      ),
    );
  }
}
