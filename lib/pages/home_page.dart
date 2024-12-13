import 'package:escort/pages/profile_page.dart';
import 'package:escort/pages/services_page.dart';
import 'package:escort/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:escort/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: [
        _buildHomePageScreen(), // The screen for HomePage
        ProfilePage(), // Placeholder for Profile screen
        SettingPage(), // Placeholder for Settings screen
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: 'Home',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: 'Profile',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.settings),
          title: 'Settings',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      confineToSafeArea: true,
      backgroundColor: const Color.fromARGB(255, 214, 220, 230),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
    );
  }

  // Home page screen widget with AppBar, Drawer and SingleChildScrollView
  Widget _buildHomePageScreen() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      drawer: _buildDrawer(), // Add the drawer
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBanner(),
            const SizedBox(height: 20),
            const Text(
              "Services",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ServicesPage(),
            const SizedBox(height: 20),
            _buildImageSection(),
          ],
        ),
      ),
    );
  }

  // AppBar widget
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      title: const Text(
        "EscortServic.org",
        style: TextStyle(color: AppColor.whiteColor),
      ),
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
    );
  }

  // Drawer widget
  Drawer _buildDrawer() {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 233, 227, 227),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          _buildDrawerItem(Icons.person, 'Profile'),
          _buildDrawerItem(Icons.settings, 'Settings'),
          _buildDrawerItem(Icons.logout, 'Logout'),
        ],
      ),
    );
  }

  // Drawer header widget
  Widget _buildDrawerHeader() {
    return Container(
      height: 100,
      child: DrawerHeader(
        decoration: BoxDecoration(color: AppColor.primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Profile Name',
              style: TextStyle(color: AppColor.whiteColor, fontSize: 24),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: AppColor.whiteColor),
              onPressed: () {
                _scaffoldKey.currentState?.closeDrawer(); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }

  // Drawer list item widget
  ListTile _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Handle navigation or actions here
      },
    );
  }

  // Banner widget (optimized)
  Widget _buildBanner() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              image: AssetImage("assets/images/banar.PNG"),
            ),
          ),
          height: 250,
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Find Your Perfect Match !!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 5,
                        color: Colors.black),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Exclusive Services for Men, Women, and LGBTQ+",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  shadows: [
                    Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3,
                        color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Image section widget (image at the bottom)
  Widget _buildImageSection() {
    return Container(
      width: double.infinity,
      child: Image.asset(
        "assets/images/guranted.PNG",
        fit: BoxFit.cover,
        height: 200,
      ),
    );
  }
}
