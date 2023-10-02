import 'package:flutter/material.dart';

void main() {
  runApp(HRManagementApp());
}

class HRManagementApp extends StatelessWidget {
  const HRManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HR Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmployeeListScreen(),
    );
  }
}

class Employee {
  final String avatar;
  final String name;
  final int age;
  final String position;

  Employee({required this.avatar, required this.name, required this.age, required this.position});
}

class EmployeeListScreen extends StatelessWidget {
  final List<Employee> employees = [
    Employee(avatar: 'assets/avatar1.png', name: 'John Doe', age: 30, position: 'Software Engineer'),
    Employee(avatar: 'assets/avatar2.png', name: 'Jane Smith', age: 28, position: 'HR Manager'),
    // Add more employees here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: GridView.builder(
        itemCount: employees.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return EmployeeCard(employee: employees[index]);
        },
      ),
    );
  }
}

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            employee.avatar,
            width: double.infinity,
            height: 120,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('Age: ${employee.age}'),
                SizedBox(height: 4),
                Text('Position: ${employee.position}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}