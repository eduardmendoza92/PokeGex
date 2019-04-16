import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pokegex/models/namedapiresourcelist.dart';
import 'package:pokegex/models/state.dart';
import 'package:pokegex/pages/region.dart';
import 'package:pokegex/state_widget.dart';
import 'package:pokegex/pages/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var apiURL = "https://pokeapi.co/api/v2/";
  StateModel appState;

  NamedAPIResourceList _namedAPIResourceList;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(apiURL + 'region');
    var decodeJson = jsonDecode(res.body);
    _namedAPIResourceList = NamedAPIResourceList.fromJson(decodeJson);
    setState(() {});
  }

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
          body: _namedAPIResourceList == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : listRegionesContent(_namedAPIResourceList));
    }
  }

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }
}

ListView listRegionesContent(NamedAPIResourceList _namedAPIResourceList) {
  return new ListView.builder(
    padding: EdgeInsets.all(16.0),
    itemCount: _namedAPIResourceList.results.length,
    itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(2.0),
          child: RaisedButton(
            child:
                Text(_namedAPIResourceList.results[index].name.toUpperCase()),
            padding: const EdgeInsets.all(3.0),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegionPage()));
            },
            color: Colors.redAccent,
            textColor: Colors.white,
          ),
        ),
  );
}
