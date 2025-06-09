import 'package:flutter/material.dart';
import 'package:flutter_application_3/dragmodal.dart';
import 'package:flutter_application_3/pages/calendar_home_page.dart';
import 'package:flutter_application_3/pages/calendar_page.dart';
// import 'package:flutter_application_3/pages/calendar_home_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Calendar',
//       home: CalendarHomePage(),
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.grey[200], // 👉 background global
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Calendar Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: CalendarPage(),
    );
  }
}
