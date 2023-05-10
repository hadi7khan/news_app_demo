import 'package:assignment/drawer.dart';
import 'package:assignment/src/features/news/presentation/view/bookmark_screen.dart';
import 'package:assignment/src/features/news/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final String? name;
  const TabsScreen({Key? key, this.name}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    BookmarkScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Text(
          widget.name ==null ? "Hey" : widget.name!,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
       drawer: const DrawerWidget(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey.shade500,
        // selectedItemColor: Colors.blue,
        onTap: _selectPage,
        // selectedIconTheme: Theme.of(context).iconTheme,
        iconSize: 26,
        currentIndex: _selectedPageIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 15.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'HomePage',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
            ),
            label: 'Bookmarked',
          ),
        ],
      ),
    );
  }
}
