import 'package:flutter/material.dart';
import 'package:my_expenses/Screens/login_screen.dart';
import 'package:my_expenses/custm_widget.dart';

class Signup_Screen extends StatelessWidget {

  @override
  Widget build (BuildContext context ){
    return Scaffold(

      backgroundColor: Colors.grey.shade300,
      body: Column(children: [
        SizedBox(height: 80,),
        Text("Create New Account",style: TextStyle(fontSize: 30),),
        SizedBox(height: 100,),
        /// user name
        AppTextfield(mlabelText: "Enter Email id", micon: Icon(Icons.account_circle), mkeyboardtype: TextInputType.name),
        SizedBox(height: 30,),
        /// password
        AppTextfield(mlabelText: "Password", micon: Icon(Icons.password), mkeyboardtype: TextInputType.visiblePassword),
        SizedBox(height: 30,),
        /// Confirm password
        AppTextfield(mlabelText: "Confirm Password", micon: Icon(Icons.password), mkeyboardtype: TextInputType.visiblePassword),
        SizedBox(height: 30,),
        /// login button
        AppElButton(m_backgroundColor: Colors.black, m_btName: "Create New Account", m_foregroundColor: Colors.white,
            m_onPressed: (){
          Navigator.pop(context);
        }),
        SizedBox(height: 30,),

        Divider(),
        SizedBox(height: 15,),
        Text("Allready have an account ?"),
        SizedBox(height: 15,),
        AppElButton(m_backgroundColor: Colors.black, m_btName: "Login", m_foregroundColor: Colors.white,
            m_onPressed: (){
           Navigator.pop(context);
            }),

 ],),

    );

  }

}