// ignore_for_file: file_names

import 'dart:async';

import 'package:dataapp/HeadPhone.dart';
import 'package:flutter/material.dart';
import 'package:gps_connectivity/gps_connectivity.dart';

class GpsConnect extends StatefulWidget {
  const GpsConnect({ Key? key }) : super(key: key);

  @override
  State<GpsConnect> createState() => _GpsConnectState();
}

class _GpsConnectState extends State<GpsConnect> {

    late StreamSubscription subscription;
  late bool isGpsEnabled = false;
  @override
  void initState() {
    super.initState();
    subscription =
        GpsConnectivity().onGpsConnectivityChanged.listen((bool isGpsEnabled) {
      setState(() {
        this.isGpsEnabled = isGpsEnabled;
      });
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      GpsConnectivity().checkGpsConnectivity().then((bool isGpsEnabled) {
        setState(() {
          this.isGpsEnabled = isGpsEnabled;
        });
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }


  
  
  @override
  Widget build(BuildContext context) {
     String isOn = isGpsEnabled ? 'ON' : 'OFF';
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Text("Gps : $isOn"),
              
            ),
             Container(
            width:100 ,
            height: 50,
            child: ElevatedButton(
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HeadPhone()));
                },child: Text("Head Phone",style: TextStyle(fontSize: 20),)),
          )
          ],
        ),
      ),
    );
  }
}