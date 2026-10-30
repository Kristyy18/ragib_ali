import 'package:flutter/material.dart';

class InstitutionsPage extends StatelessWidget {
  const InstitutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institutions'),
        backgroundColor: const Color(0xFF087443),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Icon(Icons.account_balance, size: 80, color: Color(0xFF087443)),
          SizedBox(height: 20),
          Text(
            'Educational Institutions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Explore educational institutions associated with Ragib Ali '
            'and their educational missions.',
            style: TextStyle(fontSize: 16, height: 1.7),
          ),
          SizedBox(height: 20),
          Text(
            'Institution Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Add each institution’s verified name, location, history '
            'and official website in this section.',
            style: TextStyle(fontSize: 16, height: 1.7),
          ),
        ],
      ),
    );
  }
}
