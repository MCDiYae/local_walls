import 'package:flutter/material.dart';

import '../widgets/categories_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/trend_walls.dart';
import 'favorite_page.dart';
import 'privacy_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // List of pages to display
  final List<Widget> _pages = [
    const HomeContent(),
    const FavoritePage(),
    const PrivacyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favoris',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.privacy_tip),
            label: 'Privacy', // Add this item
          ),
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MySearchBar(),
            SizedBox(height: 20),
            CategoryBar(),
            SizedBox(height: 20),
            TrendWallsGrid(),
          ],
        ),
      ),
    );
  }
}
