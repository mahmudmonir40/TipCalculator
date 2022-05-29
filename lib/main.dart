import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

 class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

   @override
   State<HomePage> createState() => _HomePageState();
 }

 class _HomePageState extends State<HomePage> {
  //adding style
   TextStyle titleStyle = TextStyle(fontSize: 24.0,color: Color(0xFF5B777B),fontWeight: FontWeight.bold);

   //let's implement the logic and make it functional
   //Step 1: Prepare the variables
   double bill = 0;
   double tip = 0;
   int person = 1;

   //prepare the result
   double tipPerPerson = 0;
   double totalPerPerson = 0;

   //create the text editing controller to get the value from input
   TextEditingController billController = TextEditingController();
   TextEditingController tipController = TextEditingController();
   TextEditingController personController = TextEditingController();


   //create a function to calculate the tip
   void calculate(){
     tipPerPerson = (bill * tip ) / person ;
     totalPerPerson = (bill * (1 + tip)) / person ;
   }


   //now let's implement the variable in their places


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Color(0xFFC7E4E7),
       
       body: SingleChildScrollView(
         child: SafeArea(
           child: Column(
             children: [
               Row(
                 children: [
                   SizedBox(width: 15.0,),
                   Text("Tip Calculator",style: titleStyle,),
                 ],
               ),

               //Header
               Container(
                 width: double.infinity,
                 height: 250.0,
                 
                 child: Image.network("https://repository-images.githubusercontent.com/385314711/69538abd-cc42-4668-9b76-3c04dcf352dd"),
               ),


               //Body
               Container(
                 padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 25.0),
                 width: double.infinity,

                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0)),

                 ),

                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,

                   children: [
                     Text("Bills",style: titleStyle),

                     SizedBox(height: 15.0,),
                     TextField(
                       controller: billController,
                       onEditingComplete: (){
                         setState(() {
                           if(billController.text.isNotEmpty){
                             bill = double.parse(billController.text);
                           }else{
                             bill = 0;
                           }

                           // to dismiss the keyboard after editing
                           FocusScope.of(context).unfocus();
                           calculate();
                         });
                       },
                       keyboardType: TextInputType.numberWithOptions(),

                       decoration: InputDecoration(
                         filled: true,
                         fillColor: Color(0xFFF3F8FB),

                         border: InputBorder.none,
                         hintText: "eg: 100",
                         prefixIcon: Icon(Icons.attach_money_rounded),

                       ),
                       textAlign: TextAlign.end,
                       style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.bold,color: Color(0xFF00474B)),
                     ),
                     
                     SizedBox(height: 35.0,),
                     Text("Select Tip %",style: titleStyle,),


                     SizedBox(height: 15.0,),
                     //let's create the button grid
                     Row(
                       children: [
                         Expanded(
                             child: FlatButton(
                               height: 50.0,
                                 color: Color(0xFF00474B),
                                 onPressed: (){
                                 setState(() {
                                   tip = 0.05;
                                   calculate();
                                 });
                                 },

                                 child: Text("5%",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28.0),)),
                         ),

                         SizedBox(width: 10.0,),
                         Expanded(
                           child: FlatButton(
                               height: 50.0,
                               color: Color(0xFF00474B),
                               onPressed: (){
                                 setState(() {
                                   tip = 0.1;
                                   calculate();
                                 });
                               },

                               child: Text("10%",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28.0),)),
                         ),

                       ],
                     ),

                     SizedBox(height: 15.0,),
                     Row(
                       children: [
                         Expanded(
                           child: FlatButton(
                               height: 50.0,
                               color: Color(0xFF00474B),
                               onPressed: (){
                                 setState(() {
                                   tip = 0.15;
                                   calculate();
                                 });
                               },

                               child: Text("15%",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28.0),)),
                         ),

                         SizedBox(width: 10.0,),
                         Expanded(
                           child: FlatButton(
                               height: 50.0,
                               color: Color(0xFF00474B),
                               onPressed: (){
                                 setState(() {
                                   tip = 0.25;
                                   calculate();
                                 });
                               },

                               child: Text("25%",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28.0),)),
                         ),

                       ],
                     ),


                     SizedBox(height: 15.0,),
                     Row(
                       children: [
                         Expanded(
                           child: FlatButton(
                               height: 50.0,
                               color: Color(0xFF00474B),
                               onPressed: (){
                                 setState(() {
                                   tip = 0.5;
                                   calculate();
                                 });
                               },

                               child: Text("50%",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28.0),)),
                         ),

                         SizedBox(width: 10.0,),
                         Expanded(
                           child:  TextField(
                             keyboardType: TextInputType.number,

                             controller: tipController,
                             onEditingComplete: (){
                               setState(() {
                                 if(tipController.text.isNotEmpty){
                                   tip = double.parse(tipController.text) / 100;
                                 }else{
                                   tip = 0;
                                 }

                                 // to dismiss the keyboard after editing
                                 FocusScope.of(context).unfocus();
                                 calculate();
                               });
                             },

                             decoration: InputDecoration(
                               filled: true,
                               fillColor: Color(0xFFF3F8FB),

                               border: InputBorder.none,
                               hintText: "Custom",

                             ),
                             textAlign: TextAlign.end,
                             style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.bold,color: Color(0xFF00474B)),
                           ),
                         ),

                       ],
                     ),

                     SizedBox(height: 55.0,),
                     Text("Number of People",style: titleStyle),

                     SizedBox(height: 15.0,),
                     TextField(
                       controller: personController,
                       onEditingComplete: (){
                         setState(() {
                           if(personController.text.isNotEmpty){
                             person = int.parse(personController.text);
                           }else{
                             person = 1;
                           }

                           // to dismiss the keyboard after editing
                           FocusScope.of(context).unfocus();
                           calculate();
                         });
                       },

                       keyboardType: TextInputType.numberWithOptions(),

                       decoration: InputDecoration(
                         filled: true,
                         fillColor: Color(0xFFF3F8FB),

                         border: InputBorder.none,
                         hintText: "eg: 5",
                         prefixIcon: Icon(Icons.person),

                       ),
                       textAlign: TextAlign.end,
                       style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.bold,color: Color(0xFF00474B)),
                     ),


                     SizedBox(height: 30.0,),
                     Container(
                       padding: EdgeInsets.all(30.0),
                       height: 300.0,
                       width: double.infinity,

                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(18.0),
                           color: Color(0xFF00474B)
                       ),


                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,

                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,

                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,

                                 children: [
                                   Text("Tip Amount",style: TextStyle(fontSize: 24.0,color: Colors.white,fontWeight: FontWeight.bold),),

                                   SizedBox(height: 5.0,),
                                   Text("/ Person",style: TextStyle(color: Color(0xFF598689),fontSize: 20.0),)
                                 ],
                               ),

                               Text("\$${tipPerPerson.toStringAsFixed(2)}",style: TextStyle(color: Color(0xFF29C0AD),fontSize: 38.0,fontWeight: FontWeight.bold),),
                             ],
                           ),


                           SizedBox(height: 20.0,),
                           SingleChildScrollView(
                             scrollDirection: Axis.horizontal,

                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,

                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                                   children: [
                                     Text("Total",style: TextStyle(fontSize: 24.0,color: Colors.white,fontWeight: FontWeight.bold),),

                                     SizedBox(height: 5.0,),
                                     Text("/ Person",style: TextStyle(color: Color(0xFF598689),fontSize: 20.0),)
                                   ],
                                 ),

                                 Text("\$${totalPerPerson.toStringAsFixed(2)}",style: TextStyle(color: Color(0xFF29C0AD),fontSize: 38.0,fontWeight: FontWeight.bold),),
                               ],
                             ),
                           ),


                           SizedBox(height: 20.0,),
                           Container(
                             width: double.infinity,
                             height: 50.0,

                             child: FlatButton(
                                 onPressed: (){
                                   setState(() {
                                     tip = 0;
                                     person = 1;
                                     bill = 0;
                                     calculate();

                                     tipController.clear();
                                     billController.clear();
                                     personController.clear();

                                   });
                                 },
                                 color: Color(0xFF26C2AD),

                                 child: Text("Reset",style: TextStyle(color: Color(0xFF00494B),fontSize: 24.0,fontWeight: FontWeight.bold),)
                             ),
                           ),
                         ],
                       ),
                     )
                   ],
                 ),
               ),

             ],
           ),
         ),
       ),
     );
   }
 }


