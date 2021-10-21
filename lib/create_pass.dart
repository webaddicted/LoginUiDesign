import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:suraj_assignment/str_const.dart';
import 'package:suraj_assignment/widget_helper.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class CreatePass extends StatelessWidget {
  TextEditingController pwdCont = TextEditingController();
  Function click;
  CreatePass(this.click);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          getTxtWhiteColor(
              msg: str_const.create_account,
              fontSize: 19,
              fontWeight: FontWeight.w700),
          const SizedBox(height: 5),
          getTxtWhiteColor(msg: str_const.create_account_desc, fontSize: 15),
          const SizedBox(height: 20),
          edtPwdField(control: pwdCont),
          const SizedBox(height: 50),
          getTxtWhiteColor(msg: "Complexity: "),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  getTxtWhiteColor(msg: "a", fontSize: 35),
                  getTxtWhiteColor(msg: "Lowercase", fontSize: 15)
                ],
              ),
              SizedBox(width: 15),
              Column(
                children: [
                  getTxtWhiteColor(msg: "A", fontSize: 35),
                  getTxtWhiteColor(msg: "Uppercase", fontSize: 15)
                ],
              ),
              SizedBox(width: 15),
              Column(
                children: [
                  getTxtWhiteColor(msg: "123", fontSize: 35),
                  getTxtWhiteColor(msg: "Number", fontSize: 15)
                ],
              ),
              SizedBox(width: 15),
              Column(
                children: [
                  getTxtWhiteColor(msg: "9+", fontSize: 35),
                  getTxtWhiteColor(msg: "Characters", fontSize: 15)
                ],
              )
            ],
          ),
          const SizedBox(height: 80),
          raisedRoundColorBtn("Next", Colors.blue.shade200, () {click();})
        ],
      ),
    );
  }
}
