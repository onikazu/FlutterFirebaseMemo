import 'package:flutter/material.dart';
import 'package:flutter_firebase_memo/app/home/home_page.dart';
import 'package:flutter_firebase_memo/app/sign_in/sign_in_page.dart';
import 'package:flutter_firebase_memo/services/firebase_auth_service.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<User> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? HomePage() : SignInPage();
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
