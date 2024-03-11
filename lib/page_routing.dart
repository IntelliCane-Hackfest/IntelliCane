import 'package:flutter/material.dart';
import 'package:intellicane/main_page/page.dart';
import 'package:intellicane/maps_page/page.dart';
import 'package:intellicane/message_page/page.dart';
import 'package:intellicane/login_page/page.dart';
import 'package:intellicane/database/auth_db.dart';

class MainPageApplication extends StatefulWidget {
  const MainPageApplication({Key? key}) : super(key: key);

  @override
  State<MainPageApplication> createState() => _MainPageApplicationState();
}

class _MainPageApplicationState extends State<MainPageApplication> {
  late Widget currentWidget;

  @override
  Widget build(BuildContext context) {
    return const MainPage();
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 4.0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(selectedAccount.id),
              accountEmail: Text(selectedAccount.role),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Maps'),
              onTap: () {
                // Handle drawer item tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainPageMaps(
                              latitude: 0,
                              longitude: 0,
                            )));
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Message'),
              onTap: () {
                // Handle drawer item tap
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MessagePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                // Handle drawer item tap
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainView()));
              },
            ),
          ],
        ),
      ),
      body: const MainHomePage(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          if (_currentIndex == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          } else if (_currentIndex == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainPageMaps(
                          latitude: 0,
                          longitude: 0,
                        )));
          } else if (_currentIndex == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MessagePage()));
          }
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.navigation),
          label: 'Navigasi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Pesan',
        ),
      ],
    );
  }
}