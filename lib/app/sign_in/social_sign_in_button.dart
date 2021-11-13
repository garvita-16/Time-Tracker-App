import 'package:time_tracker_flutter_course/custom_widgets/custom_raised_widget.dart';
import 'package:flutter/material.dart';
class SocialSignInButton extends CustomRaisedButton{
  SocialSignInButton({
    //@required String text,
    String text,
    //@required String assetName,
    String assetName,
    Color color,
    Color textColor,
    dynamic onPressed,
}) : super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(assetName),
        Text(text,style: TextStyle(
          color: textColor,
          fontSize : 15.0,
        ),),
        Opacity(
          opacity: 0.0,
          child: Image.asset(assetName),
        ),
      ],
    ),
    color: color,
    onPressed: onPressed,
  );
}