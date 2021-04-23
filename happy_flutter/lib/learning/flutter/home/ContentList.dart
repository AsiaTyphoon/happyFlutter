import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:happy_flutter/learning/dart/content.dart';
import 'package:hexcolor/hexcolor.dart';

class ContentListPage extends StatefulWidget {
  String baseUri;
  int columnId;
  ContentListPage({Key key, @required this.baseUri, @required this.columnId})
      : super(key: key);

  @override
  _ContentListPage createState() => _ContentListPage();
}

class _ContentListPage extends State<ContentListPage> {
  List<CmsContent> contentList;

  @override
  void initState() {
    super.initState();
    contentList = [];
    var uri = Uri.parse(
        '${widget.baseUri}/public/columns/${widget.columnId}/contents?page=1&size=20');
    _getPageData(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content List Page'),
      ),
      body: ListView.builder(
        itemCount: contentList.length,
        itemBuilder: (context, index) {
          var content = contentList[index];
          if (content.listTtemMode == 0) {
            return _getItemListModeNo(content);
          } else if (content.listTtemMode == 1) {
            return _getItemListModeOne(content);
          } else if (content.listTtemMode == 2) {
            return _getItemListModeBig(content);
          } else {
            return _getItemListModeMore(content);
          }
        },
      ),
    );
  }

  void _getPageData(Uri uri) async {
    print('content list uri: ${uri}');

    var response = await http.get(uri);
    Map map = json.decode(response.body);
    List list = map["data"];
    setState(() {
      contentList = list.map((value) {
        return CmsContent.fromJson(value);
      }).toList();
    });
  }

  // 无图
  Widget _getItemListModeNo(CmsContent item) {
    var placeholder = 'assets/images/navi.jpeg';
    var imageUri = '';
    if (item.thumbnailUrls.length > 0) {
      imageUri = item.thumbnailUrls.first;
    }
    var title = (item.title == null) ? '' : item.title;
    var source = (item.source == null) ? '' : item.source;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 3,
            style: TextStyle(color: HexColor("#333333"), fontSize: 17),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            source,
            style: TextStyle(color: HexColor('#999999'), fontSize: 12),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            color: HexColor('#f7f7f7'),
          )
        ],
      ),
    );
  }

  // 单图
  Widget _getItemListModeOne(CmsContent item) {
    var placeholder = 'assets/images/navi.jpeg';
    var imageUri = '';
    if (item.thumbnailUrls.length > 0) {
      imageUri = item.thumbnailUrls.first;
    }
    var title = (item.title == null) ? '' : item.title;
    var source = (item.source == null) ? '' : item.source;

    return Container(
      height: 122,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          Container(
            height: 90,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  right: 120,
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 8,
                          left: 0,
                          child: Text(
                            title,
                            maxLines: 3,
                            style: TextStyle(
                                color: HexColor("#333333"), fontSize: 17),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 8,
                          left: 0,
                          child: Text(
                            source,
                            style: TextStyle(
                                color: HexColor('#999999'), fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: FadeInImage.assetNetwork(
                      placeholder: placeholder,
                      image: imageUri,
                      width: 120,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            color: HexColor('#f7f7f7'),
          )
        ],
      ),
    );
  }

  // 大图
  Widget _getItemListModeBig(CmsContent item) {
    var placeholder = 'assets/images/navi.jpeg';
    var imageUri = '';
    if (item.thumbnailUrls.length > 0) {
      imageUri = item.thumbnailUrls.first;
    }
    var title = (item.title == null) ? '' : item.title;
    var source = (item.source == null) ? '' : item.source;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 3,
            style: TextStyle(color: HexColor("#333333"), fontSize: 17),
          ),
          SizedBox(
            height: 8,
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: FadeInImage.assetNetwork(
                placeholder: placeholder,
                image: imageUri,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            source,
            style: TextStyle(color: HexColor('#999999'), fontSize: 12),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            color: HexColor('#f7f7f7'),
          )
        ],
      ),
    );
  }

  // 三图
  Widget _getItemListModeMore(CmsContent item) {
    var title = (item.title == null) ? '' : item.title;
    var source = (item.source == null) ? '' : item.source;
    var width = MediaQuery.of(context).size.width;
    var imageHeight = (width - 52) / 3 * 3 / 4; // 根据屏幕宽度保持4/3的比例
    print('width: ${imageHeight}');

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 3,
            style: TextStyle(color: HexColor("#333333"), fontSize: 17),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: imageHeight,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _getAspectRatioList(item),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            source,
            style: TextStyle(color: HexColor('#999999'), fontSize: 12),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            color: HexColor('#f7f7f7'),
          )
        ],
      ),
    );
  }

  List<Widget> _getAspectRatioList(CmsContent item) {
    var placeholder = 'assets/images/navi.jpeg';
    var count = 3;
    List<Widget> list = [];
    for (int i = 0; i < count; i++) {
      var imageUri = '';
      if (i < item.thumbnailUrls.length) {
        imageUri = item.thumbnailUrls[i];
      }

      list.add(AspectRatio(
        aspectRatio: 4 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: FadeInImage.assetNetwork(
            placeholder: placeholder,
            image: imageUri,
            fit: BoxFit.cover,
          ),
        ),
      ));

      if (i != count - 1) {
        list.add(SizedBox(
          width: 10,
        ));
      }
    }

    return list.toList();
  }
}
