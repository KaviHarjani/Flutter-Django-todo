import 'package:http/http.dart';

import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  final Client client;
  const CreatePage({Key? key, required this.client}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Column(
        children: [
          TextField(
            maxLines: 10,
            controller: controller,
          ),
          ElevatedButton(
            onPressed: () {
              widget.client.post(Uri.parse('http://192.168.2.103:8000/create/'),
                  body: {'body': controller.text});
              Navigator.pop(context);
            },
            child: Text('Create Note'),
          )
        ],
      ),
    );
  }
}
