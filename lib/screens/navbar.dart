import 'package:ecommerce_app/screens/categorypage.dart';
import 'package:ecommerce_app/screens/productPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}
class _NavBarState extends State<NavBar> {
  int _selectedIndex=0;
  
  List pages=[
ProductPage(),
CategoryPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
         currentIndex: _selectedIndex, 
  onTap: _onItemTapped, 
  selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 40),
  selectedItemColor: Colors.amberAccent,
  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: <BottomNavigationBarItem>[
 
 BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'home',
                 //New

      ),
       BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: 'category',
      ),
      ]),

    );

    
  }
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });}
}