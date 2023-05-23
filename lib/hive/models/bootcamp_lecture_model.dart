import 'package:hive/hive.dart';

part 'bootcamp_lecture_model.g.dart';

@HiveType(typeId: 0)
// In Hive you can extend HiveObject to manage your objects easily.
// HiveObject provides the key of your object and useful helper methods like save() or delete().
class BootcampLecture extends HiveObject {
  // Example: Use HiveField(0, defaultValue: 'your_value') to set default value
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime date;

  // Relationships? https://docs.hivedb.dev/#/custom-objects/relationships

  BootcampLecture(this.name, this.description, this.date);
}

// To generate the adapter, run the following command:
// flutter packages pub run build_runner build
