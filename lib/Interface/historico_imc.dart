import 'package:flutter/material.dart';
import 'package:imc/boxes.dart';
import 'package:imc/models/imc_model.dart';

class HistoricoImc extends StatelessWidget {
  const HistoricoImc({super.key});
  // Construtor para receber a lista
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Histórico de Imc"),
        ),
        body: FutureBuilder(
          future: _carregarRegistros(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Erro: ${snapshot.error}"));
            } else {
              var registros = snapshot.data as List<ImcModel>;
              return ListView.builder(
                itemCount: registros.length,
                itemBuilder: (context, index) {
                  ImcModel imcAtual = registros[index];
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
                                  text: '${imcAtual.imc.toStringAsFixed(2)} | ',
                                  style: const TextStyle(fontSize: 18)),
                              const TextSpan(
                                text: 'Classificação: ',
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              TextSpan(
                                  text:
                                      '${imcAtual.classe}. \n ${imcAtual.data}',
                                  style: const TextStyle(
                                    fontSize: 19,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
        backgroundColor: Colors.cyanAccent,
      ),
    );
  }

  Future<List<ImcModel>> _carregarRegistros() async {
    var box = boxImc;
    var registros = box.values.toList().cast<ImcModel>();
    registros.sort((a, b) => b.data.compareTo(a.data));
    return registros;
  }
}
