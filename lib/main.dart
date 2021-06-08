import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_authentication/SplaceScreen.dart';
import 'package:login_authentication/State/currentState.dart';
import 'package:login_authentication/root.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:  (context)=>CurrentState (),
    child: FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
       builder: (context,AsyncSnapshot snapshot){
        if(snapshot.connectionState==ConnectionState.waiting
        ){
          return MaterialApp(home: OurSplaceScreen(),);
        }else{
          return MaterialApp(home: OurRoot(),);
        }
       },
    )
    );
  }
}
