import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prova_flutter/app/custom/custom_app_theme.dart';
import 'package:prova_flutter/app/pages/common_widgets/login_text_field.dart';
import 'package:prova_flutter/app/pages/common_widgets/privacy_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required String title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final MaskTextInputFormatter userFormatter = MaskTextInputFormatter(
    mask: '####################',
    filter: {
      '#': RegExp(r'[0-9a-zA-Z]'),
    },
  );

  final MaskTextInputFormatter passwordFormatter = MaskTextInputFormatter(
    mask: '####################',
    filter: {
      '#': RegExp(r'[0-9a-zA-Z]'),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 250,
          ),
          decoration: CustomAppTheme.gradientBackground,
          child: Column(
            children: [
              _buildTextFormField(
                label: 'Usuário',
                icon: Icons.person,
                inputFormatters: [userFormatter],
              ),
              _buildTextFormField(
                label: 'Senha',
                icon: Icons.lock,
                inputFormatters: [passwordFormatter],
              ),
              _buildLoginButton(),
              const SizedBox(height: 70),
              const PrivacyButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required IconData icon,
    required List<TextInputFormatter> inputFormatters,
  }) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '  $label',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomTextField(
          icon: icon,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 50,
        width: 200,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.customButtonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          child: const Text(
            'Entrar',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
