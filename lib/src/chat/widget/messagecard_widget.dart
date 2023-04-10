import 'package:flutter/material.dart';

import '../screens/chatpage.dart';
import 'profile_widget.dart';

class MessageListCard extends StatelessWidget {
  final String id, name;
  final String? photoUrl, lastMsg, date;
  const MessageListCard({super.key, required this.id, required this.name, this.photoUrl, this.lastMsg, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.withOpacity(0.1))),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ChatPage(
                  id: id,
                  name: name,
                );
              },
            ),
          );
        },
        leading: ProfileImage(name: name, profileUrl: photoUrl),
        title: Text(name),
        subtitle: lastMsg != null ? Text(lastMsg ?? "") : null,
        trailing: Text(date ?? ""),
      ),
    );
  }
}
