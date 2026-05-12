// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/widgets/chat_buble.dart';
import 'package:chat_app/core/widgets/custom_border_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              // Replace with actual chat messages count
              itemBuilder: (context, index) {
                return ChatBuble();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: messageController,
              onSubmitted: (value) {
                messages.add({'message': value});
                messageController.clear();
              },
              decoration: InputDecoration(
                hintText: "Send Message",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                border: borderBuilder(radius: 32),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: AppColors.primary),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
