import 'package:flutter/material.dart';
//卡片基类
class BaseCared extends StatefulWidget {
  const BaseCared({Key key}) : super(key: key);

  @override
  BaseCaredState createState() => BaseCaredState();
}

class BaseCaredState extends State<BaseCared> {
  Color subTitleColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    //裁切圆角
    return PhysicalModel(color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias, //抗锯齿
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child:Column(
          children: <Widget>[
            topContent(),
            bottomContent()
          ],
        )
      ),
    );
  }

  topContent() {
    return Padding(padding: EdgeInsets.only(left: 20,top: 26,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              topTitle('')
            ]
          ),
          subTitle('')
        ],
      )
    );
  }

  bottomContent() {
    return Container();
  }

  Widget subTitle(String title) {
    return Padding(padding: EdgeInsets.only(top: 5),
    child:Text(title,style: TextStyle(fontSize: 11,color: subTitleColor),),);
  }

  topTitle(String title) {
    return Text(
      title,style: TextStyle(fontSize: 22),
    );
  }
}
