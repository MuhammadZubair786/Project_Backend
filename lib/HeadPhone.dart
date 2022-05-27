import 'package:dataapp/Microphone.dart';
import 'package:flutter/material.dart';
import 'package:headset_connection_event/headset_event.dart';

class HeadPhone extends StatefulWidget {
  const HeadPhone({ Key? key }) : super(key: key);

  @override
  State<HeadPhone> createState() => _HeadPhoneState();
}

class _HeadPhoneState extends State<HeadPhone> {
   final _headsetPlugin = HeadsetEvent();
  HeadsetState? _headsetState;

  @override
  void initState() {
    super.initState();

    /// if headset is plugged
    _headsetPlugin.getCurrentState.then((_val) {
      setState(() {
        _headsetState = _val;
      });
    });

    /// Detect the moment headset is plugged or unplugged
    _headsetPlugin.setListener((_val) {
      setState(() {
        _headsetState = _val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          child: Column(
            children: [
              Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.headset,
                    color: this._headsetState == HeadsetState.CONNECT ? Colors.green : Colors.red,
                  ),
                  Text('State : $_headsetState\n'),
                ],
              ),
            ),
             Container(
            width:100 ,
            height: 50,
            child: ElevatedButton(
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Microphone()));
                },child: Text("Micro Phone",style: TextStyle(fontSize: 20),)),
          )
            ],
          ),
        ),
      ),
      
    );
  }
}