import 'package:flutter/material.dart';

import 'package:pokegex/models/state.dart';
import 'package:pokegex/state_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hola Mundo"),
    );
  }
}
