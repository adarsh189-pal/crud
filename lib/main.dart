import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.cyan,
      ),
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  String studentName, systemId, studyProgramId;
  double studentGpa;

  getStudentName(name) {
    this.studentName = name;
  }

  getSystemId(id) {
    this.systemId = id;
  }

  getStudyProgramId(programId) {
    this.studyProgramId = programId;
  }

  getStudentGpa(gpa) {
    this.studentGpa = double.parse(gpa);
  }

  createData() {
    print('created');
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('MyStudent').doc(studentName);
    Map<String, dynamic> students = {
      'studentName': studentName,
      'studentId': systemId,
      'studyProgramId': studyProgramId,
      'studentGpa': studentGpa
    };
    documentReference.set(students).whenComplete(() {
      print('$studentName created');
    });
  }

  readData() {
    print('read');
  }

  updateData() {
    print('updated');
  }

  deleteData() {
    print('deleted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase College'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Name',
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    )),
                onChanged: (String name) {
                  getStudentName(name);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'System ID',
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    )),
                onChanged: (String id) {
                  getSystemId(id);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Study Program',
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    )),
                onChanged: (String programId) {
                  getStudyProgramId(programId);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Student GPA',
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    )),
                onChanged: (String gpa) {
                  getStudentGpa(gpa);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text('CREATE'),
                  textColor: Colors.white,
                  onPressed: () {
                    createData();
                  },
                ),
                RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text('READ'),
                  textColor: Colors.white,
                  onPressed: () {
                    readData();
                  },
                ),
                RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text('UPDATE'),
                  textColor: Colors.white,
                  onPressed: () {
                    updateData();
                  },
                ),
                RaisedButton(
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text('DELETE'),
                  textColor: Colors.white,
                  onPressed: () {
                    deleteData();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
