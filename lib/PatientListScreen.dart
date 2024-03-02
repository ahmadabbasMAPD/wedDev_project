import 'package:flutter/material.dart';
import 'patient_service.dart'; // Import the service
import 'AddPatientScreen.dart'; // Import the AddPatientScreen
import 'PatientProfileScreen.dart'; // Import the PatientProfileScreen

class PatientListScreen extends StatelessWidget {
 final PatientService _patientService = PatientService();

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patients'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // search is to be implemented when get all patients is implemented
              showDialog(
                context: context,
                builder: (context) {
                 return AlertDialog(
                    title: Text('Search Patients'),
                    content: TextField(
                      onChanged: (value) {
                        
                      },
                      decoration: InputDecoration(hintText: 'Search by name'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                 );
                },
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _patientService.fetchPatients(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final patient = snapshot.data![index];
                return ListTile(
                 title: Text(patient['name']),
                 subtitle: Text('Age: ${patient['age']}, Gender: ${patient['gender']}'),
                 // Add more details as needed
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPatientScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // You can add more buttons or widgets here if needed
              Expanded(
                child: Align(
                 alignment: Alignment.centerRight,
                 child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the PatientProfileScreen without passing any data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientProfileScreen(),
                        ),
                      );
                    },
                    child: Text('Next'),
                 ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
 }
}
