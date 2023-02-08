import 'package:email_checker/src/features/email_check/presentation/screens/email_check_screen.dart';

import 'package:flutter/material.dart';

import 'src/features/phone_number_check/presentation/screens/phone_number_check_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Valid8',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.email)),
                  Tab(icon: Icon(Icons.phone)),
                ],
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EmailCheckScreen(),
            PhoneCheckScreen(),
          ],
        ),
      ),
    );
  }
}
