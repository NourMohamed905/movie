import 'package:flutter/material.dart';
import 'package:movie/shared/app_theme.dart';
import 'package:svg_flutter/svg.dart';

class DefualtTextForm extends StatefulWidget {
  String hintText;
  String? prefixIconImageName;
  bool isPassword;
  TextEditingController? controller;
  void Function(String)? onChanged;
  String? Function(String?)? volditer;

  DefualtTextForm({
    required this.hintText,
    required this.prefixIconImageName,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.volditer,
  });

  @override
  State<DefualtTextForm> createState() => _DefualtTextFormState();
}

class _DefualtTextFormState extends State<DefualtTextForm> {
  late bool isObscur = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,

      style: TextStyle(
        color: AppTheme.white,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      obscureText: isObscur,
      decoration: InputDecoration(
        hintText: widget.hintText,

        prefixIcon: Padding(
          padding: const EdgeInsets.all(18),
          child: SvgPicture.asset(
            'assets/icons/${widget.prefixIconImageName}.svg',
            height: 25,
            width: 31,
            fit: BoxFit.scaleDown,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isObscur = !isObscur;
                  setState(() {});
                },
                icon: Icon(isObscur ? Icons.visibility_off : Icons.visibility,color: AppTheme.white,),
              )
            : null,
      ),
    );
  }
}
