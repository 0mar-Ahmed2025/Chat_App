// ignore_for_file: strict_top_level_inference

class MessageModel {
  final String message;
  final String id;

  MessageModel({required this.message, required this.id});

  factory MessageModel.fromJson(json) {
    return MessageModel(message: json['message'], id: json['id']);
  }
}
