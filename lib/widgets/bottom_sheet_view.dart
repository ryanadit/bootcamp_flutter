import 'package:flutter/material.dart';
import 'package:test_bootcamp/context_ext.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _namedController = TextEditingController();
    final _cityController = TextEditingController();

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding:
              EdgeInsets.fromLTRB(16, 16, 16, (context.media.viewInsets.bottom+16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _namedController,
                decoration: const InputDecoration(hintText: "Input Nama"),
                onSubmitted: (_) => {},
              ),
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(hintText: "Input Nama Kota"),
                onSubmitted: (_) => {},
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text("Submit")
              )
            ],
          ),
        ),
      ),
    );
  }
}
