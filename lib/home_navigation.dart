import 'package:flutter/material.dart';

import 'favorites.dart';
import 'app_list.dart';

class HomeNavigation extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomeNavigationState();
  }
}

class HomeNavigationState extends State<HomeNavigation> {
  int _currentIndex = 0;
  List<Widget> _children = [
    AppList(),
    Favorites(),
    Favorites(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Apps List'),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.lightBlue,
            primaryColor: Colors.white,
            textTheme: Theme.of(context).textTheme.copyWith(
                  caption: new TextStyle(color: Colors.white),
                ),
          ),
          child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: onTabTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  title: Text('Favs'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ]),
        ),
      ),
    );
  }
}
