
import 'package:flutter/material.dart';
import 'package:pokegex/pages/home.dart';
import 'package:pokegex/pages/login.dart';
import 'package:pokegex/pages/region.dart';

class PokeApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeGex',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomePage(),
        '/login' : (context) => LoginPage(),
        '/region' : (context) => RegionPage()
      },
    );
  }

}