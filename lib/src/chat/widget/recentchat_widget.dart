import 'package:chatapp/src/utils/textstyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../config/config.dart';
import '../screens/chatpage.dart';
import 'profile_widget.dart';

class RecentChatWidget extends StatelessWidget {
  final FirebaseFirestore firestore;
  const RecentChatWidget({super.key, required this.firestore});

  @override
  Widget build(BuildContext context) {
    appStore.setLoading(loading: false);

    return SizedBox(
      height: 100,
      child: StreamBuilder(
        stream: firestore.collection(messageCollection).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List data = !snapshot.hasData ? [] : snapshot.data!.docs.where((element) => element['users'].toString().contains(FirebaseAuth.instance.currentUser!.uid)).toList();
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, i) {
              List users = data[i]['users'];
              var friend = users.where((element) => element != FirebaseAuth.instance.currentUser!.uid);
              var user = friend.isNotEmpty ? friend.first : users.where((element) => element == FirebaseAuth.instance.currentUser!.uid).first;
              return FutureBuilder(
                future: firestore.collection(userCollection).doc(user).get(),
                builder: (context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return ChatPage(id: user, name: snap.data['name']);
                        }));
                      },
                      child: Column(
                        children: [
                          ProfileImage(profileUrl: snap.data['photo_url'], name: snap.data['name'], isRecent: true),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: 80,
                            child: Text(
                              snap.data['name'],
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              style: textStyle(weight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
