import 'package:dataapp/Wifi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NewDart extends StatefulWidget {
  const NewDart({Key? key}) : super(key: key);

  @override
  State<NewDart> createState() => _NewDartState();
}

class _NewDartState extends State<NewDart> {
  @override
  FlutterTts flutterTts = FlutterTts();
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;

  bool showButton = false;

  void initState() {
    super.initState();
    controller1 = TextEditingController();

    controller1.addListener(() {
      final showButton = controller1.text.isNotEmpty;

      if (controller1.text.length == 4 && controller1.text == "1234") {
        setState(() => this.showButton = true);
       
      } 
     
       
    
      else {
        setState(() => this.showButton = false);
        
        

      }
    });
  }

  

  speak1() async {
    await flutterTts.speak("enter correct code");
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.4);
    print("ok");
  }

  speak() async {
    await flutterTts.speak("1\n\n2\n\n3\n\n4 ");
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.4);
    print("ok");
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: ElevatedButton(onPressed: speak, child: Text("Listen Otp")),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 40),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey)),
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                  controller: controller1,
                ),
              ),
            ],
          ),
        ),
        Container(
          width:100 ,
          height: 50,
          child: ElevatedButton(
              onPressed: showButton ? () {} : null, child: Text("Submit",style: TextStyle(fontSize: 20),)),
        ),
         Container(
          width:100 ,
          height: 50,
          child: ElevatedButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WifiDetector()));
              },child: Text("Wifi Dectector",style: TextStyle(fontSize: 20),)),
        ),
      ],
    );
  }
}
