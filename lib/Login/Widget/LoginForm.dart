import 'package:flutter/material.dart';
import 'package:login_authentication/Home_page/home.dart';
import 'package:login_authentication/Signup/OurSignupScreen.dart';
import 'package:login_authentication/State/currentState.dart';
import 'package:login_authentication/Widget/CustomAppbar.dart';
import 'package:login_authentication/Widget/OurContainer.dart';
import 'package:provider/provider.dart';
enum LoginType{
  email,

}
class OurLoginForm extends StatefulWidget {

  @override
  State <StatefulWidget>createState() =>OurLoginformState();
}
class OurLoginformState extends State<OurLoginForm>{
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  void _loginUser({
    @required LoginType type,

    String email,String password,
    BuildContext context
  }) async{
   // CurrentState currentUser=Provider.of<CurrentState>(context,listen:false);
    CurrentState currentUser = Provider.of<CurrentState>(context, listen: false);
    try{
      String _returnString;
      switch(type){
        case LoginType.email:
          _returnString =await currentUser.logInUserwithEmail(email, password);
          break;

        default:
      }


      if(_returnString=="success"){
        //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>OurRoot()), (route) => false);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
      } else{
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(_returnString),
            duration: Duration(seconds: 10),
          ),

        );
      }
    }catch(e){
      print(e);
    }
  }
  OurAppBar customeAppBar(BuildContext context) {
    return OurAppBar(
      action: [

      ],

      centerTitle: true,
    );
  }
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;

    if (rememberMe) {
      // TODO: Here goes your functionality that remembers the user.
    } else {
      // TODO: Forget the user
    }
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
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
         Padding(padding: EdgeInsets.all(20),
         child:  TextFormField(controller: _emailController,decoration: InputDecoration(hintText: 'MOBILE NUMBER' ),),),
          SizedBox(height: 20.0,),
          Padding(padding: EdgeInsets.all(20),
            child: TextFormField(controller:_passwordController,decoration: InputDecoration(hintText: 'PASSWORD' ),obscureText: true,),),
          Row(
            children: [
    Checkbox(
    value: rememberMe,
    onChanged: _onRememberMeChanged
    ),
              Text("Remember me"),
              SizedBox(
                width: 85,
              ),
              Align(alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text("Forgot password"),
              ))
            ],
          ),
          SizedBox(height: 20.0,),
          RaisedButton(child: Padding(padding: EdgeInsets.symmetric(horizontal: 70,),
            child: Text('LOGIN',style: TextStyle(color: Colors.green ,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            ),
          ),
            onPressed: (){

              _loginUser(
                  type: LoginType.email,
                  email:_emailController.text,
                  password: _passwordController.text,
                  context:context);
            },
          ),
          FlatButton(child: Text("Not Yet Joined With Us!"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: (){

            },),
          RaisedButton(child: Padding(padding: EdgeInsets.symmetric(horizontal: 70,),
            child: Text('REGISTER',style: TextStyle(color: Colors.green ,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            ),
          ),
            onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder:
                  (context)=>OurSignUpScreen(),
              ),
              );
            },
          ),

        ],
      ),
    );
  }
}
