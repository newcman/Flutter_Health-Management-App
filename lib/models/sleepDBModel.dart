/* 数据模型 */
import 'package:bp_notepad/db/sleep_databaseProvider.dart';

class SleepDB {
  int? id;
  double sleep;
  int state;
  String date;

  SleepDB({this.id, required this.sleep, required this.state, required this.date});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SleepDataBaseProvider.COLUMN_ID: id,
      SleepDataBaseProvider.COLUMN_SLEEP: sleep,
      SleepDataBaseProvider.COLUMN_STATE: state,
      SleepDataBaseProvider.COLUMN_TIME: date
    };
    if (id != null) {
      map[SleepDataBaseProvider.COLUMN_ID] = id;
    }
    return map;
  }

  static fromMap(Map<String, dynamic> map) {
    return SleepDB(id : map[SleepDataBaseProvider.COLUMN_ID],
        sleep : map[SleepDataBaseProvider.COLUMN_SLEEP],
        state : map[SleepDataBaseProvider.COLUMN_STATE],
        date : map[SleepDataBaseProvider.COLUMN_TIME]);
  }
}
