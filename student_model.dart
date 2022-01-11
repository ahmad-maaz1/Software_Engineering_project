class StudentModel {
  String? sid;
  String? email;
  String? firstName;
  String? secondName;
  String? hostelNum;
  String? roomNum;
  String? regNum;
  String? phoneNum;


  StudentModel({this.sid, this.email, this.firstName, this.secondName,this.hostelNum,this.phoneNum,this.regNum,this.roomNum});

  // receiving data from server
  factory StudentModel.fromMap(map) {
    return StudentModel(
      sid: map['sid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      hostelNum: map['hostelNum'],
      roomNum: map['roomNum'],
      regNum: map['regNum'],
      phoneNum: map['phoneNum'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'sid': sid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'hostelNum': hostelNum,
      'roomNum': roomNum,
      'regNum': regNum,
      'phoneNum': phoneNum,
    };
  }
}
