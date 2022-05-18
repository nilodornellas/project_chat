import 'dart:async';
import 'dart:math';

import '../../models/chat_message.dart';
import '../../models/chat_user.dart';
import 'chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      title: 'Bom dia',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Ian',
      userImageUrl: 'assets\images\avatar.png',
    ),
    ChatMessage(
      id: '2',
      title: 'Bom dia. Teremos reunião hoje?',
      createdAt: DateTime.now(),
      userId: '456',
      userName: 'Nery',
      userImageUrl: 'assets\images\avatar.png',
    ),
    ChatMessage(
      id: '1',
      title: 'Sim. Pode ser agora!',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Ian',
      userImageUrl: 'assets\images\avatar.png',
    ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      title: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageUrl,
    );

    _msgs.add(newMessage);
    _controller?.add(_msgs);

    return newMessage;
  }
}
