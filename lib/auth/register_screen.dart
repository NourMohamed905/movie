import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/shared/app_theme.dart';
import 'package:svg_flutter/svg.dart';
import '../home.dart';
import '../l10n/app_localizations.dart';
import '../shared/defualt_elevated_button.dart';
import '../shared/defualt_text_form.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = "register";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.register),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.2,
                child: CarouselSlider(
                  items: [1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          'assets/images/avatar_$i.png',
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          width: MediaQuery.sizeOf(context).width * 0.4,
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.55,
                      viewportFraction: 0.37),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.avatar,
                style: textTheme.titleMedium,
              ),
              SizedBox(
                height: 8,
              ),
              DefualtTextForm(
                hintText: AppLocalizations.of(context)!.name,
                prefixIconImageName: 'name',
                volditer: (value) {
                  if (value == null || value.length < 3) {
                    return 'Invalid name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DefualtTextForm(
                hintText: AppLocalizations.of(context)!.email,
                prefixIconImageName: 'email',
                volditer: (value) {
                  if (value == null || value.length < 5) {
                    return AppLocalizations.of(context)!.invalidEmail;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DefualtTextForm(
                isPassword: true,
                hintText: AppLocalizations.of(context)!.password,
                prefixIconImageName: 'password',
                volditer: (value) {
                  if (value == null || value.length < 8) {
                    return AppLocalizations.of(
                      context,
                    )!
                        .passwordMustBeAtLeast8Characters;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DefualtTextForm(
                isPassword: true,
                hintText: AppLocalizations.of(context)!.confirmPassword,
                prefixIconImageName: 'password',
                volditer: (value) {
                  if (value == null || value.length < 8) {
                    return AppLocalizations.of(
                      context,
                    )!
                        .passwordMustBeAtLeast8Characters;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DefualtTextForm(
                hintText: AppLocalizations.of(context)!.phone,
                prefixIconImageName: 'phone',
              ),
              SizedBox(height: 20),
              DefualtElevatedButton(
               label : AppLocalizations.of(context)!.createAccount,
                onPressed: () =>
                    Navigator.pushNamed(context, Home.routeName),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppLocalizations.of(context)!.alreadyHaveAccount,
                    style: textTheme.titleSmall,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: Text(AppLocalizations.of(context)!.login),
                  )
                ],
              ),
              SizedBox(height: 10,),

              Container(
                width: MediaQuery.sizeOf(context).width*.20,
                decoration: BoxDecoration(border:Border.all(color: AppTheme.primary,),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SvgPicture.asset("assets/icons/en.svg"),
                  SizedBox(width: 15,),
                  SvgPicture.asset("assets/icons/ar.svg"),
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}