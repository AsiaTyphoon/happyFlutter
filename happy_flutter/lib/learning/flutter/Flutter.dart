import 'package:flutter/material.dart';
import 'package:happy_flutter/main.dart';

// StatelessWidget 无状态组件，状态不可变的widget
// StatefulWidget 有状态组件，持有的状态可能在widget生命周期改变

class FirstStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FirstMaterialApp();
  }
}

// MaterialApp 根组件
class FirstMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScaffold(), // 主页
      title: 'MaterialApp',
      theme: ThemeData(primaryColor: Colors.red), // 主题色
    );
  }
}

// Scaffold 布局结构的基本实现
class FirstScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print('screen size: ${size}');
    kScreenWidth = size.width;
    kScreenHeight = size.height;

    return Scaffold(
        appBar: AppBar(
          title: NaviContainer(),
        ),
        body: FirstCenter());
  }
}

// 居中
class FirstCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Center(child: FirstContainer(800));
    return Center(child: FirstListView(),);
  }
}

// 导航栏
class NaviContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FirstImage(),
      width: kScreenWidth,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 44,
    );
  }
}

// 容器
class FirstContainer extends StatelessWidget {
  double height = 44;

  FirstContainer(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FirstListView(),
      margin: EdgeInsets.all(10), // 外边距
      padding: EdgeInsets.fromLTRB(20, 5, 40, 1), // 内边距
      width: kScreenWidth,
      height: height,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            // 圆角写法特殊
            Radius.circular(10),
          )),
    );
  }
}

// 列表
class FirstListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _dataArr(),
    );
  }

  List<Widget> _dataArr() {
    var list = <Widget>[];
    var count = 20;
    for (var i = 0; i < count; i++) {
      list.add(ListTile(
        title: Text('this is title ${i}'),
        leading: Image.asset('assets/images/navi.jpeg'),
        subtitle: Text('this is subtitle ${i}'),
      ));
    }
    return list.toList();
  }
}

// 图片
class FirstImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 加载本地图片
    // return Image.asset(
    //   'assets/images/navi.jpeg',
    //   fit: BoxFit.fill,
    // );

    // 加载网络图片
    return Image.network(
        'https://upload-images.jianshu.io/upload_images/5361063-e413832da0038304.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/800');
  }
}

// 文本
class FirstText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'hello flutter',
      style: TextStyle(color: Colors.red, backgroundColor: Colors.orange),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
  }
}
