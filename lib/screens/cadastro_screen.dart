import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _cadastrar(BuildContext context) {
    final String user = _userController.text;
    final String password = _passwordController.text;

    // Aqui você pode adicionar lógica para salvar os dados do novo usuário
    // Por simplicidade, estamos apenas exibindo uma mensagem e retornando para a tela de login

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Usuário $user cadastrado com sucesso!')),
    );

    Navigator.pop(context); // Voltar para a tela de login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userController,
              decoration: InputDecoration(
                labelText: 'Usuário',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _cadastrar(context),
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
