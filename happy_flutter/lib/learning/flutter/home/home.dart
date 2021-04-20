import 'package:flutter/material.dart';
import '../../dart/dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List _titleList = ['dialog'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.builder(
          itemCount: _titleList.length,
          itemExtent: 50,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${_titleList[index]}',
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.left,
              ),
              onTap: () {
                setState(() {
                  print('ssss');
                  route(_titleList[index]);
                });
              },
            );
          }),
    );
  }

  void route(String name) {
    if (name == 'dialog') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DialogPage();
      }));
    }
  }
}
