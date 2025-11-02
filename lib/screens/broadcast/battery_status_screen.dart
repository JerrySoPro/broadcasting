import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryStatusScreen extends StatefulWidget {
  const BatteryStatusScreen({super.key});

  @override
  _BatteryStatusScreenState createState() => _BatteryStatusScreenState();
}

class _BatteryStatusScreenState extends State<BatteryStatusScreen> {
  final Battery _battery = Battery();
  int batteryLevel = 0;
  BatteryState batteryState = BatteryState.unknown;

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() => batteryState = state);
    });
  }

  Future<void> _getBatteryLevel() async {
    final level = await _battery.batteryLevel;
    setState(() => batteryLevel = level);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Battery Status')),
      body: Center(
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.battery_full, size: 80, color: Colors.green),
                SizedBox(height: 20),
                Text(
                  'Battery Level:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$batteryLevel%',
                  style: TextStyle(fontSize: 48, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  'State: ${batteryState.toString().split('.').last}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _getBatteryLevel,
                  child: Text('Refresh'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
