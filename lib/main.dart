import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokegex/app.dart';
import 'package:pokegex/theme.dart';


import 'package:pokegex/state_widget.dart';

void main(){
  StateWidget stateWidget = new StateWidget(child:new PokeApp());
  runApp(stateWidget);
}