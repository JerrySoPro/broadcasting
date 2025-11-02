import 'package:flutter/material.dart';
import 'custom_broadcast_input.dart';
import 'battery_status_screen.dart';

class BroadcastReceiverScreen extends StatefulWidget {
  const BroadcastReceiverScreen({super.key});

  @override
  _BroadcastReceiverScreenState createState() =>
      _BroadcastReceiverScreenState();
}

class _BroadcastReceiverScreenState extends State<BroadcastReceiverScreen> {
  String selectedOption = 'Custom broadcast receiver';
  List<String> options = [
    'Custom broadcast receiver',
    'System battery notification receiver',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Broadcast Receiver')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Broadcast Type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedOption,
              isExpanded: true,
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() => selectedOption = newValue!);
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (selectedOption == 'Custom broadcast receiver') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomBroadcastInput(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BatteryStatusScreen(),
                    ),
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Text('Proceed', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
