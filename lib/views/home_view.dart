// ignore_for_file: must_be_immutable

import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/widgets/chat_buble.dart';
import 'package:chat_app/core/widgets/custom_border_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Chat App",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: AppColors.primary,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return ChatBuble(message: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: messageController,
                    onSubmitted: (value) {
                      messages.add({
                        'message': value,
                        'createdAt': DateTime.now(),
                      });
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
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
