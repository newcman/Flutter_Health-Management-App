/* 开屏主界面 */

import 'package:bp_notepad/components/bp_lineChart.dart';
import 'package:bp_notepad/components/lineChart2.dart';
import 'package:bp_notepad/components/lineChart3.dart';
import 'package:bp_notepad/components/lineChart4.dart';
import 'package:bp_notepad/localization/appLocalization.dart';
import 'package:bp_notepad/screens/aboutScreen.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  // 保持页面状态AutomaticKeepAliveClientMixin

  // KeepAliveHandle _keepAliveHandle;
  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalization.of(context).translate('home_page')),
       trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              CupertinoIcons.person_crop_circle,
              size: 32,
            ),
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => AboutScreen()));
            }),
      ),
      child: Container(
              padding: EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0,bottom: 0),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 5),
                      BPLineChart(),
                      const SizedBox(height: 20),
                      BSLineChart(),
                      const SizedBox(height: 20),
                      BmiLineChart(),
                      const SizedBox(height: 20),
                      SleepLineChart(),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
