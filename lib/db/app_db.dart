import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDataBase {
  /// private constructor (singleton)
AppDataBase._();

 static final AppDataBase instance = AppDataBase._();

 Database? myDB;

 // login pref key
static final String Login_UID = "login_id";

 // Table
static final String USER_TABLE = "users";
static final String EXP_TABLE = "expense";

// user columns
 static final String COLUMN_USER_ID = "uid";
 static final String COLUMN_USER_Name = "uName";
 static final String COLUMN_USER_EMAIL = "uEmail";
 static final String COLUMN_USER_PASS = "uPass";

 ///expense columns
 ///add uid here also
 static final String COLUMN_EXPENSE_ID = "expId";
 static final String COLUMN_EXPENSE_TITLE = "expTitle";
 static final String COLUMN_EXPENSE_DESC = "expDesc";
 static final String COLUMN_EXPENSE_TIMESTAMP = "expTimeStamp";
 static final String COLUMN_EXPENSE_AMT = "expAmt";
 static final String COLUMN_EXPENSE_BALANCE = "expBal";
 static final String COLUMN_EXPENSE_TYPE = "expType"; //0 for debit and 1 for credit
 static final String COLUMN_EXPENSE_CAT_TYPE = "expCatType";

 Future<Database> initDB ()async{
  var docDirectory = await getApplicationCacheDirectory();
  var dbPath =  join(docDirectory.path,"expenso.db" );
  return await openDatabase(dbPath , version: 1,onCreate: (db, version) {
  // user table
   db.execute("create table $USER_TABLE ( $COLUMN_USER_ID integer primary key autoincrement, $COLUMN_USER_Name text, $COLUMN_USER_EMAIL text, $COLUMN_USER_PASS text)");
  // expense table
   db.execute("create table $EXP_TABLE ( $COLUMN_EXPENSE_ID integet primary key autoincrement, $COLUMN_USER_ID integer, $COLUMN_EXPENSE_TITLE text, $COLUMN_EXPENSE_DESC text, $COLUMN_EXPENSE_TIMESTAMP text, $COLUMN_EXPENSE_AMT real, $COLUMN_EXPENSE_BALANCE real, $COLUMN_EXPENSE_TYPE integer, $COLUMN_EXPENSE_CAT_TYPE integer )");
  },
);
 }



Future<Database> getDB() async{
  if(myDB!= null){
   return myDB!;
  }else {
myDB = await initDB();
return myDB!;

  }
 }


 Future<int> getUID() async{
  var prefs = await SharedPreferences.getInstance();
  var uid = prefs.getInt(AppDataBase.Login_UID);
  return uid ?? 0;
 }



}