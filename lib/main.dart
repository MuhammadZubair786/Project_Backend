// ignore_for_file: prefer_const_constructors

import 'package:dataapp/BatteryLevel.dart';
import 'package:dataapp/Bluetooth.dart';
import 'package:dataapp/Cellular.dart';
import 'package:dataapp/Gps_Connect.dart';
import 'package:dataapp/HeadPhone.dart';
import 'package:dataapp/Microphone.dart';
import 'package:dataapp/New.dart';
import 'package:dataapp/Wifi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home:Scaffold(
        body: Container(
          child: NewDart(),
        ),
        // body:NewDart()
        // body: SafeArea(child: WifiDetector()),
        // body: SafeArea(child: MobileDetector()),
        // body: SafeArea(child: Bluetooth()),
        // body: SafeArea(child: GpsConnect()),
        // body: SafeArea(child: MyHomePage()),
        // body: SafeArea(child: HeadPhone()),
        // body: SafeArea(child: Microphone()),


      )
    );
  }
}

