import 'package:flutter/material.dart';
import 'package:movie/app_theme.dart';
import 'package:movie/auth/login_screen.dart';
import 'package:movie/home.dart';
import 'package:movie/onboarding/onboarding_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(Movies(seenOnboarding: seenOnboarding));
}

class Movies extends StatelessWidget {
  bool seenOnboarding;
  Movies({required this.seenOnboarding});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (_) => Home(),
        LoginScreen.routeName: (_) => LoginScreen(),
        OnboardingScreens.routeName: (_) => OnboardingScreens(),
      },
      theme: AppTheme.darkTheme,
      initialRoute: seenOnboarding
          ? LoginScreen.routeName
          : OnboardingScreens.routeName,
    );
  }
}
