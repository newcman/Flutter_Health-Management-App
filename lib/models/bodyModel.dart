/* 数据模型 */
import 'package:bp_notepad/db/body_databaseProvider.dart';

class BodyDB {
  int? id;
  int gender;
  double bmi;
  double bf;
  double weight;
  String date;

  BodyDB(
      {this.id, required this.gender, required this.weight, required this.bmi, required this.bf, required this.date});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      BodyDataBaseProvider.COLUMN_ID: id,
      BodyDataBaseProvider.COLUMN_TIME: date,
      BodyDataBaseProvider.COLUMN_BMI: bmi,
      BodyDataBaseProvider.COLUMN_BF: bf,
      BodyDataBaseProvider.COLUMN_WEIGHT: weight,
      BodyDataBaseProvider.COLUMN_GENDER: gender,
    };
    if (id != null) {
      map[BodyDataBaseProvider.COLUMN_ID] = id;
    }
    return map;
  }

  static fromMap(Map<String, dynamic> map) {
    return BodyDB(id: map[BodyDataBaseProvider.COLUMN_ID],
        date: map[BodyDataBaseProvider.COLUMN_TIME],
        bmi: map[BodyDataBaseProvider.COLUMN_BMI],
        bf: map[BodyDataBaseProvider.COLUMN_BF],
        weight: map[BodyDataBaseProvider.COLUMN_WEIGHT],
        gender: map[BodyDataBaseProvider.COLUMN_GENDER]);
  }
}
