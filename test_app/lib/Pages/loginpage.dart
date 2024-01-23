import 'package:flutter/material.dart';
import 'package:test_app/Pages/homebottomnavigationbar.dart';
import 'package:test_app/components/dialogcomponent.dart';
import 'package:test_app/components/mytextfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Old School',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
                controller: _usernameController,
                hintText: 'username',
                obscureText: false,
                prefixIcon: Icon(Icons.person)),
            const SizedBox(height: 16.0),
            MyTextField(
                controller: _passwordController,
                hintText: 'password',
                obscureText: true,
                prefixIcon: Icon(Icons.password)),
            const SizedBox(height: 32.0),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                // Handle login logic here
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Perform authentication, e.g., validate username and password
                if (username == 'user' && password == 'pass') {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Login'),
                      content: Text('Successful'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeBottomNavigationBar()));
                } else {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Login'),
                      content: Text('Failed'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not Registered ? '),
                Text(
                  'Register Now',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
