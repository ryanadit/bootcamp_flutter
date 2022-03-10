import 'package:flutter/material.dart';
import 'package:test_bootcamp/context_ext.dart';

class TextTitle extends StatelessWidget {
  final String? text;
  final double sizeText;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const TextTitle({Key? key,
    this.text,
    this.sizeText = 10.0,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text( text ?? "",
      textScaleFactor: context.media.textScaleFactor.clamp(0.5, 1.0),
      style: TextStyle(
        fontSize: sizeText * context.media.textScaleFactor,
        fontWeight: fontWeight
      ),
      textAlign: textAlign,
    );
  }
}
