import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseTool {
  static final DatabaseTool _instance = new DatabaseTool.internal();
  static const int VERSION = 1;
  static Database _db;

  factory DatabaseTool() => _instance;

  DatabaseTool.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    // 获取数据库存储路径
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "divisim.db");

    print("databasePath:$databasePath");

    var db = await openDatabase(path, version: VERSION, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    // 创建基础数据表
    // 基础分类表
    await db.execute(
        """CREATE TABLE basetype(
            id INTEGER PRIMARY KEY  AUTOINCREMENT,
            name_ch TEXT,
            name_en TEXT)"""
    );
  }

  Future<int> getCount(String dbName) async {
    /**
     * dbName: 表名
     * return: 对应表的数据数量
     */
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $dbName"));
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
