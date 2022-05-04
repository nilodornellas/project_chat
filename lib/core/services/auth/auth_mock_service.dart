import 'dart:io';

import 'package:projeto_chat/core/services/auth/auht_service.dart';

import '../../models/chat_user.dart';

class AuthMockService implements AuthService {
  ChatUser? get currentUser {
    return null;
  }

  Stream<ChatUser?> get userChanges {}

  Future<void> signup(
    String name,
    String email,
    String password,
    File image,
  ) async {}

  Future<void> login(
    String email,
    String password,
  ) async {}

  Future<void> logout() async {}
}
