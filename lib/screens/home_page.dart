import 'package:flutter/material.dart';
import 'broadcast/broadcast_receiver_screen.dart';
import 'image_scale_screen.dart';
import 'video_player_screen.dart';
import 'audio_player_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CSE 489 Assignment')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Navigation Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.broadcast_on_home),
              title: Text('Broadcast Receiver'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BroadcastReceiverScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Image Scale'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageScaleScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.video_library),
              title: Text('Video'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayerScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.audiotrack),
              title: Text('Audio'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AudioPlayerScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Select an option from the drawer',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
