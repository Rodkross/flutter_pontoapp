import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ponto_provider.dart';
import '../models/ponto.dart';

class RegistrosDiariosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pontoProvider = Provider.of<PontoProvider>(context);
    var registros = pontoProvider.registros;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registros Diários'),
      ),
      body: registros.isEmpty
          ? Center(
              child: Text('Nenhum registro encontrado.'),
            )
          : ListView.builder(
              itemCount: registros.length,
              itemBuilder: (context, index) {
                Ponto ponto = registros[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      'Data: ${pontoProvider.formatDateTime(ponto.data)}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Entrada: ${pontoProvider.formatDateTime(ponto.entrada)}'),
                        Text(
                            'Saída: ${pontoProvider.formatDateTime(ponto.saida)}'),
                        Text(
                            'Início Intervalo: ${pontoProvider.formatDateTime(ponto.inicioIntervalo)}'),
                        Text(
                            'Fim Intervalo: ${pontoProvider.formatDateTime(ponto.fimIntervalo)}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
