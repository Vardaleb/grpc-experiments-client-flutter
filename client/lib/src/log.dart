import 'package:logger/logger.dart';

class Log {
  static final Logger _instance = _initLogger();

  Log._internal();
  static Logger get instance => _instance;
  static Logger _initLogger() {
    return Logger();
  }
}
