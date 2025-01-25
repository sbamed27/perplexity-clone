import 'dart:convert';
import 'package:web_socket_client/web_socket_client.dart';

class ChatWebService {
  static final _instance = ChatWebService._internal();
  factory ChatWebService() => _instance;
  ChatWebService._internal();

  WebSocket? _socket;

  void connect() {
    _socket = WebSocket(Uri.parse("ws://localhost:8000/ws/chat"));

    _socket!.messages.listen((message) {
      final data = json.decode(message);
      data['type'] == 'result_content' ? print(data['content']) : print('null');
    });
  }

  void chat(String query) {
    _socket!.send(json.encode({"query": query}));
  }
}
