import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jwt_web_manager/firebase_options.dart';
import 'package:jwt_web_manager/ui/custom/googlelogin/googlelogin.dart';
import 'package:jwt_web_manager/ui/custom/headerfooterlist/headerfooterlist.dart';
import 'package:jwt_web_manager/ui/screen/main/topbar/topbar.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:  DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late DatabaseReference _databaseReference;

  final TextEditingController _topbarTextEditingController = TextEditingController();


  final List<String> items = List.generate(3, (index) => 'Item $index');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JWT Web Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: TopBar(
            textEditingController: _topbarTextEditingController,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                  child: HeaderFooterList<String>(
                    headerWidget: Text(
                        "신청받은 토큰",
                    ),
                    footerWidget: null,
                    itemWidget: GoogleLoginButton(),
                    list: items,
                  )
              ),
              Expanded(
                  child: HeaderFooterList<String>(
                    headerWidget: Text("관리중인 토큰"),
                    footerWidget: null,
                    itemWidget: GoogleLoginButton(),
                    list: items,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}


