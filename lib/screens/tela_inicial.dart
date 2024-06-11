import 'package:flutter/material.dart';
import 'ponto_screen.dart';

class TelaInicial extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ponto Eletrônico',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Identificação do Usuário',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela principal do ponto
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PontoScreen(usuario: _controller.text),
                  ),
                );
              },
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
