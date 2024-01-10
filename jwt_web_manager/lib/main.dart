import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JWT Web Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(

      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _emailView(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _passwordView(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _loginView(){

    final authChecker = false;

    String loginORregister = "Login";

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          print("email : ${_emailController.value.text}, pw : ${_passwordController.value.text}");

          // switch (loginORregister) {
          //   case 'login':
          //     print('Selected fruit is an apple');
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => LoginPage()), // LoginPage는 로그인 페이지 위젯이라고 가정합니다
          //     );
          //     break;
          //   case 'register':
          //     print('Selected fruit is a banana');
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(builder: (context) => RegistrationPage()), // RegistrationPage는 회원가입 페이지 위젯이라고 가정합니다
          //     );
          //     break;
          //   default:
          //     print('Unknown fruit');
          // }
        },
        child: Text(loginORregister),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)), // Set the minimum size for the button
        ),
      ),
    );
  }

  Widget loginRegisterBox(List<Widget> list){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('JWT Web Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            loginRegisterBox([
              _emailView(),
              _passwordView()
            ]),
            _loginView()
          ],
        ),
      ),
    );
  }
}
