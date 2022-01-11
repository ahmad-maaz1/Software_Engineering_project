class DepartmentModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? departmentName;

  DepartmentModel(
      {this.uid, this.firstName, this.secondName, this.departmentName,this.email});

  // receiving data from server
  factory DepartmentModel.fromMap(map) {
    return DepartmentModel(
      uid: map['did'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      email: map['email'],
      departmentName: map['departmentName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'did': uid,
      'firstName': firstName,
      'secondName': secondName,
      'email' : email,
      'departmentName': departmentName,
    };
  }
}
