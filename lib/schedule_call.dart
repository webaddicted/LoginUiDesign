import 'package:flutter/material.dart';
import 'package:suraj_assignment/color_const.dart';
import 'package:suraj_assignment/str_const.dart';
import 'package:suraj_assignment/widget_helper.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class ScheduleCall extends StatelessWidget {
  TextEditingController pwdCont = TextEditingController();
  Function click;
  ScheduleCall(this.click);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          FloatingActionButton(
            backgroundColor: ColorConst.WHITE_COLOR,
            onPressed: () {
            },
            child: Icon(Icons.calendar_today, color: ColorConst.blue)),
          const SizedBox(height: 20),
          getTxtWhiteColor(
              msg: str_const.schedule_call,
              fontSize: 19,
              fontWeight: FontWeight.w700),
          const SizedBox(height: 5),
          getTxtWhiteColor(msg: str_const.schedule_call_desc, fontSize: 15),
          const SizedBox(height: 50),
          dropDownField(txt: "Date", edtController: pwdCont,click: (){}),
          const SizedBox(height: 20),
          dropDownField(txt: "Time", edtController: pwdCont,click: (){}),
          const SizedBox(height: 80),
          raisedRoundColorBtn("Next", Colors.blue.shade200, () {click();})

      ],),
    );
  }
}