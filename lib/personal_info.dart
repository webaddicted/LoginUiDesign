import 'package:flutter/material.dart';
import 'package:suraj_assignment/str_const.dart';
import 'package:suraj_assignment/widget_helper.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class PersonalInfo extends StatelessWidget {
  TextEditingController pwdCont = TextEditingController();
  Function click;
  PersonalInfo(this.click);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          getTxtWhiteColor(
              msg: str_const.personal_info,
              fontSize: 19,
              fontWeight: FontWeight.w700),
          const SizedBox(height: 5),
          getTxtWhiteColor(msg: str_const.personal_info_desc, fontSize: 15),
          const SizedBox(height: 50),
          dropDownField(txt: "Goal for activation", edtController: pwdCont,click: (){}),
          const SizedBox(height: 20),
          dropDownField(txt: "Monthly Income", edtController: pwdCont,click: (){}),
          const SizedBox(height: 20),
          dropDownField(txt: "Monthly expense", edtController: pwdCont,click: (){}),
          const SizedBox(height: 80),
          raisedRoundColorBtn("Next", Colors.blue.shade200, () {click();})
        ],
      ),
    );
  }
}