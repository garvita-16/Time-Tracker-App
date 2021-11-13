import 'package:flutter/cupertino.dart';
import 'package:time_tracker_flutter_course/custom_widgets/custom_raised_widget.dart';

class SignInButton extends CustomRaisedButton{
  SignInButton({
    //@required String text,
    String text,
    Color color,
    Color textColor,
    dynamic onPressed,
}) : super(child: Text(text,
            style: TextStyle(
                    fontSize: 15.0,
                    color: textColor,

      )),
    color: color,
    onPressed: onPressed,
  );
}