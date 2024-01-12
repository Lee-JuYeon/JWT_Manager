import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jwt_web_manager/firebase_options.dart';


class GithubLoginButton extends StatelessWidget {

  Future<UserCredential> _signInWithGitHub() async {
    // Create a new provider
    GithubAuthProvider githubProvider = GithubAuthProvider();

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(githubProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(githubProvider);
  }

  Widget _CustomButton(){
    return GestureDetector(
      onTap: () async {
        await _signInWithGitHub();
      },
      child: Container(
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(),
        ),
        child: Image.asset(
          'assets/images/logo_github.png',
          width: 30.0,
          height: 30.0,
        ),
      ),
    );
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _CustomButton();
  }
}
