import 'package:flutter/material.dart';
import 'package:movie/auth/login_screen.dart';
import 'package:movie/onboarding/onboarding_item.dart';
import 'package:movie/shared/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreens extends StatefulWidget {
  static const String routeName = '/onboarding';

  OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<OnboardingItem> OnboardingScreenItems = [
    OnboardingItem(
      backgroundImage: 'assets/images/onboarding_one.png',
      title: 'Find Your Next \nFavorite Movie Here',
      description:
          'Get access to a huge library of movies to suit all tastes. You will surely like it.',
      mainButtonText: 'Explore Now',
      inContainer: false,
    ),
    OnboardingItem(
      backgroundImage: 'assets/images/onboarding_two.png',
      title: 'Discover Movies',
      description:
          'Explore a vast collection of movies in all\nqualities and genres. Find your next\nfavorite film with ease.',
      mainButtonText: 'Next',
      backButtonText: 'Back',
    ),
    OnboardingItem(
      backgroundImage: 'assets/images/onboarding_three.png',
      title: 'Explore All Genres',
      description:
          'Discover movies from every genre, in all\navailable qualities. Find something new\nand exciting to watch every day.',
      mainButtonText: 'Next',
      backButtonText: 'Back',
    ),
    OnboardingItem(
      backgroundImage: 'assets/images/onboarding_four.png',
      title: 'Create Watchlists',
      description:
          'Save movies to your watchlist to keep\ntrack of what you want to watch next.\nEnjoy films in various qualities and\ngenres.',
      mainButtonText: 'Next',
      backButtonText: 'Back',
    ),
    OnboardingItem(
      backgroundImage: 'assets/images/onboarding_five.png',
      title: 'Get Started',
      description:
          'Share your thoughts on the movies\nyou`ve watched. Dive deep into film\ndetails and help others discover great\nmovies with your reviews.',
      mainButtonText: 'Next',
      backButtonText: 'Back',
    ),
    OnboardingItem(
      backgroundImage: 'assets/images/onboarding_six.png',
      title: 'Start Watching Now',
      mainButtonText: 'Finish',
      backButtonText: 'Back',
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page?.toInt() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //AppTheme themeData = AppTheme();
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: OnboardingScreenItems.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(OnboardingScreenItems[index].backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: OnboardingScreenItems[index].inContainer
                        ? AppTheme.black
                        : Colors.transparent,
                    borderRadius: OnboardingScreenItems[index].inContainer
                        ? BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )
                        : null,
                  ),

                  child: Column(
                    children: [
                      OnboardingScreenItems[index].inContainer
                          ? Text(
                              OnboardingScreenItems[index].title,
                              style: AppTheme.darkTheme.textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              OnboardingScreenItems[index].title,
                              style: AppTheme.darkTheme.textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),

                      SizedBox(height: 10),
                      OnboardingScreenItems[index].inContainer
                          ? Text(
                              OnboardingScreenItems[index].description ?? '',
                              style: AppTheme.darkTheme.textTheme.titleSmall,
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              OnboardingScreenItems[index].description ?? '',
                              style: AppTheme.darkTheme.textTheme.titleSmall!
                                  .copyWith(color: AppTheme.gray, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),

                      SizedBox(height: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.primary,
                                foregroundColor: AppTheme.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),

                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('seenOnboarding', true);
                                if (currentIndex <
                                    OnboardingScreenItems.length - 1) {
                                  pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                } else {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    LoginScreen.routeName,
                                  );
                                }
                                setState(() {});
                              },
                              child: Text(
                                OnboardingScreenItems[index].mainButtonText!,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          if (OnboardingScreenItems[index].backButtonText !=
                              null)
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  side: BorderSide(color: AppTheme.primary),
                                  foregroundColor: AppTheme.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {
                                  if (currentIndex > 0) {
                                    pageController.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                  setState(() {});
                                },
                                child: Text(
                                  OnboardingScreenItems[index].backButtonText!,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
