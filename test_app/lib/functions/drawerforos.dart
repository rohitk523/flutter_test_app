import 'package:flutter/material.dart';
import 'package:test_app/Pages/gamespage.dart';
import 'package:test_app/Pages/loginpage.dart';

class DrawerForOS extends StatelessWidget {
  const DrawerForOS({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Rohit Kale'),
            accountEmail: Text('rohitkale523@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://m.media-amazon.com/images/I/61fkO2lJNeL._SL1500_.jpg'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.gamepad),
            title: const Text('Games'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const GamesPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
