import 'package:flutter/material.dart';
import 'package:mentomind/common/constant.dart';

class Button extends StatelessWidget {
  Button(
      {Key? key,
      required this.btnName,
      required this.width,
      required this.onPress})
      : super(key: key);
  final String btnName;
  final double width;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          btnName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors().blue // This is what you need!
            ),
      ),
    );
  }
}
