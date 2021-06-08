import 'package:flutter/material.dart';
import 'package:login_authentication/Home/Chat.dart';
import 'package:login_authentication/Home/group.dart';
import 'package:login_authentication/Home/homepage.dart';
import 'package:login_authentication/Home/notification.dart';
import 'package:login_authentication/Home/serach.dart';
import 'package:login_authentication/State/currentState.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController pageController;
  int _page = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  void onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  static List<Widget> _widgetOption = <Widget>[
    Container(child: OurHomePage()),
    Container(
      child: OurChatScreen(),
    ),
    Container(
      child: OurSreachScreen(),
    ),
    Container(
      child: OurGroupScreen(),
    ),
    Container(
      child: OurNotificationScreen(),
    ),
  ];
Text a()

{
  Text t=Text("jaypal");
  t.style.color.green;
  return t;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption.elementAt(_page),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "home" ,
              activeIcon: Icon(Icons.home,color: Colors.green,),

              icon:
                  Icon(Icons.home,
                    color: Colors.grey,

                  )),
          BottomNavigationBarItem(
              label: "Chat",
              activeIcon: Icon(Icons.chat,color: Colors.green,),
              icon: Icon(Icons.chat,
                color: Colors.grey,)),
          BottomNavigationBarItem(
              label: "Search",
              activeIcon: Icon(Icons.search_rounded,color: Colors.green,),
              icon: Icon(Icons.search_rounded,
                color: Colors.grey,)),
          BottomNavigationBarItem(
              label: "group",
            activeIcon: Icon(Icons.group,color: Colors.green,),
              icon:
              Icon(Icons.group,
                    color: Colors.grey,),
          ),
          BottomNavigationBarItem(
              label: "Natification",
              activeIcon: Icon(Icons.notifications_active,color: Colors.green,),
              icon:Icon(Icons.notifications_active,
                color: Colors.grey,)),
        ],
      ),
    );
  }
}
