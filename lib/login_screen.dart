import 'package:flutter/material.dart';
import 'package:suraj_assignment/color_const.dart';
import 'package:suraj_assignment/create_pass.dart';
import 'package:suraj_assignment/email_screen.dart';
import 'package:suraj_assignment/personal_info.dart';
import 'package:suraj_assignment/schedule_call.dart';
import 'package:suraj_assignment/str_const.dart';
import 'package:suraj_assignment/widget_helper.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted
class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  _login_screenState createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  var currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          currentStep == 1 ? Colors.grey.shade200 : ColorConst.blue,
      body: Stack(
        children: [
          if (currentStep == 1)
            ClipPath(
              clipper: TopWaveClipper(),
              child: Container(
                color: Colors.blueAccent,
                height: 400,
              ),
            ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      InkWell(
                          onTap: () {
                            if (currentStep == 1) {
                            } else if (currentStep >= 1) {
                              setState(() {
                                currentStep = currentStep - 1;
                              });
                            }
                          },
                          child: Icon(Icons.arrow_back,
                              color: ColorConst.WHITE_COLOR)),
                      const SizedBox(width: 20),
                      getTxtWhiteColor(
                          msg: str_const.create_account,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: getStepper(currentStep)),
                    showUi()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getStepper(int pos) {
    List<Widget> widget = [];
    for (var i = 1; i <= 4; i++) {
      if (i <= pos) {
        widget.add(InkWell(
          onTap: () {
            setState(() {
              currentStep = i;
            });
          },
          child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.green,
              ),
              child: Center(
                child: getTxtWhiteColor(
                    msg: "$i", fontSize: 16, fontWeight: FontWeight.bold),
              )),
        ));
      } else {
        widget.add(InkWell(
          onTap: () {
            setState(() {
              currentStep = i;
            });
          },
          child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: Center(
                  child: getTxtBlackColor(
                      textAlign: TextAlign.center,
                      msg: "$i",
                      fontSize: 16,
                      fontWeight: FontWeight.bold))),
        ));
      }
      if (i != 4) {
        widget.add(
            Container(width: 50, color: ColorConst.BLACK_COLOR, height: 3));
      }
    }
    return widget;
  }

  Widget showUi() {
    switch (currentStep) {
      case 1:
        return EmailScreen(() {
          setState(() {
            currentStep = 2;
          });
        });
      case 2:
        return CreatePass(() {
          setState(() {
            currentStep = 3;
          });
        });
      case 3:
        return PersonalInfo(() {
          setState(() {
            currentStep = 4;
          });
        });
      case 4:
        return ScheduleCall(() {});
      default:
        return Container();
    }
  }
}
