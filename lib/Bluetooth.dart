import 'package:dataapp/Gps_Connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class Bluetooth extends StatefulWidget {
  const Bluetooth({ Key? key }) : super(key: key);

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

        body: Column(
          children: [
            Container(
              child: StreamBuilder<BluetoothState>(
                  stream: FlutterBluePlus.instance.state,
                  initialData: BluetoothState.unknown,
                  builder: (c, snapshot) {
                    final state = snapshot.data;
                    if (state == BluetoothState.on) {
                      return Text("Bluethooth On");
                    }
                    return Text("Bluethooth Off");
                  }),
            ),
             Container(
              width:100 ,
              height: 50,
              child: ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GpsConnect()));
                  },child: Text("Gps Connect",style: TextStyle(fontSize: 20),)),
            )
          ],
        ),
      ),
    );
  }
}