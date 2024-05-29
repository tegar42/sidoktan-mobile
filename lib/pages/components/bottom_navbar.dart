import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // shape: const CircularNotchedRectangle(),
      // notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(icon: Icons.home, label: 'Home', index: 0),
          _buildNavItem(icon: Icons.chat, label: 'ChatBot', index: 1),
          const SizedBox(width: 10), // Space untuk middle button
          _buildNavItem(icon: Icons.link, label: 'IoT Link', index: 2),
          _buildNavItem(icon: Icons.person_rounded, label: 'Setting', index: 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      {required IconData icon, required String label, required int index}) {
    return InkWell(
      onTap: () => onItemTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon,
                color: selectedIndex == index
                    ? const Color(0xFF5B5CDB)
                    : Colors.grey),
            Text(
              label,
              style: TextStyle(
                color: selectedIndex == index
                    ? const Color(0xFF5B5CDB)
                    : Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
