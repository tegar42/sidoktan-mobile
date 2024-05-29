import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sidoktan/pages/components/setting_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "siDokTan",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'DMSerifDisplay',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          SettingItem(
            icon: Icons.person_outlined,
            title: 'Account Information',
            subtitle:
                'Set your account like your username, phone number, and email address',
            onTap: () {
              // Implement navigation or action
            },
          ),
          SettingItem(
            icon: Icons.logout_sharp,
            title: 'Logout',
            subtitle: 'Log out of your account',
            onTap: signOut,
          ),
        ],
      ),
    );
  }
}
