library flutter_discord_logger;

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Discord {
  Discord._();

  String? appName;
  String? webhookUrl;

  @required
  Discord({@required this.appName, @required this.webhookUrl}) {
    Discord._();
  }

  /// [send] send message to discord channel
  /// [message] custom messages
  /// [timer] delay , default set to 1 second
  @required
  Future<void> send({@required String? message, int? timer = 1}) async {
    Uri url = Uri.parse(webhookUrl!);

    Future.delayed(Duration(seconds: timer!), () async {
      await http.post(
        url,
        body: {
          'username': appName,
          'content': message,
        },
      );
    });
  }
}
