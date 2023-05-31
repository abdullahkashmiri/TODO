import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/task_model.dart';

class DBProvider {
  DBProvider._(); //constructor
  static final DBProvider dataBase = DBProvider._();
  static Database _database;

  // now create a getter for class
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDataBase();
    return _database;
  }
// database initiator
initDatabase() async {
return await openDatabase(join (await getDatabasesPath(),'todo_app_db.db'),
  onCreate: (db,version) async{
    await db.execute('''CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, task TEXT, creationDate TEXT)''');
  },
  version: 1);
}

//function to initillize our db

addNewTask(Task newTask) async {
final db = await database;
// insert
db.insert("tasks", newTask.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
}
Future<dynamic> getTask() async{
    final db = await database;
    var res = await db.query("tasks");
    if(res.length == 0) {
      return null;
    }
    else
Null;}
}