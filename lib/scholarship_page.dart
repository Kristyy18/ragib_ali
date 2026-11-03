import 'package:flutter/material.dart';

class ScholarshipPage extends StatefulWidget {
  const ScholarshipPage({super.key});

  @override
  State<ScholarshipPage> createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  String? _selectedDepartment;
  String? _selectedSemester;

  // Selected document statuses
  String? _idCardFileName;
  String? _transcriptFileName;
  String? _certificateFileName;

  final List<String> _departments = [
    'CSE',
    'EEE',
    'BBA',
    'English',
    'Law',
    'Civil Engineering',
    'Architecture',
    'THM',
  ];

  final List<String> _semesters = List.generate(
    12,
    (index) => 'Semester ${index + 1}',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _studentIdController.dispose();
    _amountController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  void _submitApplication() {
    if (_formKey.currentState!.validate()) {
      if (_idCardFileName == null || _transcriptFileName == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please attach your Student ID Card & Transcript.'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Text('Application Sent'),
            ],
          ),
          content: Text(
            'Thank you ${_nameController.text}! Your application (#LU-SCH-2026) has been submitted for review.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LU Scholarship Application'),
        backgroundColor: const Color(0xFFD9534F),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Notice Card
              Card(
                color: Colors.red.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Color(0xFFD9534F)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Available exclusively for enrolled Leading University students. Please submit authentic documents.',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Student Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Student Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter your full name' : null,
              ),
              const SizedBox(height: 12),

              // LU Student ID
              TextFormField(
                controller: _studentIdController,
                decoration: const InputDecoration(
                  labelText: 'Leading University ID (e.g. 211-115-000)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.badge),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter your LU ID' : null,
              ),
              const SizedBox(height: 12),

              // Department & Semester Dropdowns
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedDepartment,
                      decoration: const InputDecoration(
                        labelText: 'Department',
                        border: OutlineInputBorder(),
                      ),
                      items: _departments.map((dept) {
                        return DropdownMenuItem(
                          value: dept,
                          child: Text(dept),
                        );
                      }).toList(),
                      onChanged: (val) =>
                          setState(() => _selectedDepartment = val),
                      validator: (val) => val == null ? 'Select Dept' : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedSemester,
                      decoration: const InputDecoration(
                        labelText: 'Semester',
                        border: OutlineInputBorder(),
                      ),
                      items: _semesters.map((sem) {
                        return DropdownMenuItem(
                          value: sem,
                          child: Text(sem),
                        );
                      }).toList(),
                      onChanged: (val) =>
                          setState(() => _selectedSemester = val),
                      validator: (val) => val == null ? 'Select Sem' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                'Financial Requirement',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Requested Amount
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Requested Amount (BDT)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (val) => val == null || val.isEmpty
                    ? 'Enter requested amount'
                    : null,
              ),
              const SizedBox(height: 12),

              // Reason
              TextFormField(
                controller: _reasonController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Reason for Financial Aid Request',
                  hintText:
                      'Explain your financial circumstances and why you need aid...',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty
                    ? 'Please explain your reason'
                    : null,
              ),
              const SizedBox(height: 20),

              const Text(
                'Required Verification Documents',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Interactive Document Upload Buttons
              _buildUploadButton(
                icon: _idCardFileName != null
                    ? Icons.check_circle
                    : Icons.credit_card,
                iconColor: _idCardFileName != null
                    ? Colors.green
                    : const Color(0xFFD9534F),
                label: _idCardFileName ?? 'Upload Student ID Card Photo',
                onTap: () {
                  setState(() {
                    _idCardFileName = 'Attached: lu_id_card.png';
                  });
                },
              ),
              const SizedBox(height: 8),
              _buildUploadButton(
                icon: _transcriptFileName != null
                    ? Icons.check_circle
                    : Icons.description,
                iconColor: _transcriptFileName != null
                    ? Colors.green
                    : const Color(0xFFD9534F),
                label: _transcriptFileName ??
                    'Upload Latest Transcript / Grade Sheet',
                onTap: () {
                  setState(() {
                    _transcriptFileName = 'Attached: semester_transcript.pdf';
                  });
                },
              ),
              const SizedBox(height: 8),
              _buildUploadButton(
                icon: _certificateFileName != null
                    ? Icons.check_circle
                    : Icons.verified_user,
                iconColor: _certificateFileName != null
                    ? Colors.green
                    : const Color(0xFFD9534F),
                label: _certificateFileName ??
                    'Upload Financial Need Certificate (Optional)',
                onTap: () {
                  setState(() {
                    _certificateFileName = 'Attached: income_certificate.pdf';
                  });
                },
              ),
              const SizedBox(height: 24),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitApplication,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9534F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Submit Application',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadButton({
    required IconData icon,
    required Color iconColor,
    required String label,
    required VoidCallback onTap,
  }) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: iconColor),
      label: Text(
        label,
        style: TextStyle(
          color:
              iconColor == Colors.green ? Colors.green.shade800 : Colors.black87,
          fontWeight:
              iconColor == Colors.green ? FontWeight.bold : FontWeight.normal,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      style: OutlinedButton.styleFrom(
        alignment: Alignment.centerLeft,
        minimumSize: const Size(double.infinity, 48),
        side: BorderSide(
          color:
              iconColor == Colors.green ? Colors.green : Colors.grey.shade400,
        ),
      ),
    );
  }
}