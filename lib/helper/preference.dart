import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class Pref {
  static late Box box;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = dir.path;

    box = Hive.box(name: "Mybox");
  }

  static bool get showonboard => box.get("showonboard", defaultValue: true);
  static set showonboard(bool v) => box.put("showonboard", v);
  
}
