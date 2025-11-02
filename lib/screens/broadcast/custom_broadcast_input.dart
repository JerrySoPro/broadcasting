import 'package:flutter/material.dart';
import 'custom_broadcast_receiver.dart';

class CustomBroadcastInput extends StatefulWidget {
  const CustomBroadcastInput({super.key});

  @override
  _CustomBroadcastInputState createState() => _CustomBroadcastInputState();
}

class _CustomBroadcastInputState extends State<CustomBroadcastInput> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Broadcast Input')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: messageController,
              decoration: InputDecoration(
                labelText: 'Enter your message',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomBroadcastReceiver(
                      message: messageController.text,
                    ),
                  ),
                );
              },
              child: Text('Send Broadcast'),
            ),
          ],
        ),
      ),
    );
  }
}
