import 'package:chatapp/src/chat/widget/messagecard_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/config.dart';

class SearchUserScreen extends StatefulWidget {
  final FirebaseFirestore firestore;
  const SearchUserScreen({super.key, required this.firestore});

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          cursorColor: Colors.black,
          autofocus: true,
          onChanged: (text) {
            setState(() {
              search = text.trim();
            });
          },
          decoration: const InputDecoration(
            hintText: "Search users ...",
            border: InputBorder.none,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: widget.firestore.collection(userCollection).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List data = !snapshot.hasData ? [] : snapshot.data!.docs.where((element) => element['email'].toString().contains(search) || element['email'].toString().contains(search)).toList();
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: data.length,
            itemBuilder: (context, i) {
              Timestamp time = data[i]['date_time'];
              return MessageListCard(
                id: "${data[i].id}",
                name: data[i]['name'],
                photoUrl: data[i]['photo_url'],
                date: DateFormat('EEE hh:mm').format(time.toDate()),
              );
            },
          );
        },
      ),
    );
  }
}
