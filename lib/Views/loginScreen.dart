import 'package:ecommerce/Views/Home/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, top: 50),
          child: Text(
            'Welcome',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 31),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Text(
            'Please enter your data to continue',
            style: TextStyle(fontSize: 17),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 150, right: 12),
          child: TextField(
            obscureText: true,
            maxLength: 10,
            decoration: InputDecoration(
                helperText: 'helper text',
                border: OutlineInputBorder(
                  gapPadding: 7,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                labelText: 'Input here',
                suffixIcon: Icon(Icons.check_circle),
                suffixText: '@gmail.com',
                prefixIcon: Icon(Icons.mail),
                prefixText: '+855'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 50, right: 12),
          child: TextField(
            obscureText: true,
            maxLength: 10,
            decoration: InputDecoration(
                helperText: 'helper text',
                border: OutlineInputBorder(
                  gapPadding: 7,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                labelText: 'Input here',
                suffixIcon: Icon(Icons.check_circle),
                suffixText: '@gmail.com',
                prefixIcon: Icon(Icons.mail),
                prefixText: '+855'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  HomeScreen()),
                );
              },
              child: Text(
                'Log in',
                style:
                TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              )),
        )
      ],
    );
  }
}
