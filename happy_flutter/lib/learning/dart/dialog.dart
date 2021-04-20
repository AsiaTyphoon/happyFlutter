import 'package:flutter/material.dart';

enum DialogType {
  system,
  custom,
  alert
}

class DialogPage extends StatefulWidget {
  @override
  _DialogPage createState() => _DialogPage();
}

class _DialogPage extends State<DialogPage> {

  List<DialogType> _typeList;

  @override
  void initState() {
    _typeList = [DialogType.system, DialogType.custom, DialogType.alert];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Page'),
      ),
      body: Column(
        children: _typeList.map((value) {
          return TextButton(
              onPressed: () {
                setState(() {
                  if (value == DialogType.system) {
                    alertDialog();
                  }
                });
              },
              child: Text('${value}'));
        }).toList(),
      ),
    );
  }

  void alertDialog() {
    print('弹框显示');
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示信息！'),
            content: Text('您确定要删除吗？'),
            actions: [
              TextButton(
                  onPressed: () {
                    print("done");
                    Navigator.pop(context); // dismiss alert
                  },
                  child: Text('确定')),
              TextButton(
                  onPressed: () {
                    print("cancel");
                    Navigator.pop(context); // dismiss alert
                  },
                  child: Text('取消'))
            ],
          );
        });
  }
}
