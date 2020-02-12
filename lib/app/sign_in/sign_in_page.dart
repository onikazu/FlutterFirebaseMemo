import 'package:flutter/material.dart';
import 'package:flutter_firebase_memo/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),),
      body: _layoutSignInForm(context)
    );
  }

  Widget _layoutSignInForm(context){
    return new Center(
      child: new Form(
        child: new SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 24.0),
              new TextFormField(
                controller: emailInputController,
                decoration: const InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 24.0),
              new TextFormField(
                controller: passwordInputController,
                decoration: new InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              new Center(
                child: new RaisedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    var email = emailInputController.text;
                    email = email.trim();
                    var password = passwordInputController.text;
                    _signInWithEmailAndPassword(context, email, password);
                  },
                ),
              ),
              SizedBox(height: 20.0,),
              new Center(
                child: new RaisedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/sign_up");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      final auth = Provider.of<FirebaseAuthService>(context, listen: false);
      final user = await auth.signInWithEmailAndPassword(email, password);
      print("uid: ${user.uid}");
    } catch (e) {
      print(e);
    }
  }
}
