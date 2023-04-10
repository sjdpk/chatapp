import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/config.dart';

class LastSeenWidget extends StatelessWidget {
  final FirebaseFirestore firestore;
  final String docId;

  const LastSeenWidget({super.key, required this.firestore, required this.docId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestore.collection(userCollection).doc(docId).snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        return !snapshot.hasData
            ? Container()
            : Text(
                'Last seen : ${DateFormat('hh:mm a').format(snapshot.data!['date_time'].toDate())}',
                style: const TextStyle(fontSize: 10),
              );
      },
    );
  }
}
