import 'package:flutter/material.dart';
import 'package:prova_flutter/app/pages/auth/login_page.dart';
import 'package:prova_flutter/app/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova Flutter',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(33, 82, 102, 1),
      hintColor: const Color.fromRGBO(44, 139, 135, 0.9),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(
              title: 'Prova Flutter',
            ),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
