import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trip2/book/hotelselection.dart';

import 'bank.dart';
import 'databasehelper.dart';

class BookTicket extends StatefulWidget {
  const BookTicket({super.key});

  @override
  State<BookTicket> createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {

  String? s;
  final formkey =GlobalKey<FormState>();
  Map<String,List<String>> info={'Hyderabad':['Charminar','GolkondaFort','HitechCity'],
    'NewDelhi':['Parliment of India','Red Fort','India Gate'],
    'Mumbai':['Gateway Of India','Elephanta Caves','Marine Drive']};
  List<String> hotel=['ParkHyatt','ITC Kakatiya','TajMahalPalace','TheAshok','TajHotel'];
  Map<String,int> prices={'ParkHyatt':550,'ITC Kakatiya':450,'TajMahalPalace':600,'TheAshok':650,'TajHotel':540};
  Map<String,int> flights={'Hyderabad':22000,'NewDelhi':30000,'Mumbai':40000};

  final _nameController=TextEditingController();
  final _emailController=TextEditingController();
  final _phnnoController=TextEditingController();
  final _location1Controller=TextEditingController();
  final _location2Controller=TextEditingController();
  final _hotelController=TextEditingController();

  static String? validate(String?i) {
    if (i!.isEmpty){return 'Field Required';}
    return null;
  }
  var myData=[];
   refreshData() async{
    final data=await DataBaseHelper.getItems();
    setState(() {
      myData=data;
    });}
   Future<void> addItem() async{
    await DataBaseHelper.insertItem(_nameController.text, _emailController.text,_phnnoController.text,_location1Controller.text,_location2Controller.text,_hotelController.text);
    refreshData();
  }
Future<void> alter() async{
     await DataBaseHelper.alterTable('users', 'locationstart');
     refreshData();
}
  bool l=false;
  @override
  Widget build(BuildContext context) {
   // alter();
    return Scaffold(resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20,left: 5),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(FontAwesomeIcons.arrowLeft),),
                  SizedBox(width: MediaQuery.of(context).size.width-110,),
                  IconButton(onPressed: (){                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Contact umangdarak@gmail.com for any queries'),));
                  },icon:const Icon(FontAwesomeIcons.question))
                ],
              ),
            ),
            Image.asset('assets/images/plane.png',height:200,width: 200,fit:BoxFit.fill),
            Container(width: 300,
              child: Center(child: const Text('Book a Ticket!',style: TextStyle(fontSize: 20),)),),
            SizedBox(height: 20,),
            Container(
              // height: MediaQuery.of(context).size.height-130,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(30),
                ),
                child:Form(
                    key:formkey, child: Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20)

                        ),
                          child: TextFormField(
                            showCursor: false,
                            validator: validate,
                            controller: _nameController,
                            decoration: const InputDecoration(contentPadding:EdgeInsets.only(left:10),hintText: '  Name',border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20)

                        ),
                          child: TextFormField(
                            showCursor: false,
                            validator: validate,
                            controller: _emailController,
                            decoration: const InputDecoration(contentPadding:EdgeInsets.only(left:10),hintText: '  Email',border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20)

                        ),
                          child: TextFormField(
                            showCursor: false,
                            validator: validate,
                            controller:_phnnoController ,
                            decoration: const InputDecoration(contentPadding:EdgeInsets.only(left:10),hintText: '  Phone Number',border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(20)

                          ),
                          child: Row(
                            children: [
                              const Text('  Select current Location:'),
                              const SizedBox(width: 10,),
                              Container(height: 30,
                                child: DropdownMenu(requestFocusOnTap: false,inputDecorationTheme: const InputDecorationTheme(constraints:BoxConstraints(
                                    maxHeight: 32
                                ),
                                    border: InputBorder.none,alignLabelWithHint: true),
                                  controller: _location1Controller,
                                  hintText: ' Location',dropdownMenuEntries: info.keys.map((String e){return DropdownMenuEntry(value: e,label: e);}).toList(),
                                  onSelected: (String? value){},),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(20)

                          ),
                          child: Row(
                            children: [
                              const Text('  Select Destination:'),
                              const SizedBox(width: 10,),
                              Container(height: 30,
                                child: DropdownMenu(requestFocusOnTap: false,inputDecorationTheme: const InputDecorationTheme(constraints:BoxConstraints(
                                    maxHeight: 32
                                ),
                                    border: InputBorder.none,alignLabelWithHint: true),
                                  controller: _location2Controller,
                                  hintText: ' Location',dropdownMenuEntries: info.keys.map((String e){return DropdownMenuEntry(value: e,label: e);}).toList(),
                                  onSelected: (String? value){l=true;},),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(height: 50,width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20)

                            ),
                            child:Row(
                              children: [
                                SizedBox(width: 10,),
                                Text('Price:'),
                                SizedBox(width: 100,),
                                l?Text('₹${flights[_location2Controller.text]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),):Text('')
                              ],
                            )           ),
                      ] ),
                )
                )
            ),
            SizedBox(height: 40,),
            Container(width:250,decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
            ),
              child: TextButton.icon(onPressed: ()async {
                if(formkey.currentState!.validate())
                {Navigator.push(context,MaterialPageRoute(builder: (_)=>HotelSelection(name: _nameController.text, email: _emailController.text, phnno: _phnnoController.text, location1: _location1Controller.text, location2: _location2Controller.text)));
                }
              /* setState(() {
                  _nameController.text='';
                  _emailController.text='';
                  _phnnoController.text='';
                  _location1Controller.text='';
                  _location2Controller.text='';
                 // _hotelController.text='';
                });*/
              }
              ,label: const Text('Proceed to Select Hotels',style: TextStyle(color:Colors.black),),icon: Icon(FontAwesomeIcons.check,color: Colors.black,),),
            ),
            //OutlinedButton(onPressed: ()async{await DataBaseHelper.deleteWholeTable();}, child: Icon(Icons.add))

          ],
        ),
      ),
    );
  }

}



