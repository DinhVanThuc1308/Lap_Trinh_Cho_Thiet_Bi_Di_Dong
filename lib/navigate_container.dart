import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

import 'pages/add_video_page.dart';
import 'pages/DiscoveryPage.dart';
import 'pages/homepage.dart';
import 'pages/NotePage.dart';
import 'pages/DonatePage.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class NavigateContainer extends StatefulWidget {
  const NavigateContainer({super.key});

  @override
  State<NavigateContainer> createState() => _NavigateContainerState();
}

class _NavigateContainerState extends State<NavigateContainer> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = [
    HomePage(),
    DiscoveryPage(),
    AddVideoPage(),
    NotePage(),
    DonatePage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onIcontap: _onItemTapped,
      ),
    );
  }
}
