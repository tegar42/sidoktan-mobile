import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sidoktan/pages/chatbot_page.dart';
import 'package:sidoktan/pages/components/bottom_navbar.dart';
import 'package:sidoktan/pages/settings_page.dart';
import 'package:sidoktan/pages/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // signOut
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomeContentPage(),
    const ChatBotPage(),
    const Center(child: Text('IoT Link')),
    const SettingsPage(),
  ];

  // Handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: SizedBox(
        width: 60, // Adjust the width
        height: 60, // Adjust the height
        child: FloatingActionButton(
          onPressed: () {
            // Define your action here
          },
          backgroundColor: const Color(0xFF5B5CDB),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0),
              side: const BorderSide(color: Color(0xFF8889F0), width: 2.0)),
          child: const Icon(
            Icons.center_focus_strong,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
