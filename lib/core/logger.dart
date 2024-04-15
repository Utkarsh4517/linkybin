import 'package:logger/logger.dart';

class PrintLog {
  static void print(String msg) {
    Logger(printer: PrettyPrinter()).d(msg);
  }
}
