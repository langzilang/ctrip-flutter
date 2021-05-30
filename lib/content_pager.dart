import 'package:flutter/material.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;
  //构造方法,可选参数
  const ContentPager({Key key, this.onPageChanged, this.contentPagerController})
      //初始化列表
      : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = PageController(
  /**视图比例**/
    viewportFraction: 0.8
  );
  static List<Color>_colors = [
    Colors.blue,
    Colors.red,
    Colors.deepOrange,
    Colors.teal,
  ];
  @override
  void initState() {
    if(widget.contentPagerController!=null){
      widget.contentPagerController._pageController = _pageController;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //appBar
        Expanded(
          //高度撑开，否则在Column中没有高度会报警
            child: PageView(
              onPageChanged: widget.onPageChanged,
              controller: _pageController,
          children: <Widget>[
            _wrapItem(0),
            _wrapItem(1),
            _wrapItem(2),
            _wrapItem(3),
          ],
        ))
      ],
    );
  }
  Widget _wrapItem(int index){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(color: _colors[index]),
    ),
    );
  }
}
//内容区域控制器
class ContentPagerController{
  PageController _pageController;
  void jumpToPage(int page){
    //dart 编程技巧：安全的调用
    //防止空导致的异常
    _pageController?.jumpToPage(page);
  }
}