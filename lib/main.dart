import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:imc/Interface/pagina_carregamento.dart';
import 'package:imc/boxes.dart';
import 'package:imc/models/imc_model.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ImcModelAdapter());
  boxImc = await Hive.openBox<ImcModel>('imcBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const SplashPage(),
      theme: ThemeData(
        textTheme: GoogleFonts.didactGothicTextTheme(),
        primarySwatch: Colors.cyan,
      ),
    );
  }
}
