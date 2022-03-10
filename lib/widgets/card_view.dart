import 'package:flutter/material.dart';
import 'package:test_bootcamp/context_ext.dart';

class CardView extends StatelessWidget {
  final String? textTitle;
  final String? textDesc;
  final String? textBottom;
  final String? textEmoji;
  final Color color;
  final Color colorText;
  final double? widthCard;
  const CardView({
    Key? key,
    this.textTitle,
    this.textBottom,
    this.textDesc,
    this.color = Colors.greenAccent,
    this.colorText = Colors.green,
    this.widthCard,
    this.textEmoji
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spaceWidget = SizedBox(
      height: 4,
    );
    return Container(
      width: widthCard,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 22
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow:  [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 1),
            spreadRadius: 0.5,
            blurRadius: 0.5
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: _buildText(context, textTitle , 15),
              ),
              Container(
                margin: const EdgeInsets.only(left: 4),
                child: _buildText(context, textEmoji , 25),
              )
            ],
          ),
          //spaceWidget,
          _buildText(context, textDesc , 32.5),
          spaceWidget,
          Row(
            children: [
              Flexible(
                child: _buildText(context, textBottom , 15),
              ),
              Container(
                margin: const EdgeInsets.only(left: 2),
                child: Icon(
                  Icons.arrow_upward_outlined,
                  size: 20 * context.media.textScaleFactor,
                  color: colorText,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context, String? text, double? sizeText) {
    return Text(
      text ?? "",
      textScaleFactor: context.media.textScaleFactor.clamp(0.5, 1.0),
      style: TextStyle(
        fontSize: sizeText != null ? sizeText * context.media.textScaleFactor : sizeText,
        color: colorText,
        fontWeight: FontWeight.w600
      ),
      textAlign: TextAlign.start,
    );
  }

}
