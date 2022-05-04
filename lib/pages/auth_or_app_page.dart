import 'package:flutter/material.dart';
import 'package:projeto_chat/core/models/chat_user.dart';
import 'package:projeto_chat/core/services/auth/auth_mock_service.dart';
import 'package:projeto_chat/pages/auth_page.dart';
import 'package:projeto_chat/pages/chat_page.dart';
import 'package:projeto_chat/pages/loading_page.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StreamBuilder<ChatUser?>(
        stream: AuthMockService().userChanges,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          } else {
            return snapshot.hasData ? const ChatPage() : const AuthPage();
          }
        },
      )),
    );
  }
}
