import 'package:chatapp/src/chat/widget/messagecard_widget.dart';
import 'package:chatapp/src/chat/widget/profile_widget.dart';
import 'package:chatapp/src/config/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/colors.dart';
import '../../utils/textstyle.dart';
import 'chatpage.dart';

class ChatListWidget extends StatelessWidget {
  final FirebaseFirestore firestore;

  const ChatListWidget({super.key, required this.firestore});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firestore.collection(messageCollection).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List data = !snapshot.hasData ? [] : snapshot.data!.docs.where((element) => element['users'].toString().contains(FirebaseAuth.instance.currentUser!.uid)).toList();
          if (data.isEmpty) return const Center(child: Text("No Convertation yet!"));
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) {
              List users = data[i]['users'];
              var friend = users.where((element) => element != FirebaseAuth.instance.currentUser!.uid);
              var user = friend.isNotEmpty ? friend.first : users.where((element) => element == FirebaseAuth.instance.currentUser!.uid).first;
              return FutureBuilder(
                future: firestore.collection(userCollection).doc(user).get(),
                builder: (context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    return MessageListCard(
                      id: user,
                      name: snap.data['name'],
                      photoUrl: snap.data['photo_url'],
                      lastMsg: data[i]['last_message'],
                      date: DateFormat('hh:mm a').format(data[i]['last_message_time'].toDate()),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            },
          );
        });
  }
}
