import 'package:flutter/material.dart';
import 'package:test_bootcamp/context_ext.dart';
import 'view/views.dart';

class TaskOne extends StatelessWidget {
  const TaskOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent.shade100,
         child: Icon(Icons.access_time,
           size: 20 * context.media.textScaleFactor,
           color: Colors.grey.shade800,
         ),
      ),
      body: Container(
        color: Colors.white,
        height: context.finalHeight,
        width: context.mediaWidth,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if(constraints.maxWidth >= 480) {
              return const LayoutView(
                typeLayout: TypeLayout.landscape,
              );
            }
            return const LayoutView(
              typeLayout: TypeLayout.portrait,
            );
          },
        ),
      ),
    );
  }
}
