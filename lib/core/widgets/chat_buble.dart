import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                message.message,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(width: 8),
            Text(
              "${message.createdAt.hour}:${message.createdAt.minute}",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            SizedBox(width: 8),

            Icon(Icons.done_all, size: 16, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                message.message,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(width: 8),
            Text(
              "${message.createdAt.hour}:${message.createdAt.minute}",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
