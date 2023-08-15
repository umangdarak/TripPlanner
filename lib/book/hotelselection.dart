import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../classes/hotels.dart';
import 'bank.dart';
import 'databasehelper.dart';

class HotelSelection extends StatefulWidget {
  HotelSelection({super.key,required this.name,required this.email,required this.phnno,required this.location1,required this.location2});
  String name;
  String email;
  String phnno;
  String location1;
  String location2;

  @override
  State<HotelSelection> createState() => _HotelSelectionState();
}

class _HotelSelectionState extends State<HotelSelection> {
  final formkey=GlobalKey<FormState>();
  final _hotelController=TextEditingController();
  List<String> hotel=['ParkHyatt','ITC Kakatiya','TajMahalPalace','TheAshok','TajHotel'];
  Map<String,int> prices={'ParkHyatt':550,'ITC Kakatiya':450,'TajMahalPalace':600,'TheAshok':650,'TajHotel':540};
bool l=false;
String? s;
  var myData=[];
  refreshData() async{
    final data=await DataBaseHelper.getItems();
    setState(() {
      myData=data;
    });}
  Future<void> addItem() async{
    await DataBaseHelper.insertItem(widget.name,widget.email,widget.phnno,widget.location1,widget.location2,_hotelController.text);
    refreshData();
  }
  @override
  Widget build(BuildContext context) {
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
            IconButton(onPressed: (){},icon:const Icon(FontAwesomeIcons.question))
          ],
        ),
      ),
      const SizedBox(width: 300,
        child: Center(child: Text('Select a Hotel!',style: TextStyle(fontSize: 30),)),),
      SizedBox(height: 30,),
              Container(height: 500, width: MediaQuery
                  .of(context)
                  .size
                  .width,
                color: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      Hotels hotel = hotels[index];
                      return Container(width: MediaQuery
                          .of(context)
                          .size
                          .width - 30,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme
                                  .of(context)
                                  .scaffoldBackgroundColor
                          ),
                          child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Positioned(bottom: 15,
                                  child: Container(width: 380,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text('${hotel.location}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                    letterSpacing: 1.2)),
                                            SizedBox(height: 10,),
                                            Text('${hotel.rating}',
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15)),
                                          ],

                                        ),
                                      )),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [ BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 6
                                        )
                                        ]

                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image(
                                            image: AssetImage('${hotel.imageurl}'),
                                            height: 380,
                                            width: 380,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(bottom: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 15),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text('${hotel.name}',
                                                    style: TextStyle(fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white)),

                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                )
                              ]));
                    }),),
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
      const SizedBox(height: 30,),
      Container(height: 50,
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(20)

        ),
        child: Row(
          children: [
            const Text('  Select Hotel:'),
            const SizedBox(width: 10,),
            Container(height: 30,
              child: DropdownMenu(requestFocusOnTap: false,inputDecorationTheme: const InputDecorationTheme(constraints:BoxConstraints(
                  maxHeight: 32
              ),
                  border: InputBorder.none,alignLabelWithHint: true),
                controller: _hotelController,
                hintText: 'Hotel',dropdownMenuEntries: hotel.map((String e){return DropdownMenuEntry(value: e,label: e);}).toList(),
                onSelected: (String? value){s=value;
                l=true;},),
            ),]),),
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
                    SizedBox(width: 60,),
                    l?Text('₹${prices[_hotelController.text]}/PerDay',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),):Text('')
                  ],
                )           ),
    SizedBox(height: 20,),
    Container(width:200,decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30)
    ),
    child: TextButton.icon(onPressed: ()async {
    await addItem();
    await refreshData();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>BankDetails()));
    } ,label: const Text('Proceed to Payment',style: TextStyle(color:Colors.black),),icon: Icon(FontAwesomeIcons.check,color: Colors.black,),),
    ),
    ],

        ),
      ),
    )
    )
  ])
    )
    );
  }
}
