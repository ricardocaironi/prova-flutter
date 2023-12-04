import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyButton extends StatelessWidget {
  const PrivacyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Uri privacyUrl = Uri.parse("https://www.google.com.br/");

    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextButton(
        onPressed: () {
          launchUrl(privacyUrl);
        },
        child: const Text(
          'Política de Privacidade',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

