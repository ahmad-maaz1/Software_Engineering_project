import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hostelmaintenance/new_complaint_model.dart';
import 'package:hostelmaintenance/student_home_screen.dart';
import 'package:hostelmaintenance/student_model.dart';
// import 'package:provider/provider.dart';

class CurrentComplaintScreen extends StatefulWidget {
  const CurrentComplaintScreen({Key? key}) : super(key: key);

  @override
  _CurrentComplaintScreenState createState() => _CurrentComplaintScreenState();
}

class _CurrentComplaintScreenState extends State<CurrentComplaintScreen> {
  //  List<NewComplaintModel> list = [];
  User? user = FirebaseAuth.instance.currentUser;
  NewComplaintModel loggedInUser1 = NewComplaintModel();
  StudentModel loggedInUser = StudentModel();

  get index => null;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Students")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = StudentModel.fromMap(value.data());
      // FirebaseFirestore.instance
      //     .collection("Complaints")
      //     .doc(user?.uid)
      //     .get()
      //     .then((value) {
      //   this.loggedInUser1 = NewComplaintModel.fromMap(value.data());
      setState(() {});
    });
    // });
  }

//user?.uid

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your current complaints',
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StudentHomeScreen()));
            }),
      ),
      backgroundColor: Colors.grey[900],
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Complaints')
              .where('studentId', isEqualTo: '${loggedInUser.sid}')
              //.orderBy('title')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                  child: Text(
                    'No Complaints have been registered by you',
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                    ),
                  ),
                ),
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
                              border: Border.all(
                                  color: Colors.transparent, width: 2),
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
                              border: Border.all(
                                  color: Colors.transparent, width: 2),
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
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );

            // return Text("${user?.uid},${loggedInUser1.complaintId}");
            // return ListView(
            //   children: snapshot.data!.docs.map((document) {
            //     return Center(
            //       child: SingleChildScrollView(
            //         child: Container(
            //           width: MediaQuery.of(context).size.width / 1.2,
            //           height: MediaQuery.of(context).size.width / 6,
            //           child: Text('Title:' + document['title']),
            //         ),
            //       ),
            //     );
            //   }).toList(),
            // );
          }),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   // TODO: implement build
//   throw UnimplementedError();
// }
