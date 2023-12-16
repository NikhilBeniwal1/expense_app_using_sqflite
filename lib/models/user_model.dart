
import '../db/app_db.dart';

class UserModel {

  int uId;
  String uName;
  String uEmail;
  String uPassword;


  UserModel({
    required this.uId,
    required this.uName,
    required this.uEmail,
    required this.uPassword

  });

  factory UserModel.fromMap(Map<String,dynamic> map){
  return UserModel(
      uId: map[AppDataBase.COLUMN_USER_ID],
      uName: map[AppDataBase.COLUMN_USER_Name],
      uEmail: map[AppDataBase.COLUMN_USER_EMAIL],
      uPassword: map[AppDataBase.COLUMN_USER_PASS]
  );
  }
  Map<String,dynamic> toMap(){
  return {
    AppDataBase.COLUMN_USER_ID : uId,
    AppDataBase.COLUMN_USER_Name : uName,
    AppDataBase.COLUMN_USER_EMAIL : uEmail,
    AppDataBase.COLUMN_USER_PASS : uPassword,
  };
  }


  }

