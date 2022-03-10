import 'package:flutter/material.dart';
import 'package:test_bootcamp/context_ext.dart';

class HeadWidget extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsets padding;
  final Widget widget;

  const HeadWidget({Key? key,
    this.height = 100,
    this.width = 100,
    this.padding = const EdgeInsets.all(32),
    required this.widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade100,
        borderRadius: BorderRadius.only(
          bottomLeft: context.media.padding.left > 0 ? const Radius.circular(0) : const Radius.circular(48),
          bottomRight: const Radius.circular(48),
          topRight: context.media.padding.left > 0 ? const Radius.circular(48) : const Radius.circular(0)
        )
      ),
      height: height,
      width: width,
      child: widget,
    );
  }
}
