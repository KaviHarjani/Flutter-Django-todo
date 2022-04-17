import 'package:http/http.dart';

import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  final Client client;
  final int id;
  final String body;
  const UpdatePage(
      {Key? key, required this.client, required this.id, required this.body})
      : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController controller = TextEditingController();
  initState() {
    controller.text = widget.body;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: Column(
        children: [
          TextField(
            maxLines: 10,
            controller: controller,
          ),
          ElevatedButton(
            onPressed: () {
              widget.client.put(
                  Uri.parse('http://192.168.2.103:8000/update/${widget.id}'),
                  body: {'body': controller.text});
              Navigator.pop(context);
            },
            child: Text('Update Note'),
          )
        ],
      ),
    );
  }
}
