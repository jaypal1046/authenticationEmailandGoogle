



import 'package:flutter/material.dart';
import 'package:login_authentication/Home_page/home.dart';
import 'package:login_authentication/Login/Login_page.dart';
import 'package:login_authentication/SplaceScreen.dart';
import 'package:login_authentication/State/currentState.dart';
import 'package:provider/provider.dart';
enum AuthState{
  unknown,
  notLoggedIn,
  isLoggedIn,
  inGroup,
}
class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthState _authState=AuthState.unknown;


  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    //getState,checkState,set AuthSate base on state
    CurrentState _currentUse=Provider.of<CurrentState>(context,listen: false);
   String returnString=await _currentUse.OnStartup();


   if(returnString=="success"){
      if(_currentUse.getCurrentUser.uid ==null){
        setState(() {
          _authState = AuthState.notLoggedIn;
        });
      }else {
        setState(() {
          _authState = AuthState.isLoggedIn;
        });
      }

    }else{
      setState(() {
        _authState = AuthState.notLoggedIn;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch(_authState){
      case AuthState.unknown:
        retVal=OurSplaceScreen();
        break;
      case AuthState.notLoggedIn:
        retVal=OurLoginScreen();
        break;
      case AuthState.isLoggedIn:
        retVal= Homepage();
        break;

      default:
    }
    return retVal;
  }
}
