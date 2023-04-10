class UserModel {
  final String displayName;
  final String email;
  String? photoUrl;
  final String uid;

  UserModel({required this.displayName, required this.email, required this.photoUrl, required this.uid});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      displayName: json['display_name'] ?? '',
      email: json['email'] ?? '',
      photoUrl: json['photo_url'],
      uid: json['uid'] ?? '',
    );
  }
}
