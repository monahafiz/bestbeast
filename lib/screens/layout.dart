
import 'package:flutter/material.dart';
import 'package:wigzawy/screens/list_veiw.dart';
import 'package:wigzawy/screens/login.dart';

class layout   extends StatefulWidget {
  const layout({ Key? key }) : super(key: key);
static const  String route='/layout';

  @override
  _State createState() => _State();
}

class _State extends State<layout> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
  order(),
    Text(
      'Index 1: balance',
      style: optionStyle,
    ),
    Text(
      'Index 6: custemized',
      style: optionStyle,
    ),
    Text(
      'Index 2: delete',
      style: optionStyle,
    ),
    Text(
      'Index 3: my profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
backgroundColor: Colors.cyan,
        items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
            icon: Icon(Icons.label_important_outline_rounded),backgroundColor: Colors.cyan,
            label: 'orders',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'balance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'custemized',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'delete',
          ),
                    BottomNavigationBarItem(
            icon: Icon(Icons.dangerous_outlined),
            label: 'my profile',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),

);
  }
}