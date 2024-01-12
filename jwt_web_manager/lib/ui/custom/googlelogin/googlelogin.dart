import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jwt_web_manager/firebase_options.dart';


class GoogleLoginButton extends StatelessWidget {

  Future<UserCredential> _signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    // 사용자로부터 권한을 얻기 위해 앱이 Google API에 어떤 유형의 접근을 요청할지를 지정
    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    //  Google 로그인 시 추가적인 맞춤 매개변수(custom parameters)를 설정
    googleProvider.setCustomParameters({
      'login_hint': 'test@gmail.com'
    });

    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }

  Widget _CustomButton(){
    return GestureDetector(
      onTap: () async {
        await _signInWithGoogle();
      },
      child: Container(
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(),
        ),
        child: Image.asset(
          'assets/images/logo_google.png',
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
