// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'screens/choose_location.dart';
import 'screens/loading.dart';
import 'screens/home.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
