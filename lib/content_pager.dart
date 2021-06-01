import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/card_recommend.dart';
import 'package:flutter_app/custom_appbar.dart';

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
    _statusBar();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //appBar
        CustomAppBar(),
        Expanded(
          //高度撑开，否则在Column中没有高度会报警
            child: PageView(
              onPageChanged: widget.onPageChanged,
              controller: _pageController,
          children: <Widget>[
            _wrapItem(CardRecommend()),
            _wrapItem(CardRecommend()),
            _wrapItem(CardRecommend()),
            _wrapItem(CardRecommend()),
            // _wrapItem(0),
            // _wrapItem(1),
            // _wrapItem(2),
            // _wrapItem(3),
          ],
        ))
      ],
    );
  }
  Widget _wrapItem(Widget widget){
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget,
    //   child: Container(
    //     decoration: BoxDecoration(color: _colors[index]),
    // ),
    );
  }
  //状态栏样式--沉浸式状态栏
  _statusBar(){
    //黑色沉浸式状态栏，基于SystemUiOverlayStyle.dark 修改了 statusBarColor
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
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