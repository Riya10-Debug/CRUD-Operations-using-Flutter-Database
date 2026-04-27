import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Database? database;
  List<Map<String, dynamic>> empList = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initDB();
  }

  // Initialize DB
  void initDB() async {
    String path = join(await getDatabasesPath(), 'employee.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE emp(
            empid INTEGER PRIMARY KEY AUTOINCREMENT,
            empname TEXT,
            empmobile TEXT
          )
        ''');
      },
    );

    loadData();
  }

  // Insert
  void insertData() async {
    await database!.insert('emp', {
      'empname': nameController.text,
      'empmobile': mobileController.text,
    });

    nameController.clear();
    mobileController.clear();
    loadData();
  }

  // Fetch
  void loadData() async {
    final data = await database!.query('emp');
    setState(() {
      empList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employee List')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(labelText: "Mobile"),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: insertData,
              child: Text("Add Employee"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: empList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(empList[index]['empid'].toString()),
                    title: Text(empList[index]['empname']),
                    subtitle: Text(empList[index]['empmobile']),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}