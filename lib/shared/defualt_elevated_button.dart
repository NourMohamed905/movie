import 'package:flutter/material.dart';
import 'package:movie/shared/app_theme.dart';
import 'package:svg_flutter/svg_flutter.dart';

class DefualtElevatedButton extends StatelessWidget {
  String label;
  VoidCallback onPressed;
  final String? iconName;
 

  DefualtElevatedButton({
    required this.label,
    required this.onPressed,
    this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 56),
      ),

      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconName != null) ...[
            SvgPicture.asset('assets/icons/${iconName}.svg'),
          ],
          SizedBox(width: 8,),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 18,
              color: AppTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
