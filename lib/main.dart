import 'package:flutter/material.dart';
import 'package:flutter_firebase_memo/app/auth_widget.dart';
import 'package:flutter_firebase_memo/app/auth_widget_builder.dart';
import 'package:flutter_firebase_memo/app/home/home_page.dart';
import 'package:flutter_firebase_memo/app/sign_in/sign_in_page.dart';
import 'package:flutter_firebase_memo/app/sign_up/sign_up_page.dart';
import 'package:flutter_firebase_memo/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(create: (_) => FirebaseAuthService()),
      ],
      child: AuthWidgetBuilder(
        builder: (context, userSnapshot) {
          return MaterialApp(
            routes: <String, WidgetBuilder>{
              "/home" : (_) => HomePage(),
              "/sign_in" : (_) => SignInPage(),
              "/sign_up" : (_) => SignUpPage(),
            },
            theme: ThemeData(primarySwatch: Colors.indigo),
            home: AuthWidget(userSnapshot: userSnapshot),
          );
        },
      ),
    );
  }
}
