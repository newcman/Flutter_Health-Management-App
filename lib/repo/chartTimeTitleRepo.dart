/// 获取时间title
class TimeTitleRepo {
  static const int WEEK = 7;
  static const int MONTH = 30;
  static const int HALF_YEAR = 180;
  static const int YEAR = 360;

  static String getTitle(int value, int type) {
    switch (type) {
      case WEEK:
        return getWeek(value);
      case MONTH:
        return getMonth(value);
      case HALF_YEAR:
        return getHalfYear(value);
      case YEAR:
        return getYear(value);
    }
    return "";
  }

  /// value :0-6,返回month.day,如5.8
  static String getWeek(int value) {
    var day = DateTime.now().add(Duration(days: value - (WEEK - 1)));
    return "${day.month}.${day.day}";
  }

  /// 1月，总过显示10次，每隔3天显示一次
  /// value: 0-29,
  ///
  static String getMonth(int value) {
    print(" getMonth $value");
    if ((value + 1) % 3 == 0) {
      var day = DateTime.now().add(Duration(days: value - (MONTH - 1)));
      return "${day.month}.${day.day}";
    }
    return "";
  }

  /// 半年，总过显示10次，每隔18天显示一次
  /// value: 0-179,
  ///
  static String getHalfYear(int value) {
    print(" getHalfYear $value");
    if ((value + 1) % 18 == 0) {
      var day = DateTime.now().add(Duration(days: value - (HALF_YEAR - 1)));
      print(" getHalfYear $value ${day.month}.${day.day}");
      return "${day.month}.${day.day}";
    }
    return "";
  }

  /// 1年，总过显示10次，每隔36天显示一次
  /// value: 0-359,
  ///
  static String getYear(int value) {
    if ((value + 1) % 36 == 0) {
      var day = DateTime.now().add(Duration(days: value - (YEAR - 1)));
      return "${day.month}.${day.day}";
    }
    return "";
  }
}
