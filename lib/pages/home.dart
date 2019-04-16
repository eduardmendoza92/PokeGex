import 'package:flutter/material.dart';

import 'package:pokegex/models/state.dart';
import 'package:pokegex/state_widget.dart';
import 'package:pokegex/pages/login.dart';


var apiURL = "https://pokeapi.co/api/v2/";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    // Build the content depending on the state:
    appState = StateWidget.of(context).state;
    return _buildContent();
  }

  Widget _buildContent() {
    if (appState.isLoading) {
      return _buildLoadingIndicator();
    } else if (!appState.isLoading && appState.user == null) {
      return new LoginPage();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido'),
        ),
        body: Center(
          child: Text("Hola Mundo"),
        ),
      );
    }
  }

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }
}


