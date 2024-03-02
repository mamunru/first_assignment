import 'package:first_assignment/taskpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Center(
              child: Text(
                'Welcome to',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Text(
              'Plan IT',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
            ),
            Center(
              child: Text(
                'Your Personal task management ',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Center(
              child: Text(
                'and  planning solution',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskPage()),
                  );
                },
                child: Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 2.5,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Text(
                      "Let's get started",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
