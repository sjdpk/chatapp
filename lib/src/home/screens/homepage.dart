import 'package:chatapp/src/auth/screens/userinfo_page.dart';
import 'package:chatapp/src/chat/widget/recentchat_widget.dart';
import 'package:chatapp/src/home/widgets/search_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../chat/screens/chatlist.dart';
import '../../config/config.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo.shade400,
        title: const Text(appName),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const UserInfoScreen()));
              },
              icon: const Icon(Icons.person_2))
        ],
      ),
      bottomSheet: SearchWidget(firestore: firestore),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecentChatWidget(firestore: firestore),
            const SizedBox(height: 20),
            Expanded(child: ChatListWidget(firestore: firestore))
          ],
        ),
      ),
    );
  }
}
