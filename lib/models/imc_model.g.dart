// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcModelAdapter extends TypeAdapter<ImcModel> {
  @override
  final int typeId = 0;

  @override
  ImcModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImcModel(
      altura: fields[2] as double,
      classe: fields[1] as String,
      imc: fields[0] as double,
      peso: fields[3] as double,
      data: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImcModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.imc)
      ..writeByte(1)
      ..write(obj.classe)
      ..writeByte(2)
      ..write(obj.altura)
      ..writeByte(3)
      ..write(obj.peso)
      ..writeByte(4)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
