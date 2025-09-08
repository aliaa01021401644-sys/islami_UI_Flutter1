import 'dart:ui';

import 'package:flutter/material.dart';
typedef Onclick=void Function(String);
void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator()));
}
class Calculator extends StatefulWidget{
  State<Calculator>createState(){

    return CalculatorState();
  }
}
class CalculatorState extends State<Calculator> {
  String textview="";
  void ondigitclick(String digit) {
    if(digit=="." && textview.contains("."))return;
    setState(() {
      textview+=digit;
    });
  }
  String savedOperator="";
  String savedNumber="";
  void onoperatorclick(String operator){
    if(savedOperator.isEmpty&&savedOperator.isEmpty){
      savedNumber=textview;
      savedOperator=operator;
      textview="";
      setState(() {

      });
    }else{
      var res=calculate(savedNumber,savedOperator,textview);
      savedNumber=res;
      savedOperator=operator;
      textview="";
      setState(() {

      });
    }}
    String calculate(String lhs, String operator, String rhs) {
    double n1=double.parse(lhs);
    double n2=double.parse(rhs);
    double res=0;
    if(operator=="+"){
      res=n1+n2;
    }else if(operator=="-"){
      res=n1-n2;
    }else if(operator=="*"){
      res=n1*n2;
    }else{
      res=n1/n2;
    }
    return res.toString();

  }
  void  OnequalClicked(String _){
    var res=calculate(savedNumber,savedOperator,textview);
    textview=res ;
    savedNumber="";
    savedOperator="";
    setState(() {

    });

  }
  void OnbackSpace(String_){
    if(textview.isEmpty)return;
textview=textview.substring(0,textview.length-1);
setState(() {

});
  }
  void ClearAll(String_){
    textview="";
    savedNumber="";
    savedOperator="";
    setState(() {

    });
  }
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
      flex: 4,
      child: Container(
          alignment: Alignment.centerRight,

          child: Text(textview,style: TextStyle(fontSize: 50,color: Colors.white),))),
          Expanded(
    flex: 6,

            child: Row(
              children:[
                Expanded(
            flex: 8,

                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Calculatebutton(text: "Ac",onclick:ClearAll,bgGroundcolor: Colors.grey,fgcolor: Colors.white),
                          Calculatebutton(text: "x",onclick: OnbackSpace,bgGroundcolor: Colors.grey,fgcolor: Colors.white),
                          Calculatebutton(text: "/",onclick:onoperatorclick ,bgGroundcolor: Colors.blue,fgcolor: Colors.white),


                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Calculatebutton(text: "7",onclick: ondigitclick,bgGroundcolor: Colors.grey,fgcolor: Colors.white),
                          Calculatebutton(text: "8",onclick: ondigitclick,bgGroundcolor: Colors.grey,fgcolor: Colors.white),
                          Calculatebutton(text: "9",onclick: ondigitclick,bgGroundcolor: Colors.blue,fgcolor: Colors.white),


                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Calculatebutton(text: "4",onclick: ondigitclick,bgGroundcolor: Colors.grey,fgcolor: Colors.white),
                          Calculatebutton(text: "5",onclick: ondigitclick,bgGroundcolor: Colors.grey,fgcolor: Colors.white),
                          Calculatebutton(text: "6",onclick: ondigitclick,bgGroundcolor: Colors.blue,fgcolor: Colors.white),


                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Calculatebutton(text: "1",onclick: ondigitclick,bgGroundcolor: Colors.grey,fgcolor: Colors.white),
                          Calculatebutton(text: "2",onclick: ondigitclick,bgGroundcolor: Colors.grey,fgcolor: Colors.white),
                          Calculatebutton(text: "3",onclick: ondigitclick,bgGroundcolor: Colors.blue,fgcolor: Colors.white),


                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Calculatebutton(text: "0",onclick: ondigitclick,bgGroundcolor: Colors.grey,fgcolor: Colors.white,flex: 4),
                          Calculatebutton(text: ".",onclick: ondigitclick,bgGroundcolor: Colors.grey,fgcolor: Colors.white,flex: 2),



                        ],
                      ),
                    ),
                  ],

                ),
            ),

                  Expanded(
                    flex: 2,

                  child: Column(
                    children: [
                      Calculatebutton(text: "*",onclick: onoperatorclick,bgGroundcolor: Colors.grey,fgcolor: Colors.white,flex: 2),
                      Calculatebutton(text: "-",onclick: onoperatorclick,bgGroundcolor: Colors.grey,fgcolor: Colors.white,flex: 2),
                      Calculatebutton(text: "+",onclick: onoperatorclick,bgGroundcolor: Colors.grey,fgcolor: Colors.white,flex: 3),
                      Calculatebutton(text: "=",onclick:  OnequalClicked,bgGroundcolor: Colors.grey,fgcolor: Colors.white,flex: 3),
                    ],
                    ),
                    ),



                  ],
                ),

            ),



        ],
      ),
    );
  }




}



class Calculatebutton extends StatelessWidget {
  String text;
  Color bgGroundcolor;
int flex;
  Color fgcolor;
  Onclick onclick;
 //void Function(String) onclick;
   Calculatebutton({super.key,required this.text,this.bgGroundcolor=Colors.grey, this.fgcolor=Colors.black,this.flex=1,required this.onclick});



  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(

      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgGroundcolor,
          foregroundColor: fgcolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      )
        ),
          onPressed: (){
          onclick(text);
          },child: Text(

        text,
        style: TextStyle(fontSize: 21,color: fgcolor,fontWeight: FontWeight.bold,
        ),
      ),
      ),
    ),
    );

  }
}
