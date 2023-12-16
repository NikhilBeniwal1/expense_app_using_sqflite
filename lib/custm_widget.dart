import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget{
  String mlabelText;
  Widget micon;
  TextInputType mkeyboardtype;
  AppTextfield({required this.mlabelText, required this.micon ,
    required this.mkeyboardtype , });
  @override
  Widget build(BuildContext context) {
   return SizedBox(
     width: MediaQuery.of(context).size.width *0.8,
     child: TextField(
       keyboardType: mkeyboardtype,
       decoration: InputDecoration(

           border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
           labelText: mlabelText,
           suffixIcon: micon
       ),

     ),
   );

  }
}

class AppElButton extends StatelessWidget{
  Color m_backgroundColor;
  Color m_foregroundColor;
  String m_btName;
  void Function()? m_onPressed;

  AppElButton({
    required this.m_backgroundColor,
    required this.m_btName,
    required this.m_foregroundColor,
    required this.m_onPressed
  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton(onPressed: m_onPressed, child: Text(m_btName),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width *0.9, 50)),
        backgroundColor: MaterialStateProperty.all<Color>(m_backgroundColor),
        foregroundColor: MaterialStateProperty.all(m_foregroundColor,),
      ),
    );
  }


}


