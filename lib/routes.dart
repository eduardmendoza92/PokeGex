import 'package:flutter/material.dart';
import 'package:pokegex/pages/login.dart';


Map<String, WidgetBuilder> buildAppRoutes(){
  return {
    '/login' : (BuildContext context) => new LoginPage(),
  };
}