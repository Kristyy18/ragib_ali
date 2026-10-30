import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
        backgroundColor: const Color(0xFF087443),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Icon(Icons.school, size: 80, color: Color(0xFF087443)),
          SizedBox(height: 20),
          Text(
            'Education and Learning',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Learn about educational initiatives associated with Ragib Ali '
            'and their contribution to learning opportunities.',
            style: TextStyle(fontSize: 16, height: 1.7),
          ),
          SizedBox(height: 20),
          Text(
            'Educational Contributions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'This section can include verified information about '
            'educational projects, scholarships, schools and universities.',
            style: TextStyle(fontSize: 16, height: 1.7),
          ),
        ],
      ),
    );
  }
}
