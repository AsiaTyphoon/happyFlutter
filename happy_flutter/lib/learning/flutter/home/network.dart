import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:happy_flutter/learning/dart/public_setting.dart';

class NetworkPage extends StatefulWidget {
  @override
  _NetworkPage createState() => _NetworkPage();
}

class _NetworkPage extends State<NetworkPage> {
  String name = 'Network Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        child: TextButton(
          child: Text('get'),
          onPressed: _getSettings,
        ),
      ),
    );
  }

  void _getSettings() async {
    var uri = Uri.parse('http://api.lytv.tv/public/settings');
    var response = await http.get(uri);
    print(response.body);
    Map data = json.decode(response.body);
    var setting = PublicSetting.fromJson(data);
    setState(() {
      name = setting.name;
    });
    print('setting.name: ${setting.name}');
    print('setting.appCopyright: ${setting.passwordErrorMsg}');
    print('setting.mweb.baseUrl: ${setting.mweb.baseUrl}');
    print('setting.api: ${setting.api}');

  }
}
