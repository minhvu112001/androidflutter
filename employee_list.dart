import 'package:flutter/material.dart';

class EmployeeList extends StatelessWidget {
  final List<Employee> employees;

  const EmployeeList({required this.employees});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: employees.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(employees[index].avatar),
          ),
          title: Text(employees[index].name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Age: ${employees[index].age}'),
              Text('Position: ${employees[index].position}'),
            ],
          ),
        );
      },
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