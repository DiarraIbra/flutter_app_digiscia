import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF0047AB),
      unselectedItemColor: const Color(0xFF7B3F3B),
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/welcome');
            break;
          case 1:
            Navigator.pushNamed(context, '/experts_list');
            break;
          case 2:
            Navigator.pushNamed(context, '/contact');
            break;
          case 3:
            Navigator.pushNamed(context, '/chat');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt),
          label: 'Liste des experts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail),
          label: 'Contact',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
      ],
    );
  }
}
