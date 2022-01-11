import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class SingleQuillEditor extends StatefulWidget {
  final String initText;
  const SingleQuillEditor(this.initText, {Key? key}) : super(key: key);

  @override
  State<SingleQuillEditor> createState() => _SingleQuillEditorState();
}

class _SingleQuillEditorState extends State<SingleQuillEditor> {
  QuillController? _controller;

  @override
  void initState() {
    super.initState();
    _loadFromAssets();
  }

  Future<void> _loadFromAssets() async {
    try {
      final doc = Document()..insert(0, widget.initText);
      setState(() {
        _controller = QuillController(
            document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
    } catch (error) {
      final doc = Document()..insert(0, 'Empty asset');
      setState(() {
        _controller = QuillController(
            document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Scaffold(body: Center(child: Text('Loading...')));
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.green[50],
        padding: const EdgeInsets.all(15),
        child: QuillEditor(
          controller: _controller!,
          scrollController: ScrollController(),
          scrollable: false,
          focusNode: FocusNode(),
          autoFocus: false,
          readOnly: false,
          placeholder: 'Add content',
          expands: false,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
