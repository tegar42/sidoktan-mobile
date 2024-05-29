import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sidoktan/pages/components/chatbot_card.dart';
import 'package:sidoktan/pages/components/text_box.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

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
        backgroundColor: Colors.white, // Judul (header) halaman
      ),
      body: ListView(
        children: <Widget>[
          ChatBotBox(
            imagePath: 'assets/img/kattan.png',
            title: 'Ask Dok-Tan',
            subtitle: 'Dok-Tan: Your Virtual Plant Health Advisor',
            onTap: () {
              // Implement navigation or action
            },
          ),
          const TextBox(
            title: 'About Dok-Tan',
            subtitle:
                'Dok-Tan serves as your comprehensive and reliable virtual plant health advisor, providing expert insights, personalized recommendations, and detailed analyses to help you effectively monitor, diagnose, and manage your plants well-being, ensuring optimal growth and vitality for your botanical companions.',
          ),
        ],
      ),
    );
  }
}
