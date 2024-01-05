class DataStaff {
  final String staffId;
  final String staffName;
  final String staffHobby;
  final String staffPassword;
  final String staffPassword2;
  DataStaff({
    required this.staffId,
    required this.staffName,
    required this.staffHobby,
    required this.staffPassword,
    required this.staffPassword2,
  });

  factory DataStaff.fromJson(Map<String, dynamic> json) {
    return DataStaff(
      staffId: json["staffId"],
      staffName: json["staffName"],
      staffHobby: json["staffHobby"],
      staffPassword: json["staffPassword"],
      staffPassword2: json["staffPassword2"],
    );
  }

  Map<String, dynamic> get toJson {
    return {
      "staffId": staffId,
      "staffName": staffName,
      "staffHobby": staffHobby,
      "staffPassword": staffPassword,
      "staffPassword2": staffPassword2,
    };
  }
}
