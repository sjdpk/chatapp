import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/search_user.dart';

class SearchWidget extends StatelessWidget {
  final FirebaseFirestore firestore;
  const SearchWidget({super.key, required this.firestore});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SearchUserScreen(firestore: firestore);
        }));
      },
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.8)),
          boxShadow: const [
            BoxShadow(offset: Offset(1, 1), color: Colors.black)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Search Users ..."),
            Icon(Icons.search),
          ],
        ),
      ),
    );
  }
}
