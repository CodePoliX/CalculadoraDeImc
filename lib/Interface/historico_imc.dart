import 'package:flutter/material.dart';
import 'package:imc/calculadora.dart';

class HistoricoImc extends StatelessWidget {
  final List<Calculadora> story; // Membro de classe para armazenar a lista

  HistoricoImc(this.story); // Construtor para receber a lista

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Histórico de Imc"),
        ),
        body: ListView.builder(
          reverse: true,
          itemCount: story.length, // Usar o comprimento da lista
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'IMC: ',
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        TextSpan(
                            text:
                                '${story[index].getImc().toStringAsFixed(2)} | ',
                            style: const TextStyle(fontSize: 18)),
                        const TextSpan(
                          text: 'Classificação: ',
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        TextSpan(
                            text: '${story[index].getMensagem()}.',
                            style: const TextStyle(
                              fontSize: 19,
                            )),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black, // Cor da linha de divisão
                  thickness: 1.0, // Espessura da linha de divisão
                ),
              ],
            );
          },
        ),
        backgroundColor: Colors.cyanAccent,
      ),
    );
  }
}
