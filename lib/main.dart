import 'package:flutter/material.dart';
import 'package:movie/auth/forget_password.dart';
import 'package:movie/auth/register_screen.dart';
import 'package:movie/auth/update_profile_screen.dart';
import 'package:movie/shared/app_theme.dart';
import 'package:movie/auth/login_screen.dart';
import 'package:movie/home.dart';
import 'package:movie/onboarding/onboarding_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(Movies(seenOnboarding: seenOnboarding));
}

class Movies extends StatelessWidget {
  final bool seenOnboarding;

  const Movies({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),

      routes: {
        Home.routeName: (_) =>  Home(),
        LoginScreen.routeName: (_) =>  LoginScreen(),
        OnboardingScreens.routeName: (_) =>  OnboardingScreens(),
        RegisterScreen.routeName:(_)=>RegisterScreen(),
        UpdateProfileScreen.routeName: (_) => UpdateProfileScreen(),
       ForgetPassword.routeName:(_)=> ForgetPassword(),
      },
      theme: AppTheme.darkTheme,
      initialRoute: LoginScreen.routeName
     /* initialRoute: RegisterScreen.routeName
      seenOnboarding
          ? LoginScreen.routeName
          : OnboardingScreens.routeName,*/
    );
  }
}
