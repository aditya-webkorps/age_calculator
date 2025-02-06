import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String data = "Initial Data";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Parent Widget'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              data = "${DateTime.now()}"; // Triggering a rebuild to see didUpdateWidget in action.
            });
          },
          child: const Text('Update Data'),
        ),
        ChildWidget(data: data),
      ],
    );
  }
}

class ChildWidget extends StatefulWidget {
  final String data;

  ChildWidget({Key? key, required this.data}) : super(key: key);

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  late String oldData;

  @override
  void initState() {
    super.initState();
    oldData = widget.data; // Initialize the oldData when the widget is first created.
    print("ChildWidget: initState called");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // This is a good place to handle inherited widgets or context-based logic.
    print("ChildWidget: didChangeDependencies called");
  }

  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      oldData = widget.data; // Handle the updated data here.
      print("ChildWidget: didUpdateWidget called, data changed: $oldData -> ${widget.data}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Child Widget - Data: ${widget.data}'),
        Text('Old Data: $oldData'),
      ],
    );
  }
}
