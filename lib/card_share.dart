//分享得联名卡
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/base_cared.dart';

class CardShare extends BaseCared{

  @override  _CardShareState createState() => _CardShareState();
}
class _CardShareState extends BaseCaredState{
  @override
  topTitle(String title) {
    // TODO: implement topTitle
    return super.topTitle('分享得联名卡');
  }
  @override
  Widget subTitle(String title) {
    return subTitle('分享给朋友最多可获得12天无限卡');
  }
}
