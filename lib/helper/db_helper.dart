import 'package:final_exam_adv/model/contact%20_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();
  Database? _database;
  String dbName = "myDb";

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initData();
      return _database;
    }
  }

  Future<Database> initData() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'myDb.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $dbName (id INTEGER PRIMARY KEY, name TEXT, number INTEGER, email TEXT, category TEXT, favorite INTEGER)',
        );
      },
    );
  }

  Future<void> intoDataBase(
    var name,
    var number,
    var email,
    var category,
    var favorite,
  ) async {
    Database? db = await database;
    String sql =
        "INSERT INTO $dbName(name, number, email, category, favorite) VALUES(?, ?, ?, ?, ?)";
    List r = [name, number, email, category, favorite];
    await db!.rawInsert(sql, r);
  }

  Future<void> update(ContactModel model) async {
    Database? db = await database;
    await db?.update(
      dbName,
      ContactModel.toMap(model),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  Future<void> delete(int id) async {
    Database? db = await database;
    await db!.delete(dbName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, Object?>>> readData() async {
    final db = await database;
    return await db!.query(dbName);
  }
}
