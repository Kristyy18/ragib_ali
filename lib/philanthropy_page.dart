import 'package:flutter/material.dart';

class PhilanthropyPage extends StatelessWidget {
  const PhilanthropyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Philanthropy'),
        backgroundColor: const Color(0xFF087443),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Icon(Icons.volunteer_activism, size: 80, color: Color(0xFF087443)),
          SizedBox(height: 20),
          Text(
            'Philanthropy and Social Work',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Learn about charitable initiatives and social development '
            'activities associated with Ragib Ali.',
            style: TextStyle(fontSize: 16, height: 1.7),
          ),
          SizedBox(height: 20),
          Text(
            'Community Support',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'This section can present verified information about '
            'charitable work, community support and educational assistance.',
            style: TextStyle(fontSize: 16, height: 1.7),
          ),
        ],
      ),
    );
  }
}
