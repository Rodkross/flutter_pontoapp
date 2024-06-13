import 'package:flutter/material.dart';
import 'tela_inicial.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaInicial(usuario: _userController.text),
                  ),
                );
              },
              child: Text('Entrar'),
            ),
            TextButton(
              onPressed: () {
                // Navegar para a tela de cadastro
              },
              child: Text('Cadastrar'),
            ),
            TextButton(
              onPressed: () {
                // Navegar para a tela de esqueci minha senha
              },
              child: Text('Esqueci minha senha'),
            ),
          ],
        ),
      ),
    );
  }
}
