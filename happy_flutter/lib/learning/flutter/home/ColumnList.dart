import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:happy_flutter/learning/flutter/home/ContentList.dart';
import 'package:http/http.dart' as http;
import 'package:happy_flutter/learning/dart/column.dart';

class ColumnListPage extends StatefulWidget {
  String baseUri;
  ColumnListPage({Key key, @required this.baseUri}) : super(key: key);

  @override
  _ColumnListPage createState() => _ColumnListPage();
}

class _ColumnListPage extends State<ColumnListPage> {
  List<CmsColumn> columnList;
  String _uri;

  @override
  void initState() {
    super.initState();
    columnList = [];
    var uri = Uri.parse('${widget.baseUri}/public/v2/columns');
    _getPageData(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content List Page'),
      ),
      body: ListView.builder(
        itemCount: columnList.length,
        itemBuilder: (context, index) {
          var column = columnList[index];
          return ListTile(
            title: Text(
              column.name,
            ),
            subtitle: Text(column.key),
            onTap: () {
              _routeContentPage(column);
            },
          );
        },
      ),
    );
  }

  void _getPageData(Uri uri) async {
    print('column list uri: ${uri}');
    var response = await http.get(uri);
    print(response.body.toString());
    List list = json.decode(response.body);
    setState(() {
      columnList = list.map((value) {
        return CmsColumn.fromJson(value);
      }).toList();
    });
  }

  void _routeContentPage(CmsColumn column) {
    if (column.key == 'list') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ContentListPage(baseUri: widget.baseUri, columnId: column.id);
      }));
    }
  }
}
