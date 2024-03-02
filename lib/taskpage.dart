import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Map<String, dynamic>> items = [
    //{'name': "Task", "details": 'this is some details', 'date': "25may2024"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Board"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, index) {
            return Card(
                child: ListTile(
              title: Text(
                items[index]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                items[index]['details'],
                style: TextStyle(fontWeight: FontWeight.normal),
                maxLines: 2,
              ),
              trailing: Text(items[index]['date'].toString().substring(0, 10)),
            ));
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          // Open a dialog to add a new item
          _addItemDialog(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  // add section
  Future<void> _addItemDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailsController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Item'),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Enter name'),
              ),
              TextField(
                controller: detailsController,
                decoration: InputDecoration(labelText: 'Enter details'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the new item to the list
                setState(() {
                  items.add({
                    'name': nameController.text,
                    'details': detailsController.text,
                    'date': DateTime.now(),
                  });
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
