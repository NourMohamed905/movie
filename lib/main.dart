import 'package:flutter/material.dart';
import 'package:movie/auth/forget_password.dart';
import 'package:movie/auth/update_profile_screen.dart';
import 'package:movie/register/presentation/screens/register_screen.dart';
import 'package:movie/shared/app_theme.dart';
import 'package:movie/auth/login_screen.dart';
import 'package:movie/home.dart';
import 'package:movie/onboarding/onboarding_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';
import 'language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: Movies(seenOnboarding: seenOnboarding),
    ),
  );
}

class Movies extends StatelessWidget {
  final bool seenOnboarding;

  const Movies({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: languageProvider.locale,
      routes: {
        Home.routeName: (_) => Home(),
        LoginScreen.routeName: (_) => LoginScreen(),
        OnboardingScreens.routeName: (_) => OnboardingScreens(),
        RegisterScreen.routename: (_) => RegisterScreen(),
        UpdateProfileScreen.routeName: (_) => UpdateProfileScreen(),
        ForgetPassword.routeName: (_) => ForgetPassword(),
      },
      theme: AppTheme.darkTheme,
      initialRoute: RegisterScreen.routename,
      /*seenOnboarding
          ? LoginScreen.routeName
          : OnboardingScreens.routeName,*/
    );
  }
}
