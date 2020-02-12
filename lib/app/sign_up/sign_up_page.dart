import 'package:flutter/material.dart';
import 'package:flutter_firebase_memo/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),),
      body: _layoutSignUpForm(context)
    );
  }

  Widget _layoutSignUpForm(context){
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
                    _signUpWithEmailAndPassword(context, email, password);

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signUpWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      final auth = Provider.of<FirebaseAuthService>(context, listen: false);
      await auth.signUpWithEmailAndPassword(email, password);
      // if you want to back to sign in window
      //  await auth.signOut();
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }
}
