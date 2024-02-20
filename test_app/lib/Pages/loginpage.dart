import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

final _firebase = FirebaseAuth.instance;

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  var _enteredemail = '';
  var _enteredpassword = '';

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      try {
        // ignore: unused_local_variable
        final userCredential = await _firebase.signInWithEmailAndPassword(
          email: _enteredemail,
          password: _enteredpassword,
        );

        // If the login is successful, you can navigate to another page or perform other actions
        // For example:
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } catch (error) {
        // You can display an error message to the user, for example:
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login failed. Please check your credentials."),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'username',
                  fillColor: HexColor("#f0f3f1"),
                  contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    color: HexColor("#8d8d8d"),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: HexColor("#4f4f4f"),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredemail = value!;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'password',
                  fillColor: HexColor("#f0f3f1"),
                  contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    color: HexColor("#8d8d8d"),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: HexColor("#4f4f4f"),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredpassword = value!;
                },
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(onPressed: _submit, child: const Text('Login')),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not Registered ? '),
                  GestureDetector(
                    onTap: () => widget.onTap!(),
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
