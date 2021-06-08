import 'package:flutter/material.dart';

class OurChatScreen extends StatefulWidget {
  @override
  _OurChatScreenState createState() => _OurChatScreenState();
}

class _OurChatScreenState extends State<OurChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/Logo.png",
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 190),
              child:  Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: Image.asset("assets/Menu (1).png"),
                ),
              ),
            )
          ],
        ),

        Padding(padding: EdgeInsets.only(left: 30,right: 20),
        child: Divider(
          color: Colors.grey,
        ),),
        Align(
          alignment: Alignment.center,
          child: Text("No Messages To Show!"),
        ),
     FloatingActionButton(
    onPressed: ()=>{

    },
    tooltip: 'Send message',
    child: Icon(Icons.add),
    ),
      ],
    );

  }
}
