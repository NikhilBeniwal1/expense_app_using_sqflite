import 'package:flutter/material.dart';
import 'package:my_expenses/Screens/signup_screen.dart';
import 'package:my_expenses/custm_widget.dart';
import 'package:my_expenses/main.dart';

class Login_Screen extends StatelessWidget {

  @override
  Widget build (BuildContext context ){
    return Scaffold(

      backgroundColor: Colors.grey.shade300,
      body: Column(children: [
        SizedBox(height: 80,),
        Text("Login",style: TextStyle(fontSize: 30),),
        SizedBox(height: 100,),
        /// user name
        AppTextfield(mlabelText: "Enter Username", micon: Icon(Icons.account_circle), mkeyboardtype: TextInputType.name),
        SizedBox(height: 30,),
        /// password
        AppTextfield(mlabelText: "Password", micon: Icon(Icons.password), mkeyboardtype: TextInputType.visiblePassword),
        SizedBox(height: 30,),
        /// login button
        AppElButton(m_backgroundColor: Colors.black, m_btName: "Login", m_foregroundColor: Colors.white,
            m_onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
           return MyHomePage();
           },
          ));
            }),
        SizedBox(height: 30,),

        Divider(),
        SizedBox(height: 15,),
        Text("create account if you are new user"),
        SizedBox(height: 15,),
        AppElButton(m_backgroundColor: Colors.black, m_btName: "Creat New Account", m_foregroundColor: Colors.white,
            m_onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Signup_Screen(),));
            }
            ),
      ],),

    );

  }

}