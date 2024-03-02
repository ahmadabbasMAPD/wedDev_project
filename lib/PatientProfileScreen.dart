import 'package:flutter/material.dart';

// Define the PatientInfo class
class PatientInfo {
 final String name;
 final String age;
 final String gender;
 final bool isCritical; // New property for critical status
 final String bloodPressure; // New property for blood pressure
 final String respiratoryRate; // New property for respiratory rate
 final String bloodOxygenLevel; // New property for blood oxygen level
 final String heartbeatRate; // New property for heartbeat rate

 PatientInfo({
    required this.name,
    required this.age,
    required this.gender,
    required this.isCritical,
    required this.bloodPressure,
    required this.respiratoryRate,
    required this.bloodOxygenLevel,
    required this.heartbeatRate,
 });
}


class PatientProfileScreen extends StatelessWidget {
 // For demonstration, we'll use static data
 final PatientInfo patient = PatientInfo(
    name: 'John Doe',
    age: '30',
    gender: 'Male',
    isCritical: true, // Example critical status
    bloodPressure: '120/80 mmHg',
    respiratoryRate: '20/min',
    bloodOxygenLevel: '98%',
    heartbeatRate: '70/min',
 );

 PatientProfileScreen({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                 CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/profile_placeholder.png'),
                 ),
                 Positioned(
                    bottom: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to EditPatientProfileScreen or similar
                      },
                      child: Text('Edit'),
                    ),
                 ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '${patient.name}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Age: ${patient.age}, ${patient.gender}', // Display static age and gender
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.0),
            Text(
              'Medical History',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            _buildMedicalInfo('Is Critical', patient.isCritical ? 'Yes' : 'No'),
            _buildMedicalInfo('Blood Pressure', patient.bloodPressure),
            _buildMedicalInfo('Respiratory Rate', patient.respiratoryRate),
            _buildMedicalInfo('Blood Oxygen Level', patient.bloodOxygenLevel),
            _buildMedicalInfo('Heartbeat Rate', patient.heartbeatRate),
          ],
        ),
      ),
    );
 }

 Widget _buildMedicalInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
 }
}

