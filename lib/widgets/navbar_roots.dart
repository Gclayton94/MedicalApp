import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalwebgex/screens/home_screen.dart';
import 'package:medicalwebgex/screens/messages_screen.dart';
import 'package:medicalwebgex/screens/schedule_screen.dart';
import 'package:medicalwebgex/screens/settings_screen.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    //Home screen
    HomeScreen(),
    //Messages screen
    MessagesScreen(),
    //Schedule Screen
    ScheduleScreen(),
    //Setting Screen
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF5896E8),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          selectedIconTheme: IconThemeData(
            color: Color(0xFF5896E8),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black26,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Inicio",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text_fill),
              label: "Mensagens",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Agenda",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Configurações",
            ),
          ],
        ),
      ),
    );
  }
}
