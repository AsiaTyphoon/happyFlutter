import 'package:flutter/material.dart';

class UnloginDialog extends StatefulWidget {
  @override
  _UnloginDialog createState() => _UnloginDialog();


}

class _UnloginDialog extends State<UnloginDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text('未登录'),
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
