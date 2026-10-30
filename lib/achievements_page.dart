import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
        backgroundColor: const Color(0xFF087443),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Icon(Icons.emoji_events, size: 80, color: Color(0xFF087443)),
          SizedBox(height: 20),
          Text(
            'Achievements and Recognition',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Explore the professional accomplishments, awards and '
            'recognition associated with Ragib Ali.',
            style: TextStyle(fontSize: 16, height: 1.7),
          ),
          SizedBox(height: 20),
          Text(
            'Major Contributions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Add verified details about notable achievements, educational '
            'development and contributions to society here.',
            style: TextStyle(fontSize: 16, height: 1.7),
          ),
        ],
      ),
    );
  }
}
