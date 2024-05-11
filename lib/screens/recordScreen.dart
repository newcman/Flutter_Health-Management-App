/* 选择什么内容进行记录的界面 */
import 'package:bp_notepad/localization/appLocalization.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bp_notepad/screens/FunctionScreen/bpScreen.dart';
import 'package:bp_notepad/screens/FunctionScreen/bsScreen.dart';
import 'package:flutter/material.dart';
import 'package:bp_notepad/screens/FunctionScreen/bmiScreen.dart';
import 'package:bp_notepad/components/constants.dart';

import 'FunctionScreen/sleepScreen.dart';

const List<Icon> icons = [
  const Icon(
    FontAwesomeIcons.heartbeat,
    color: const Color(0xFFFF284B),
  ),
  const Icon(
    FontAwesomeIcons.vial,
    color: const Color(0xFFFF4000),
  ),
  const Icon(
    FontAwesomeIcons.calculator,
    color: const Color(0xFF4E4CD0),
  ),
  const Icon(
    FontAwesomeIcons.bed,
    color: const Color(0xFF4E4CD0),
  ),
];

List<Widget> pageRoutes = [
  BloodPressure(),
  BloodSugar(),
  BmiScreen(),
  SleepScreen(),
];

class RecordMeun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List tittleTexts = [
      AppLocalization.of(context).translate('bp_record'),
      AppLocalization.of(context).translate('bs_record'),
      AppLocalization.of(context).translate('bmi_Calc'),
      AppLocalization.of(context).translate('sleep_record'),
    ];
    return CupertinoPageScaffold(
        backgroundColor: CupertinoDynamicColor.resolve(
            CupertinoColors.systemGroupedBackground, context),
        navigationBar: CupertinoNavigationBar(
          middle: Text(AppLocalization.of(context).translate('record_tittle')),
        ),
        child: Container(
          padding: EdgeInsets.all(50.0),
          alignment: Alignment.bottomCenter,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.7,
                crossAxisSpacing: 20.0),
            itemCount: pageRoutes.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.0,
                        ),
                        icons[index],
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          tittleTexts[index],
                          style: TextStyle(
                              color: CupertinoDynamicColor.resolve(
                                  textColor, context),
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 500.0,
                            child: pageRoutes[index],
                          );
                        });
                  });
            },
          ),
        ));
  }
}
