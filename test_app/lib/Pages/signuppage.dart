import 'package:flutter/material.dart';
import 'package:test_app/Pages/homebottomnavigationbar.dart';
import 'package:test_app/components/mytextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

final _firebase = FirebaseAuth.instance;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _form = GlobalKey<FormState>();
  var _enteredusername = '';
  var _enteredpassword = '';

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      final usercred = await _firebase.createUserWithEmailAndPassword(
          email: _enteredusername, password: _enteredpassword);
      print(usercred);
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
                  if (value == null || value.trim().isEmpty) ;
                },
                onSaved: (value) {
                  _enteredusername = value!;
                },
              ),
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
                  if (value == null || value.trim().isEmpty) ;
                },
                onSaved: (value) {
                  _enteredpassword = value!;
                },
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(child: const Text('SignUp'), onPressed: _submit),
              const SizedBox(
                height: 16,
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
      ),
    );
  }
}
