import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ponto_provider.dart';
import 'registros_diarios_screen.dart';

class PontoScreen extends StatelessWidget {
  final String usuario;

  PontoScreen({required this.usuario});

  @override
  Widget build(BuildContext context) {
    var pontoProvider = Provider.of<PontoProvider>(context);
    var registroAtual = pontoProvider.registroAtual;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Ponto'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrosDiariosScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20), // Espaço entre o AppBar e o nome do usuário
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Olá, $usuario.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30), // Espaço entre o nome do usuário e os registros
            _buildRegistroItem(
              'Entrada:',
              pontoProvider.formatDateTime(registroAtual?.entrada),
              registroAtual == null ? pontoProvider.registrarEntrada : null,
            ),
            _buildRegistroItem(
              'Início Intervalo:',
              pontoProvider.formatDateTime(registroAtual?.inicioIntervalo),
              registroAtual != null && registroAtual.inicioIntervalo == null ? pontoProvider.registrarInicioIntervalo : null,
            ),
            _buildRegistroItem(
              'Fim Intervalo:',
              pontoProvider.formatDateTime(registroAtual?.fimIntervalo),
              registroAtual != null && registroAtual.inicioIntervalo != null && registroAtual.fimIntervalo == null ? pontoProvider.registrarFimIntervalo : null,
            ),
            _buildRegistroItem(
              'Saída:',
              pontoProvider.formatDateTime(registroAtual?.saida),
              registroAtual != null && registroAtual.fimIntervalo != null && registroAtual.saida == null ? pontoProvider.registrarSaida : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegistroItem(String label, String? value, void Function()? onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          '$label $value',
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(onPressed != null ? 'Registrar' : 'Registrado', style: TextStyle(fontSize: 12)),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
