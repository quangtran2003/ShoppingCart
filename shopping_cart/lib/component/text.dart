import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
   MyText({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.fontSize,
    this.fontWeight,
    this.maxLine,
  }) : super(key: key);
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLine;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
