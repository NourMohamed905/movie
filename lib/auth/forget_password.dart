import 'package:flutter/material.dart';
import 'package:movie/shared/defualt_elevated_button.dart';
import 'package:movie/shared/defualt_text_form.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = 'forget-passworsd';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/forgotpasswordbro1.png',
                height: size.height * 0.35,
                  fit: BoxFit.contain,
              ),
              Form(
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                  children: [
                    DefualtTextForm(
                      hintText: 'Email',
                      prefixIconImageName: 'email',
                    ),
                    SizedBox(height: size.height * 0.02),
              
                    DefualtElevatedButton(
                      label: 'Verify Email',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
