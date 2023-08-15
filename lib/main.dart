import 'package:flutter/material.dart';
import 'package:trip2/screens/loading.dart';
import 'screens/home_page.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[310],
      ),
      routes:{
        '/':(context)=>const LoadingScreen(),
        'home':(context)=>const HomePage(),
        //   'book':(context)=>const BookTicket(),
      },
    );
  }
}


