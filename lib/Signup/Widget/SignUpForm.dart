import 'package:flutter/material.dart';
import 'package:login_authentication/Login/Login_page.dart';
import 'package:login_authentication/State/currentState.dart';
import 'package:login_authentication/Widget/OurContainer.dart';
import 'package:provider/provider.dart';
class OurSignupForm extends StatefulWidget {
  @override
  _OurSignupFormState createState() => _OurSignupFormState();
}

class _OurSignupFormState extends State<OurSignupForm> {
  TextEditingController _fullNameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _conformPasswordController=TextEditingController();
  bool obstext=true;
  Future _signpUser (String email,String password,BuildContext context,String fullName)async{
    CurrentState _currentState=Provider.of<CurrentState>(context,listen: false);
    try{
      String returnString=await _currentState.signUpUser(email, password,fullName);
      if(returnString=="success"){
        Navigator.pop(context);
      }else{
        Scaffold.of(context).showSnackBar(
            SnackBar(content:Text(returnString)
              ,duration:  Duration(seconds: 2),
            ));

      }
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 10,top:10,
          ),
            child:  Align(
              alignment: Alignment.topLeft,
              child: Image.asset("assets/Logo.png",height: 100,width: 100,),
            ),),
          Padding(padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 8.0,
          ),
            child: Text("GET STARTED WITH US!",style: TextStyle(color: Colors.green,fontSize: 25.0,fontWeight: FontWeight.bold  ),),

          ),
          Padding(padding: EdgeInsets.only(left: 20,right: 20,bottom: 5 ),
            child:  TextFormField(controller: _fullNameController,decoration: InputDecoration(hintText: 'Full Name'),)),
          Padding(padding: EdgeInsets.only(left: 20,right: 20,bottom: 5 ),
            child:  TextFormField(controller: _emailController,decoration: InputDecoration(hintText: 'MOBILE NUMBER' ),),),
          Padding(padding: EdgeInsets.only(left: 20,right: 20,bottom: 5 ),
            child:    TextFormField(controller: _conformPasswordController,obscureText: true,
              decoration: InputDecoration(hintText: 'Confirm Password'),),),
          Padding(padding: EdgeInsets.only(left: 20,right: 20,bottom: 5 ),
            child: TextFormField(controller: _conformPasswordController,obscureText: true,decoration:
            InputDecoration(hintText: 'Confirm Password'),),),


        SizedBox(height: 20,),

          RaisedButton(child: Padding(padding: EdgeInsets.symmetric(horizontal: 60,),
            child: Text('SignUp',style: TextStyle(color: Colors.green ,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            ),
          ),
            onPressed: (){
              if(_passwordController.text==_conformPasswordController.text){
                _signpUser(_emailController.text,_passwordController.text,context,_fullNameController.text);

              }
            },
          ),
          SizedBox(height: 25,),
          FlatButton(child: Text("Having an account then Login with Us!"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: (){

            },),
          RaisedButton(child: Padding(padding: EdgeInsets.symmetric(horizontal: 70,),
            child: Text('LOGIN',style: TextStyle(color: Colors.green ,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            ),
          ),
            onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder:
                  (context)=>OurLoginScreen(),
              ),
              );
            },
          ),
        ],

      ),
    );
  }
}

