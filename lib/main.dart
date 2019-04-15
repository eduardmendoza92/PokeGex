import 'package:flutter/material.dart';
import 'package:pokegex/pages/login.dart';
import 'package:pokegex/routes.dart';
import 'package:pokegex/theme.dart';

void main() => runApp(AppMain());

class AppMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AppMainState();

}

class _AppMainState extends State<AppMain>{
  Widget rootPage = LoginPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke Gex App',
      home: rootPage,
      routes: buildAppRoutes(),
      theme: buildAppTheme(),
      debugShowCheckedModeBanner: false,
    );
  }


}