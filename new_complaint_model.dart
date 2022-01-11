import 'package:cloud_firestore/cloud_firestore.dart';

class NewComplaintModel {
  String? title;
  String? description;
  String? studentId;
  String? hostelNum;
  String? roomNum;
  String? phoneNum;
    NewComplaintModel(
      {this.title,
      this.description,
      this.studentId,
      this.hostelNum,
      this.roomNum,
      this.phoneNum,
      });

  // receiving data from server
  factory NewComplaintModel.fromMap(map) {
    return NewComplaintModel(
      title: map['title'],
      description: map['description'],
      studentId: map['studentId'],
      hostelNum: map['hostelNum'],
      roomNum: map['roomNum'],
      phoneNum: map['phoneNum'],
      //cId: map['cId'],
    );
  }
  // DocumentReference documentReference =
  //     FirebaseFirestore.instance.collection('Complaints').doc();
  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'studentId': studentId,
      'hostelNum': hostelNum,
      'roomNum': roomNum,
      'phoneNum': phoneNum,
      // 'cId': documentReference.id,
    };
  }
}
