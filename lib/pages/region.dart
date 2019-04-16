import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokegex/models/namedapiresourcelist.dart';

class RegionPage extends StatefulWidget {
  final String named;

  RegionPage({Key key, @required this.named}) : super(key: key);

  @override
  _RegionPageState createState() => _RegionPageState();
}

class _RegionPageState extends State<RegionPage> {
  var apiURL = "https://pokeapi.co/api/v2/";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text('Region Kalos'),
          ),
          body: Center(child: Text("Region Kalos"),),
    );
  }

}