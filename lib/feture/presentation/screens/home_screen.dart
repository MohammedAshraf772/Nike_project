import 'dart:io';

import 'package:flutter/material.dart';

import 'package:nike__project/feture/presentation/screens/cart_page.dart';
import 'package:nike__project/feture/presentation/screens/favorite_page.dart';
import 'package:nike__project/feture/presentation/screens/home_page.dart';
import 'package:nike__project/feture/presentation/screens/notivaction_page.dart';
import 'package:nike__project/feture/presentation/screens/profile_page.dart';
import 'package:nike__project/feture/presentation/screens/shoping_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static String _profileImagePath = 'assets/images/profile_image.png';
  static String _userName = 'EraaSoft';
  static String _userEmail = 'eraasoft@gmail.com';

  static String get profileImagePath => _profileImagePath;
  static String get userName => _userName;
  static String get userEmail => _userEmail;

  static set profileImagePath(String value) {
    _profileImagePath = value;
  }

  static set userName(String value) {
    _userName = value;
  }

  static set userEmail(String value) {
    _userEmail = value;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    FavoritePage(),
    CartPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      HomeScreen.userName = prefs.getString('userName') ?? 'EraaSoft';
      HomeScreen.userEmail =
          prefs.getString('userEmail') ?? 'eraasoft@gmail.com';
      HomeScreen.profileImagePath =
          prefs.getString('profileImage') ?? 'assets/images/profile_image.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(HomeScreen.userName),
              accountEmail: Text(HomeScreen.userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundImage: FileImage(File(HomeScreen.profileImagePath)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => setState(() => _selectedIndex = 0),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Favorites'),
              onTap: () => setState(() => _selectedIndex = 1),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Explore',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_bag),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewScreen()),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'shopping_bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert_rounded),
            label: 'add_alert_rounded',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'acount',
          ),
        ],
      ),
    );
  }
}
