import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaemsi/auth/auth.dart';
import 'package:socialmediaemsi/auth/login_or_register.dart';
import 'package:socialmediaemsi/firebase_options.dart'; // Add this line to import DefaultFirebaseOptions
import 'package:socialmediaemsi/pages/home_page.dart';
import 'package:socialmediaemsi/pages/profile_page.dart';
import 'package:socialmediaemsi/pages/users_page.dart';
import 'package:socialmediaemsi/theme/dark_mode.dart';
import 'package:socialmediaemsi/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/homepage': (context) => HomePage(),
        '/profile_page': (context) => ProfilePage(),
        'users_page': (context) => const UsersPage(),
      },
    );
  }
}
