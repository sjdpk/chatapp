import 'package:chatapp/src/utils/textstyle.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? profileUrl;
  final String name;
  final bool isRecent;
  const ProfileImage({super.key, required this.name, this.profileUrl, this.isRecent = false});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: isRecent ? 32 : null,
      backgroundColor: Colors.pink,
      child: CircleAvatar(
        radius: isRecent ? 30 : null,
        backgroundImage: profileUrl != null ? NetworkImage(profileUrl!) : null,
        child: profileUrl == null
            ? Text(
                name.substring(0, 1).toUpperCase(),
                style: textStyle(weight: FontWeight.bold, size: isRecent ? 30 : 20),
              )
            : null,
      ),
    );
  }
}
