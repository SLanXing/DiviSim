import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class LocalFileTool {
  static LocalFileTool _instance = new LocalFileTool._internal();

  factory LocalFileTool() => instance();

  LocalFileTool._internal();

  static String _appDir;

  static LocalFileTool instance() {
    if (_instance == null) {
      _instance = new LocalFileTool._internal();
    }
    return _instance;
  }


  Future<String> get _getAppDir async {
    if (_appDir == null || _appDir == "") {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      _appDir = appDocDir.path;
    }
    return _appDir;
  }


  Future<File> _getLocalFile(String path) async {
    File file = new File(path);
    if (await file.exists()) {
      return file;
    } else {
      throw FileSystemException("未发现该文件：$path");
    }
  }

  void getLocalBDFile(String filename) async {
    String docDir = await _getAppDir;
    String filePath = join(docDir, "asset", "basicdata", filename);
    print("LocalFileTool:getLocalBDFile:$filePath");
    try {
      File file = await _getLocalFile(filePath);
      print("=====LocalFileTool=====");
      print(file.readAsStringSync());
      print("=====LocalFileTool=====");
    } on FileSystemException catch (e) {
      print("LocalFileTool:该文件不存在:$e");
    } catch (e) {
      print("LocalFileTool:未知错误'$e'");
    }
  }
}
