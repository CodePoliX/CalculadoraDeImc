import 'package:hive/hive.dart';

part 'imc_model.g.dart';

@HiveType(typeId: 0)
class ImcModel extends HiveObject {
  @HiveField(0)
  double imc;

  @HiveField(1)
  String classe;

  @HiveField(2)
  double altura;

  @HiveField(3)
  double peso;

  @HiveField(4)
  String data;

  ImcModel(
      {required this.altura,
      required this.classe,
      required this.imc,
      required this.peso,
      required this.data});
}
