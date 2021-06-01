//卡片基类
import 'package:flutter/material.dart';
import 'package:flutter_app/base_cared.dart';

//本周推介
class CardRecommend extends BaseCared {
  @override
  _CardRecommendState createState()  => _CardRecommendState();
}
class _CardRecommendState extends BaseCaredState{
  @override
  void initState() {
    subTitleColor = Color(0xffb99444);
    // TODO: implement initState
    super.initState();
  }
  @override
  bottomContent() {
    //高度撑满
    // TODO: implement bottomContent
    return Expanded(child: Container(
      margin: EdgeInsets.only(top: 20),
      child: Image.network(
        'https://z3.ax1x.com/2021/06/02/2MC8te.jpg',
        fit: BoxFit.cover,
      ),
    ));
  }
  @override
  topTitle(String title) {
    // TODO: implement topTitle
    return super.topTitle('本周推介');
  }
  @override
  Widget subTitle(String title) {
    // TODO: implement subTitle
    return super.subTitle('送你一天无限卡，全场书籍免费读 >');
  }
}
