import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelmaintenance/department_home.dart';
import 'package:hostelmaintenance/department_model.dart';
import 'package:hostelmaintenance/new_complaint_model.dart';
import 'package:hostelmaintenance/student_model.dart';

class DepartmentComplaintScreen extends StatefulWidget {
  const DepartmentComplaintScreen({Key? key}) : super(key: key);

  @override
  _DepartmentComplaintScreenState createState() =>
      _DepartmentComplaintScreenState();
}

class _DepartmentComplaintScreenState extends State<DepartmentComplaintScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  //NewComplaintModel loggedInUser1 = NewComplaintModel();
  // StudentModel loggedInUser = StudentModel();
  DepartmentModel loggedInUser = DepartmentModel();
  // void delete()async{
  //   FirebaseFirestore.instance.collection('Complaints').where('')
  // }
  //firestoreInstance .collection("eventDetails").where()//doc("you need to pass the documentID in your eventdetails collection here") .delete()
  // deleteData() async {
  //   CollectionReference collectionReference =
  //       FirebaseFirestore.instance.collection('Complaints');
  //   QuerySnapshot querySnapshot = collectionReference.get().;
  // }

  get index => null;
  @override
  void initState() {
    super.initState();
    // FirebaseFirestore.instance
    //     .collection("Students")
    //     .doc(user?.uid)
    //     .get()
    //     .then((value) {
    //   this.loggedInUser = StudentModel.fromMap(value.data());
    FirebaseFirestore.instance
        .collection("Department")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = DepartmentModel.fromMap(value.data());
      setState(() {});
    });
  }

//user?.uid

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All ${loggedInUser.departmentName} Complaints',
          style: TextStyle(color: Colors.amberAccent[200]),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.amberAccent[200],
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DepartmentHomeScreen()));
            }),
      ),
      backgroundColor: Colors.grey[900],
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Complaints')
            .where('title', isEqualTo: '${loggedInUser.departmentName}')
            // .orderBy('title')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              // if (user?.uid == loggedInUser1.complaintId) {}
              return Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amberAccent, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.title,
                                color: Colors.amberAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'TITLE : ' + document['title'],
                                style:
                                    TextStyle(color: Colors.amberAccent[200]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          //margin: EdgeInsets.all(30),
                          width: 300,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.description,
                                color: Colors.amberAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  'DESCRIPTION : ' + document['description'],
                                  softWrap: true,
                                  maxLines: 5,
                                  style: TextStyle(
                                    color: Colors.amberAccent[200],
                                  ),
                                ),
                              ),
                              // maxLength: 200,
                              // maxLines: 5,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.room,
                                color: Colors.amberAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('ROOM NUMBER : ' + document['roomNum'],
                                  style: TextStyle(
                                      color: Colors.amberAccent[200])),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.house,
                                color: Colors.amberAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'HOSTEL NUMBER : ' + document['hostelNum'],
                                style:
                                    TextStyle(color: Colors.amberAccent[200]),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.amberAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  'PHONE NUMBER : ' + document['phoneNum'],
                                  style:
                                      TextStyle(color: Colors.amberAccent[200]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

//  @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
// @override
// Widget build(BuildContext context) {
//   // TODO: implement build
//   throw UnimplementedError();
// }
}
