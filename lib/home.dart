import 'package:flutter/material.dart';
import 'package:movie/nav_bar_icons.dart';
import 'package:movie/tabs/explore/explore_tab.dart';
import 'package:movie/tabs/home/home_tab.dart';
import 'package:movie/tabs/profile/profile_tab.dart';
import 'package:movie/tabs/search/search_tab.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [HomeTab(), SearchTab(), ExploreTab(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: BottomNavigationBar(
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index) {
              if (currentIndex == index) return;
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: NavBarIcons(iconName: 'home'),
                activeIcon: NavBarIcons(iconName: 'home_active'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: NavBarIcons(iconName: 'search'),
                activeIcon: NavBarIcons(iconName: 'search_active'),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: NavBarIcons(iconName: 'explore'),
                activeIcon: NavBarIcons(iconName: 'explore_active'),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: NavBarIcons(iconName: 'profile'),
                activeIcon: NavBarIcons(iconName: 'profile_active'),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
