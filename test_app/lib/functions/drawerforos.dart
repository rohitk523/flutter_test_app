import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/Pages/chatPage.dart';

class DrawerForOS extends StatelessWidget {
  const DrawerForOS({super.key});

  @override
  Widget build(BuildContext context) {
    String? username = FirebaseAuth.instance.currentUser?.email?.split('@')[0];
    final user = FirebaseAuth.instance.currentUser?.email;
    // Move the username initialization inside the build method

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
                username ?? 'Unknown'), // Handle case when username is null
            accountEmail: Text(user ?? 'Unknown'),
            currentAccountPicture: const CircleAvatar(
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
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('help'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
