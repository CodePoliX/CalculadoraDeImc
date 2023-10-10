import 'package:flutter/material.dart';
import 'package:imc/Interface/historico_imc.dart';
import 'package:imc/boxes.dart';
import 'package:imc/class/calculadora.dart';
import 'package:uuid/uuid.dart';
import 'package:imc/models/imc_model.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  var alturaControler = TextEditingController();
  var pesoControler = TextEditingController();
  late Calculadora atual;
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyanAccent,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Image.asset("lib/images/iconeApp.png"),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      'Calculadora de Imc',
                      style: TextStyle(
                        fontSize: 40,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = const Color.fromARGB(255, 9, 32, 50),
                      ),
                    ),
                    // Solid text as fill.
                    const Text(
                      'Calculadora de Imc',
                      style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(255, 249, 189, 25),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(flex: 2, child: Container()),
                    const Expanded(
                      child: Text(
                        "Peso:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                    ),
                    Expanded(flex: 4, child: Container()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      flex: 7,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: pesoControler,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.balance),
                          iconColor: Colors.black,
                          fillColor: Colors.amber,
                          filled: true,
                          hintText: '00.00',
                        ),
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(flex: 2, child: Container()),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        "Altura:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                    ),
                    Expanded(flex: 4, child: Container()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      flex: 7,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: alturaControler,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.height),
                          iconColor: Color.fromARGB(255, 9, 41, 66),
                          fillColor: Colors.amber,
                          filled: true,
                          hintText: '0.00',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {
                          try {
                            setState(() {
                              atual = Calculadora(
                                  double.parse(pesoControler.text),
                                  double.parse(alturaControler.text));
                              boxImc.put(
                                  'key_${uuid.v4()}',
                                  ImcModel(
                                      altura: atual.getAltura(),
                                      classe: atual.getClasse(),
                                      imc: atual.getImc(),
                                      peso: atual.getPeso(),
                                      data: DateTime.now().toString()));

                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                      title: Text("${atual.getClasse()}!"),
                                      content: Text(atual.getMensagem()),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HistoricoImc()));
                                            },
                                            child: const Text(
                                              "Ver últimos resultados",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 9, 32, 50),
                                                  fontSize: 16),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Dispensar",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 9, 32, 50),
                                                    fontSize: 16))),
                                      ],
                                      elevation: 24.0,
                                      backgroundColor: Colors.amber,
                                      shape: Border.all(width: 2)));
                            });
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Apenas números com o formato 00.00 e 0.00 são aceitos.")),
                            );
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.amber),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        child: const Text("Calcular",
                            style: TextStyle(
                                color: Color.fromARGB(255, 9, 32, 50),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
