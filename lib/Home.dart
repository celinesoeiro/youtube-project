import 'package:flutter/material.dart';
import 'package:youtube_project/CustomSearchDelegate.dart';
import 'package:youtube_project/screens/Initial.dart';
import 'package:youtube_project/screens/Library.dart';
import 'package:youtube_project/screens/Subscriptions.dart';
import 'package:youtube_project/screens/Whatshot.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _actualIndex = 0;
  String _result = "";
  
  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      Initial(_result),
      Whatshot(),
      Subscriptions(),
      Library(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          'images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.videocam), 
          //   onPressed: (){print('videocam');},
          // ),
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: () async {
              String res = await showSearch(
                context: context, 
                delegate: CustomSearchDelegate()
              );
              setState(() {
                _result = res;
              });
              print(res);
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.account_circle), 
          //   onPressed: (){print('conta');},
          // )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: screens[_actualIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _actualIndex,
        onTap: (index){
          setState(() {
            _actualIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text('Inicio'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Em alta'),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            title: Text('Inscrições'),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            title: Text('Biblioteca'),
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}