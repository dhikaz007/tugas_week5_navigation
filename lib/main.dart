import 'package:flutter/material.dart';

import 'feature/ui/contact/contact_list_page.dart';
import 'feature/ui/main/main_page.dart';
import 'feature/ui/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const SplashPage(),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
        '/Contact List': (_) => const ContactListPage(),
      },
    );
  }
}
