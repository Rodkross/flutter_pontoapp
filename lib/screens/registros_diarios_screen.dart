
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                String formattedDate =
                    DateFormat('dd/MM/yyyy').format(ponto.data); // Formatação da data

                // Cálculo do total da jornada trabalhada
                Duration jornadaTrabalhada = _calcularJornadaTrabalhada(ponto);

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      'Data: $formattedDate', // Exibição da data formatada
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRegistroItem('Entrada:', ponto.entrada),
                        _buildRegistroItem('Início Intervalo:', ponto.inicioIntervalo),
                        _buildRegistroItem('Fim Intervalo:', ponto.fimIntervalo),
                        _buildTotalJornadaItem(jornadaTrabalhada),
                        _buildRegistroItem('Saída:', ponto.saida),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  // Função para calcular a jornada trabalhada
  Duration _calcularJornadaTrabalhada(Ponto ponto) {
    Duration jornadaTrabalhada = Duration.zero;

    if (ponto.saida != null && ponto.entrada != null) {
      jornadaTrabalhada += ponto.saida!.difference(ponto.entrada!);
    }

    if (ponto.fimIntervalo != null && ponto.inicioIntervalo != null) {
      jornadaTrabalhada += ponto.fimIntervalo!.difference(ponto.inicioIntervalo!);
    }

    return jornadaTrabalhada;
  }

  Widget _buildRegistroItem(String label, DateTime? value) {
    String formattedValue = value != null ? DateFormat.Hm().format(value) : 'Não registrado';
    return Row(
      children: <Widget>[
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Text(
          formattedValue,
        ),
      ],
    );
  }

  Widget _buildTotalJornadaItem(Duration jornadaTrabalhada) {
    String formattedJornada = _formatDuration(jornadaTrabalhada);
    return Row(
      children: <Widget>[
        Text(
          'Total da Jornada:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Text(
          formattedJornada,
        ),
      ],
    );
  }

  // Função para formatar a duração no formato HH:mm
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes";
  }
}
