import 'package:flutter/material.dart';
import 'package:multi_quill/single_quill_editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title:
              const Text('Scrollable Text Issue', textAlign: TextAlign.center),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "To replicate issue, click and hold in the text field on iOS then release to view the 'paste' option. Paste a bunch of text in the editor and it'll create an error. ALSO, select a word and move the start or end selectors to view another error. \r\n\r\nI need this to work because I'll end up having multiple Quill editors in a listview all with unknown heights.",
                maxLines: 15,
              ),
            ),
            Expanded(
              // I have this in a listbuilder because there will be multiple Quill Editors to be displayed (with other stuff inbetween eventually)
              child: ListView.builder(
                itemCount: 1,
                controller: ScrollController(),
                itemBuilder: (context, index) {
                  return const SingleQuillEditor(
                      "Paste text larger than the device height here");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
