
import 'package:flutter/material.dart';
import 'package:fyp/Screens/OptimalPath/MapSearch/MapSearch.dart';
import 'package:fyp/Screens/TODO/mainTODO.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MainTODO(),
    MapSearch(),
    Text('Profile Screen'),
    Text('Profile Screen'),

  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(

              Icons.list_alt,
                color: Colors.green
            ),
            label:'',

          ),
          BottomNavigationBarItem(

            icon: Icon(
              Icons.map,
              color: Colors.green,
            ),
            label:""
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
                color: Colors.green
            ),
            label:""
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
                color: Colors.green
            ),
            label:"",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}