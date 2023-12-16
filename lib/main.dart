import 'package:flutter/material.dart';
import 'package:my_expenses/Screens/splash_screen.dart';

import 'Screens/login_screen.dart';
import 'assets_list.dart';
import 'custm_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  Splash_Screen(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// selected items
  String _selecteditem = "debit";

  /// List of drop Down items
  List<String> _dropdownitems = ["debit","credit"];

  int amount = 0;
  String title = "";
  String dec = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MyExpense App"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade300,
      body: Column(

        children: <Widget>[

          SizedBox(height: 30,),


          AppTextfield(micon: Icon(Icons.abc),
            mkeyboardtype: TextInputType.name,
            mlabelText: "Name your expense",
          ),

          SizedBox(height: 30,),
          AppTextfield(micon: Icon(Icons.abc),
            mkeyboardtype: TextInputType.text,
            mlabelText: "Add Desc",
          ),
          SizedBox(height: 30,),
          AppTextfield(micon: Icon(Icons.score),
            mkeyboardtype: TextInputType.number,
            mlabelText: "Enter Amount",
          ),

          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width * 0.05),
            child: Row(
              children: [

                DropdownButton<String>(
                  value: _selecteditem,
                  onChanged: (String? newValue){
             setState(() {
                     _selecteditem = newValue!;
                   });
                  }
                  ,items: _dropdownitems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(value: value,child: Text(value),); }).toList(),

                  icon: Icon(Icons.keyboard_arrow_down),),
              ],
            ),
          ),
          SizedBox(height: 30,),

          AppElButton(m_backgroundColor: Colors.black,m_btName: "Expense Category",m_foregroundColor: Colors.white ,
            m_onPressed: (){
              showModalBottomSheet(context: context, builder: (context) {
                return Container(
                    margin: EdgeInsets.all(12),
                    height: 500,
                    child: GridView.builder(
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.shade300,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            height: 20,
                            width: 20,
                            child: Image.asset(micon[index],
                              width: 50,height: 50,fit: BoxFit.cover,),
                          ),
                        );
                      },)
                );
              },);
              },),

          SizedBox(height: 10,),
     /// select date
          AppElButton(m_backgroundColor: Colors.white,m_btName: "Select Date",m_foregroundColor: Colors.black ,
            m_onPressed: (){
              showDatePicker(context: context, firstDate: DateTime(2020), lastDate: DateTime(2050));
            },),
          SizedBox(height: 10,),
          /// add Expense
          AppElButton(m_backgroundColor: Colors.black,m_btName: "Add Expense",m_foregroundColor: Colors.white ,m_onPressed: (){},),

        ],
      ),
    );
  }
}
