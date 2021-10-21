import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:suraj_assignment/color_const.dart';
import 'package:suraj_assignment/str_const.dart';
import 'package:suraj_assignment/widget_helper.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class EmailScreen extends StatelessWidget {
  var edtController = new TextEditingController();
Function click;
  EmailScreen(this.click);

  // final Color backgroundColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 100),
        getTxtBlackColor(
            msg: "Welcome to", fontSize: 40, fontWeight: FontWeight.bold),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'GIN',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.BLACK_COLOR),
              ),
              TextSpan(
                text: ' Finans',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.blue),
              ),
            ],
          ),
        ),
        SizedBox(height: 50),
        Container(
         padding: EdgeInsets.all(18),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.white,
          ),
          child: Container(
              color: Colors.grey.shade200,
              child: TextFormField(
                // onTap: () => click,
                decoration: const InputDecoration(
                  counterText: '',
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                textInputAction: TextInputAction.next,
                maxLength: 32,
                readOnly: true,
                controller: edtController,
                // validator: (dob) => ValidationHelper.empty(dob!, 'Time is Required'),
              ),
            ),

        ),
        const SizedBox(height: 100),
        raisedRoundColorBtn("Next", Colors.blue.shade200, () {click();})
      ]),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 90);
    path.quadraticBezierTo(
        size.width * 0.12, size.height / 12, size.width, size.height - 40);
    path.lineTo(size.width, 0.00);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
