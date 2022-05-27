import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:dataapp/Cellular.dart';
import 'package:flutter/material.dart';

class WifiDetector extends StatefulWidget {
  const WifiDetector({Key? key}) : super(key: key);

  @override
  State<WifiDetector> createState() => _WifiDetectorState();
}

class _WifiDetectorState extends State<WifiDetector> {
  late StreamSubscription subscription;
  var message;

  @override
  void initState() {
    super.initState();
    data();
  }

  data() async {
    var result = await Connectivity().checkConnectivity();
    showConnectivitySnackBar(result);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      body: Column(
        children: [
          // Text(message.toString()) ,
          FutureBuilder(
              future: data(),
              builder: (context, projectSnap) {
                return Text(message);
              }),
               Container(
            width:100 ,
            height: 50,
            child: ElevatedButton(
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileDetector()));
                },child: Text("Mobile data",style: TextStyle(fontSize: 20),)),
          )
          // ElevatedButton(
          //     onPressed: () async {
          //       final result = await Connectivity().checkConnectivity();
          //       showConnectivitySnackBar(result);
          //     },
          //  child: Text("wifi detector"))
        ],
      ),
      )
    );
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result == ConnectivityResult.wifi;
    print(hasInternet);
    message = hasInternet
        ? 'SuccessFully Wife Connected'
        : 'Check Wifi  ';
    final color = hasInternet ? Colors.green : Colors.red;
    setState(() {
      message = message;
    });
    print(message);
  }
}
