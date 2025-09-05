import 'package:flutter/material.dart';
import 'package:movie/shared/app_theme.dart';
import 'package:movie/shared/defualt_elevated_button.dart';
import 'package:movie/shared/defualt_text_form.dart';
import 'package:movie/shared/language_icons.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'Login-screeen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Image.asset('assets/images/logo2.png', fit: BoxFit.fill),
                  DefualtTextForm(hintText: 'Email', prefixIconImageName: 'email'),
                  SizedBox(height: size.height * 0.02),
                  DefualtTextForm(
                    hintText: 'Password',
                    prefixIconImageName: 'password',
                    isPassword: true,
                  ),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password ?',
                          style: textTheme.labelLarge!.copyWith(
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  DefualtElevatedButton(label: 'Login', onPressed: () {}),
            
                  SizedBox(height: size.height * 0.02),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Don’t Have Account ? ",
                          style: textTheme.labelLarge,
            
                          children: [
                            TextSpan(
                              text: "Create One",
                              style: textTheme.labelLarge!.copyWith(
                                color: AppTheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.3,
                        child: Divider(thickness: 1, color: AppTheme.primary),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or',
                          style: textTheme.titleMedium!.copyWith(
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                        child: Divider(thickness: 1, color: AppTheme.primary),
                      ),
                    ],
                  ),
            
                  SizedBox(height: size.height * 0.02),
                  DefualtElevatedButton(
                    iconName: 'google',
                    label: 'Login With Google',
                    onPressed: () {},
                  ),
                  SizedBox(height: size.height * 0.03),
                  LanguageIcons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
