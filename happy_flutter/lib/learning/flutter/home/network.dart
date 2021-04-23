import 'package:flutter/material.dart';
import 'package:happy_flutter/learning/dart/mweb.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:happy_flutter/learning/dart/public_setting.dart';
import 'ColumnList.dart';

class NetworkPage extends StatefulWidget {

  NetworkPage({Key key}) : super(key: key);

  @override
  _NetworkPage createState() => _NetworkPage();
}

class _NetworkPage extends State<NetworkPage> {
  String name = 'Network Page';

  List<MWeb> mwebList;

  @override
  void initState() {
    super.initState();
    mwebList = [];
    _getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var item = mwebList[index];
          return ListTile(
            title: Text(
              item.key
            ),
            subtitle: Text(
              item.baseUrl
            ),
            onTap: (){
              _routeColumnPage(item);
            },
          );
        },
        itemCount: mwebList.length,
      ),
    );
  }

  void _getSettings() async {
    // var uri = Uri.parse('http://api.lytv.tv/public/settings');
    var uri = Uri.parse('http://apitest.baview.cn:39191/public/settings');

    var response = await http.get(uri);
    print(response.body);
    Map data = json.decode(response.body);
    var setting = PublicSetting.fromJson(data);
    setState(() {
      name = setting.name;
      mwebList = setting.api.toList();
    });
    print('setting.name: ${setting.name}');
    print('setting.appCopyright: ${setting.passwordErrorMsg}');
    print('setting.mweb.baseUrl: ${setting.mweb.baseUrl}');
    print('setting.api: ${setting.api}');
  }

  void _routeColumnPage(MWeb item) {
    if (item.key == 'cms') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ColumnListPage(baseUri: item.baseUrl);
      }));
    }
  }
}
