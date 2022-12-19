class Users {
  String? email;
  String? fullName;
  String? id;
  String? phoneNumber;
  String? gender;
  String? avarter;
  String? age;
  String? location;
  Users({
    this.id,
    this.email,
    this.fullName,
    this.phoneNumber,
    this.avarter,
    this.location,
    this.age,
    this.gender,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'age': age,
        'phoneNumber': phoneNumber,
        'avarter': avarter,
        'location': location,
        'gender': gender,
      };

  static Users fromJson(Map<String, dynamic> json) => Users(
        email: json['email'],
        fullName: json['fullName'],
        id: json['id'],
        age: json['age'],
        gender: json['gender'],
        phoneNumber: json['phoneNumber'],
        avarter: json['avarter'],
        location: json['location'],
      );
}
