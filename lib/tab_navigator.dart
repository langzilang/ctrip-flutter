import 'package:flutter/material.dart';
//底部导航栏搭建
class TabNavigator extends StatefulWidget {
  const TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blueAccent;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffedeef0),
            Color(0xffe6c7e9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          )
        ),
        child: Center(
          child: Text('您点击了第$_currentIndex个Tab',style: TextStyle(fontSize: 36,color: Colors.blueAccent),),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            //修改状态
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
        _bottomItem('本周', Icons.folder,0),
        _bottomItem('分享', Icons.explore,1),
        _bottomItem('免费', Icons.donut_small,2),
        _bottomItem('长按', Icons.person,3)
      ]),
    );
  }
  //封装底部Tab
  _bottomItem(String title,IconData icon,int index){
    return BottomNavigationBarItem(
        icon: Icon(icon,color: _defaultColor,),
        activeIcon: Icon(icon,color: _activeColor,),
        title: Text(title,style: TextStyle(color: _currentIndex !=index?_defaultColor:_activeColor),)
    );
  }
}
