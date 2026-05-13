// ignore_for_file: strict_top_level_inference

class MessageModel {
  final String message;

  MessageModel({required this.message});

  factory MessageModel.fromJson(json) {
    return MessageModel(message: json['message']);
  }
}
