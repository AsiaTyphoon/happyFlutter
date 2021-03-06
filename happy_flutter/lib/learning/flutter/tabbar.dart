import 'package:flutter/material.dart';
import 'package:happy_flutter/learning/flutter/fuwu/fuwu.dart';
import 'package:happy_flutter/learning/flutter/home/home.dart';

class HomeTabbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeTabbar();
}

class _HomeTabbar extends State<HomeTabbar> {
  int selectedIndex = 0;

  List _pageList = [
    HomePage(),
    FuwuViewController(),
    FuwuViewController(),
    FuwuViewController(),
    FuwuViewController(),
  ];

  var tabbarItems = <TabbarItem>[
    TabbarItem('首页', 'tabbar_home', true),
    TabbarItem('拍客', 'tabbar_paike', false),
    TabbarItem('直播', 'tabbar_live', false),
    TabbarItem('服务', 'tabbar_fuwu', false),
    TabbarItem('我的', 'tabbar_mine', false),
  ];

  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarItem> tabbarWidgets = tabbarItems.map((value) {
      //print('ssssss: ${value.selected}');
      TextStyle titleStyle = TextStyle(
          fontSize: 14, color: value.selected ? Colors.red : Colors.black);
      return BottomNavigationBarItem(
          icon: Image.asset(
            value.iconUrl(),
            width: 25,
            height: 25,
          ),
          label: value.title);
    }).toList();

    return Scaffold(
      body: _pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: tabbarWidgets,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedFontSize: 14,
        selectedFontSize: 14,
        onTap: (index) {
          setState(() {
            if (index < this.tabbarItems.length) {
              this.tabbarItems.map((value) {
                value.selected = false;
              }).toList();

              this.tabbarItems[index].selected = true;
            }
            this.selectedIndex = index;
          });
        },
      ),
    );

  }
}

class TabbarItem {
  String title;
  String icon;
  bool selected;

  TabbarItem(this.title, this.icon, this.selected);

  String iconUrl() {
    if (this.selected) {
      return 'assets/images/${this.icon}_on.png';
    } else {
      return 'assets/images/${this.icon}.png';
    }
  }
}
