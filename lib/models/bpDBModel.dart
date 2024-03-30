/* 数据模型 */
import 'package:bp_notepad/db/bp_databaseProvider.dart';

class BloodPressureDB {
  int? id;
  int sbp;
  int dbp;
  int hr;
  int state = 0;
  String date;

  BloodPressureDB(
      {this.id,
      required this.sbp,
      required this.dbp,
      required this.hr, this.state = 0,
      required this.date});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      BpDataBaseProvider.COLUMN_ID: id,
      BpDataBaseProvider.COLUMN_SBP: sbp,
      BpDataBaseProvider.COLUMN_DBP: dbp,
      BpDataBaseProvider.COLUMN_HR: hr,
      BpDataBaseProvider.COLUMN_TIME: date,
      BpDataBaseProvider.COLUMN_STATE: state,
    };
    if (id != null) {
      map[BpDataBaseProvider.COLUMN_ID] = id;
    }
    return map;
  }

  static fromMap(Map<String, dynamic> map) {
    return BloodPressureDB(
        id: map[BpDataBaseProvider.COLUMN_ID],
        sbp: map[BpDataBaseProvider.COLUMN_SBP] ?? 0,
        dbp: map[BpDataBaseProvider.COLUMN_DBP] ?? 0,
        hr: map[BpDataBaseProvider.COLUMN_HR] ?? 0,
        state:map[BpDataBaseProvider.COLUMN_STATE] ?? 0,
        date: map[BpDataBaseProvider.COLUMN_TIME]??""
    );
  }
}
