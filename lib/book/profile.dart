import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trip2/book/ticket.dart';

import 'databasehelper.dart';
import 'form.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Map<String,String> hotel={'ParkHyatt':'assets/images/parkhyatt.jpg','ITC Kakatiya':'assets/images/itckakatiya.png','TajMahalPalace':'assets/images/thetajmahalpalace.jpg','TheAshok':'assets/images/theashok.jpg','TajHotel':'tajhoteldelhi.jpg'};
  Future<void> deleteItem(int id) async{
    await DataBaseHelper.deleteItem(id);}
  var myData=[];
  refreshData() async{
    final data=await DataBaseHelper.getItems();
    setState(() {
      myData=data;
    });}

  @override
  Widget build(BuildContext context) {
    refreshData();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: FutureBuilder(future: DataBaseHelper.getItems(),
          builder:(context,AsyncSnapshot<List<Ticket>>snapshot) {
            return myData.isNotEmpty ?
            ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 20),
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height - 60,
                      //  width: MediaQuery.of(context).size.width-200,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 10, right: 10),
                        child: Column(
                          children: [
                            Container(decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(30)),
                              child: Row(mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                                children: [
                                  IconButton(onPressed: () {
                                    Navigator.pop(context);
                                  },
                                      icon: const Icon(
                                          FontAwesomeIcons.arrowLeft)),
                                  Row(
                                    children: [
                                      Text('Trip Details of ${snapshot
                                          .data![index].name}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),),
                                      const SizedBox(width: 10,),
                                      const Icon(FontAwesomeIcons.plane)
                                    ],
                                  ),
                                  IconButton(onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          'Contact umangdarak@gmail.com for any queries'),));
                                  },
                                      icon: const Icon(
                                          FontAwesomeIcons.question))
                                ],
                              ),
                            ),
                            const SizedBox(height: 30,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20,),
                                    Row(mainAxisAlignment: MainAxisAlignment
                                        .start,
                                      children: [
                                        const Text('Name:', style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),),
                                        const SizedBox(width: 10,),
                                        Container(width: 210,
                                            child: Text(
                                              snapshot.data![index].name,
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight
                                                      .w600),))
                                      ],
                                    ),
                                    const SizedBox(height: 30,),
                                    Row(mainAxisAlignment: MainAxisAlignment
                                        .start,
                                      children: [
                                        const Text('Email Address:',
                                          style: TextStyle(fontSize: 17,
                                              fontWeight: FontWeight.w600),),
                                        const SizedBox(width: 10,),
                                        Container(width: 210,
                                            child: Text(
                                              snapshot.data![index].email,
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight
                                                      .w600),))
                                      ],
                                    ),
                                    const SizedBox(height: 30,),
                                    Row(mainAxisAlignment: MainAxisAlignment
                                        .start,
                                      children: [
                                        const Text('Phone Number:',
                                          style: TextStyle(fontSize: 17,
                                              fontWeight: FontWeight.w600),),
                                        const SizedBox(width: 10,),
                                        Container(width: 210,
                                            child: Text(
                                              snapshot.data![index].phnno,
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight
                                                      .w600),))
                                      ],
                                    ),
                                    const SizedBox(height: 30,),
                                    Card(color: Colors.blueAccent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius
                                                .circular(30)),
                                        child: Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          height: 120,
                                          decoration: BoxDecoration(
                                              color: Colors.white70,
                                              borderRadius: BorderRadius
                                                  .circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                8.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Center(
                                                    child: Column(children: [
                                                      const SizedBox(
                                                        height: 30,),
                                                      Text(snapshot
                                                          .data![index]
                                                          .location1,
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            fontSize: 17),),
                                                      const Icon(
                                                          FontAwesomeIcons
                                                              .home)
                                                    ],),
                                                  ),
                                                  Center(
                                                    child: Column(children: [
                                                      const SizedBox(
                                                        height: 30,),
                                                      const Icon(
                                                          FontAwesomeIcons
                                                              .plane),
                                                      Text('--------->',
                                                        style: TextStyle(
                                                            fontSize: 30),)
                                                    ],),
                                                  ),
                                                  Center(
                                                    child: Column(children: [
                                                      const SizedBox(
                                                        height: 30,),
                                                      Text(snapshot
                                                          .data![index]
                                                          .location2,
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            fontSize: 17),),
                                                      const Icon(
                                                          FontAwesomeIcons
                                                              .city)
                                                    ],),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                    ),
                                    SizedBox(height: 30),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text('Hotel Selected:',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),),
                                        Container(width: MediaQuery
                                            .of(context)
                                            .size
                                            .width - 50,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(30)),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius
                                                    .circular(30),
                                                child: Image.asset(
                                                  '${hotel[snapshot
                                                      .data![index].hotel]}',
                                                  fit: BoxFit.cover,))),
                                        SizedBox(height: 20,),
                                        Center(
                                            child: Text(
                                              snapshot.data![index].hotel,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),)
                                        ),
                                        Center(
                                          child: TextButton.icon(
                                              onPressed: () {
                                                deleteItem(
                                                    snapshot.data![index].id);
                                                Navigator.pop(context);
                                              },
                                              label: Text('Complete Booking'),
                                              icon: Icon(FontAwesomeIcons
                                                  .checkDouble)
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),),
                  );
                }) : Container(
              decoration: BoxDecoration(
                  color:Colors.grey[300],
                  borderRadius: BorderRadius.circular(30)
              ),
              child:Center(
                child:Column(
                  children: [
                    SizedBox(height: 300),
                    Center(child: const Text('You havent booked a ticket!',style: TextStyle(fontSize: 25),)),
                    const SizedBox(height: 20,),
                    const Text('Click below to go book a ticket!',style: TextStyle(fontSize: 20),),
                    const SizedBox(height: 20,),
                    Container(decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                      child: TextButton(onPressed: (){
                        Navigator.push<List<dynamic>>(context,MaterialPageRoute(builder: (context){return BookTicket();}));
                      }, child: const Text('Book a Ticket!',style: TextStyle(fontSize: 18,color: Colors.black87),),),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}


