import 'package:flutter/material.dart';

import 'screens/profileScreen.dart';
import 'screens/registerScreen.dart';
import 'screens/welcomeScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/mainScreen.dart';
import 'screens/iletisimScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/main': (context) => mainScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/profile': (context) => profileScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/iletisim': (context) => iletisimScreen(),
      },
      initialRoute: '/welcome',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
