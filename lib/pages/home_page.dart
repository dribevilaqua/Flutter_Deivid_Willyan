import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/PageViews/one_page.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();} 

  class _HomePageState extends State<HomePage> {  
    PageController _pageController = PageController();

  int indexBottomNavegigationBar = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('AppBar', style: TextStyle(color: Colors.white),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green),
              child: UserAccountsDrawerHeader(decoration: BoxDecoration(color: Colors.green), 
              accountName: Text('Andriele'), accountEmail: Text('andriele@example.com'),
              currentAccountPicture: CircleAvatar(backgroundColor: Colors.greenAccent, child: Text('A'),))
              ),
              ListTile(
                leading: Icon (Icons.home),
                title: Text('Home'),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  _pageController.jumpToPage(0);
                  Navigator.pop(context);
                    setState(() {
                  indexBottomNavegigationBar = 0;
            });
                },
              ),
              ListTile(
                leading: Icon (Icons.person),
                title: Text('Profile'),
                trailing: Icon(Icons.arrow_forward),
               onTap: (){
                  _pageController.jumpToPage(1);
                  Navigator.pop(context);
                    setState(() {
                 indexBottomNavegigationBar = 1;
            });
                },
              ),
              ListTile(
                leading: Icon (Icons.settings),
                title: Text('Settings'),
                trailing: Icon(Icons.arrow_forward),
               onTap: (){
                  _pageController.jumpToPage(2);
                  Navigator.pop(context);
                    setState(() {
                  indexBottomNavegigationBar = 2;
            });
                },
              ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
        OnePage(),
        Container(color: Colors.red),
        Container(color: Colors.yellow),
      ],
      ),
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavegigationBar,  
          onTap: (int index){
            setState(() {
              indexBottomNavegigationBar = index;
            });
            _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
          },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],) ,
      );
  }
}