import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/widgets/chat_buble.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        // Replace with actual chat messages count
        itemBuilder: (context, index) {
          return ChatBuble();
        },
      ),
    );
  }
}
