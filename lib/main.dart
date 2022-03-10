import 'package:flutter/material.dart';
import 'package:test_bootcamp/task_one/task_one.dart';
import 'package:test_bootcamp/widgets/bottom_sheet_view.dart';
import 'context_ext.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskOne(),
    );
  }
}






class SampleApp extends StatelessWidget {
  const SampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("Exercise Dynamic Size"),
    );
    final screenWidth = context.mediaWidth;
    final statusBar = context.media.padding.top;
    final finalHeight =
        (context.mediaHeight - appBar.preferredSize.height - statusBar);

    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Colors.white,
        child: LayoutBuilder(
          builder: (context, constraint) {
            if (constraint.maxWidth >= 480) {
              return SampleLandscapeView(
                finalHeight: finalHeight,
                screenWidth: screenWidth,
              );
            }
            return SamplePortraitView(
              finalHeight: finalHeight,
              screenWidth: screenWidth,
            );
          },
        ),
      ),
    );
  }
}

class SamplePortraitView extends StatelessWidget {
  final finalHeight;
  final screenWidth;

  const SamplePortraitView({Key? key, this.finalHeight, this.screenWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Container(
            color: Colors.blue,
            height: finalHeight * 0.05,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.yellow,
            height: finalHeight * 0.25,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: finalHeight * 0.7,
            child: Column(
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          //margin: const EdgeInsets.only(right: 8),
                          color: Colors.red,
                          width: (screenWidth - (38 + 16)) * 0.5,
                          height: ((finalHeight * 0.7) - (16*6)) / 3,
                        ),
                        Container(
                          //margin: const EdgeInsets.only(left: 8),
                          color: Colors.red,
                          width: (screenWidth - (38 + 16)) * 0.5,
                          height: ((finalHeight * 0.7) - (16*6)) / 3,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SampleLandscapeView extends StatelessWidget {
  final finalHeight;
  final screenWidth;

  const SampleLandscapeView({Key? key, this.finalHeight, this.screenWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Container(
            color: Colors.blue,
            height: finalHeight * 0.05,
          ),
        ),
        Row(
          children: [
            Container(
              width: screenWidth * 0.3,
              height: finalHeight * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.yellow,
                  height: finalHeight * 0.25,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              height: finalHeight * 0.9,
              child: Column(
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            //margin: const EdgeInsets.only(right: 8),
                            color: Colors.red,
                            width: (screenWidth -
                                    (screenWidth * 0.3) -
                                    (38 + 16)) *
                                0.5,
                            height: ((finalHeight * 0.9) - (16*4)) / 3,
                          ),
                          Container(
                            //margin: const EdgeInsets.only(left: 8),
                            color: Colors.red,
                            width: (screenWidth -
                                    (screenWidth * 0.3) -
                                    (38 + 16)) *
                                0.5,
                            height: ((finalHeight * 0.9) - (16*4)) / 3,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Container(
        //     color: Colors.yellow,
        //     height: finalHeight * 0.25,
        //   ),
        // ),
        // Expanded(
        //   child: Container(
        //     padding: const EdgeInsets.only(left: 16, right: 16),
        //     height: finalHeight * 0.7,
        //     child: Column(
        //       children: [
        //         for (int i = 0; i < 3; i++)
        //           Container(
        //             padding: const EdgeInsets.only(bottom: 16.0),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Container(
        //                   //margin: const EdgeInsets.only(right: 8),
        //                   color: Colors.red,
        //                   width: (screenWidth - (38 + 16)) * 0.5,
        //                   height: finalHeight * 0.09,
        //                 ),
        //                 Container(
        //                   //margin: const EdgeInsets.only(left: 8),
        //                   color: Colors.red,
        //                   width: (screenWidth - (38 + 16)) * 0.5,
        //                   height: finalHeight * 0.09,
        //                 ),
        //               ],
        //             ),
        //           ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }
}

class SampleTextScalingFactor extends StatelessWidget {
  const SampleTextScalingFactor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text(
        "Exercise Dynamic Size",
        textScaleFactor: context.media.textScaleFactor.clamp(1.0, 1.5),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            "Ini Contoh text",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 10 * context.media.textScaleFactor,
            ),
          ),
        ),
      ),
    );
  }
}

class SampleFittedBox extends StatelessWidget {
  const SampleFittedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 200,
          color: Colors.yellow,
          height: 100,
          child: const FittedBox(
            fit: BoxFit.contain,
            child: Text("Text asda sadasdasdasda asd asd asd as"),
          ),
        ),
      ),
    );
  }
}

class SampleBottomSheet extends StatelessWidget {
  const SampleBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 200,
          color: Colors.yellow,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const BottomSheetView();
                  }
              );
            },
            child: const Text("Show BottomSheet"),
          ),
        ),
      ),
    );
  }
}


