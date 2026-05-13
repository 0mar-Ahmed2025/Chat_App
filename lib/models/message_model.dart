// ignore_for_file: strict_top_level_inference

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String id;
  final DateTime createdAt;

  MessageModel({
    required this.message,
    required this.id,
    required this.createdAt,
  });

  factory MessageModel.fromJson(json) {
    return MessageModel(
      message: json['message'],
      id: json['id'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }
}
