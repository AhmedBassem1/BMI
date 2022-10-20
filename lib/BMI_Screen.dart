import 'dart:math';
import 'dart:ffi';

import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';

class BMI_Screen extends StatefulWidget{
  @override
  State<BMI_Screen> createState() => _BMI_ScreenState();

}

class _BMI_ScreenState extends State<BMI_Screen> {
  double height=100;
  double weight = 0;
  int _AgeValue = 0;
  bool  isMale = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMI',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,

          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                  height: 130,
                      child:  InkWell(
                          onTap: (){
                            isMale = false;
                           setState(() {});
                     },
                        child: const Icon(Icons.woman,
                        size: 70,),),



                       alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(20),
                          border: Border.all(
                              color: isMale? Colors.black:Colors.red, width: 10),



                          ),
                        ),
                       ),

                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      child:  InkWell(
                        onTap: (){
                          isMale = true;
                          setState(() {});
                        },
                        child: const Icon(Icons.man,
                          size: 70,),),
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadiusDirectional.circular(20),
                        border: Border.all(
                            color: isMale? Colors.red:Colors.black, width: 10),

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadiusDirectional.circular(20),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT',
                      style: TextStyle(
                        fontSize:20,
                        color: Colors.white,
                      ),),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('$height',
                           style: TextStyle(
                             fontSize: 40,
                             color: Colors.white
                           ),
                           ),
                           Text('CM',
                             style: TextStyle(
                                 fontSize: 20,
                                 color: Colors.white
                             ),
                           ),
                         ],
                       ),

                    Slider(value: height,
                        max: 220,
                        min: 100,
                        divisions: 120,
                        label: height.round().toString(),
                        onChanged: (va){
                      setState(() {
                        height=va;
                      });
                    }

                        ),

                    ],
                  ),
                )

            ),
           Expanded(
             child: Row(
             children: [
               Expanded(
                 child: Container(
                 height: 150,
                 decoration: BoxDecoration(
                     color:Colors.black ,
                     borderRadius: BorderRadiusDirectional.circular(20),

                 ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('WEIGHT',
                           style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                             color: Colors.white
                           ),
                       ),
                       SizedBox(
                         height: 10,
                       ),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [

                           IconButton(onPressed: (){
                            setState(() {
                              weight++;
                            });
                           }, icon: Icon( Icons.arrow_back_ios),color: Colors.white),
                           Text('$weight',
                             style: TextStyle(
                                 fontSize: 35,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.white
                             ),),
                           IconButton(onPressed: (){
                            setState(() {
                              weight--;
                            });
                           }, icon: Icon( Icons.arrow_forward_ios),color: Colors.white),



                         ],
                       ),

                     ],
                   ),
               ),

               ),
               SizedBox(
                 width: 20,
               ),
               Expanded(
                 child: Container(
                 height: 150,
                 decoration: BoxDecoration(
                     color:Colors.black ,
                     borderRadius: BorderRadiusDirectional.circular(20)
                 ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('AGE',
                         style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                             color: Colors.white
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [

                           IconButton(onPressed: (){
                             setState(() {
                               _AgeValue++;
                             });
                           }, icon: Icon( Icons.arrow_back_ios),color: Colors.white),
                           Text('$_AgeValue',
                             style: TextStyle(
                                 fontSize: 35,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.white
                             ),),
                           IconButton(onPressed: (){
                             setState(() {
                               _AgeValue--;
                             });
                           }, icon: Icon( Icons.arrow_forward_ios),color: Colors.white),



                         ],
                       ),
                     ],
                   ),
               ),
               ),


             ],
            ),
           ),
              Container(
                width: double.infinity,

                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.all ( Radius.circular(15.0)),
                  ),
                  elevation: 5,
                  height: 50,
                  color: Colors.red,
                  onPressed: (){
                    double result = weight / pow(height/100,2);
                    print (result.round());

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)  {
                          return  ResultScreen(
                            height: height ,
                            weight: weight,
                            result: result,
                            age: _AgeValue ,
                            gender:
                            isMale==true ?'male' : 'female',


                          );
                        }


                    ));
                  },child:
                Text('CALCULATE',
                    style:TextStyle(
                      color:Colors.white,
                    )
                ),
                ),
              ),
          ],


        ),
      ),
    );
  }
}