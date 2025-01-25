import 'dart:convert';

import 'package:chatapp/Widgets/Constants.dart';

class Message {
  final String message;
  final String id;
  Message(this.message, this.id);
  factory Message.fromjson(jsonData) {
    return Message(jsonData[kMessage], jsonData['id']);
  }
}
