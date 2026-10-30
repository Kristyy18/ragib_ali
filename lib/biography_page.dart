import 'package:flutter/material.dart';

class BiographyPage extends StatelessWidget {
  const BiographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biography'),
        backgroundColor: const Color(0xFF087443),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Icon(Icons.person, size: 90, color: Color(0xFF087443)),
          SizedBox(height: 20),
          Text(
            'Biography of Ragib Ali',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Ragib Ali is a Bangladeshi businessman, philanthropist '
            'and education entrepreneur associated with initiatives '
            'in education and social development.',
            style: TextStyle(fontSize: 16, height: 1.7),
          ),
          SizedBox(height: 16),
          Text(
            'His Life and Contributions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Explore his life story, professional journey, educational '
            'initiatives and charitable activities. Verify biographical '
            'details from reliable sources before publishing.',
            style: TextStyle(fontSize: 16, height: 1.7),
          ),
        ],
      ),
    );
  }
}
