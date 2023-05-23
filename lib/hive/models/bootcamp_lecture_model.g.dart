// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bootcamp_lecture_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BootcampLectureAdapter extends TypeAdapter<BootcampLecture> {
  @override
  final int typeId = 0;

  @override
  BootcampLecture read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BootcampLecture(
      fields[0] as String,
      fields[1] as String,
      fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BootcampLecture obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BootcampLectureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
