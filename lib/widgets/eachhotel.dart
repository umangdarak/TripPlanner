import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../classes/hotels.dart';

class EachHotel extends StatefulWidget {
  Hotels? hotel;
  EachHotel({super.key,this.hotel});

  @override
  State<EachHotel> createState() => _EachHotelState();
}

class _EachHotelState extends State<EachHotel> {
  int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
            children: [
        Stack(
        children:[ Container(
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow:const [ BoxShadow(
                color: Colors.black26,
                offset: Offset(0,2),
                blurRadius: 6
            )]),
        child:Hero(tag:widget.hotel!.imageurl,child: ClipRRect(borderRadius:BorderRadius.circular(30),child: Image.asset('${widget.hotel?.imageurl}',fit:BoxFit.cover)))
    ),
    Padding(
    padding: const EdgeInsets.only(top:30),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(FontAwesomeIcons.arrowLeft),color: Colors.white,),
    Row(mainAxisAlignment: MainAxisAlignment.end,
    children: [
    IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.magnifyingGlass),color: Colors.white,),
    IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.arrowDownWideShort),color: Colors.white,)

    ],
    )
    ],
    ),
    ),
          Positioned(bottom:5,
            child: Padding(
              padding: const EdgeInsets.only(left:15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.hotel?.name}',style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color:Colors.white)),

                  Row(
                    children: [
                      SizedBox(width:350),
                      Icon(FontAwesomeIcons.hotel,color:Colors.white,size: 25,)
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
    Container(
    height: 400,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: Colors.white
    ),
    child:Padding(
    padding: const EdgeInsets.only(top:30,bottom:30,right:10,left:10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('Location:',style: TextStyle(fontSize: 30),),
    SizedBox(width:170,child: Text('${widget.hotel?.location}',style: TextStyle(fontSize:30),))
    ],
    ),
    SizedBox(height: 10,),
    Row(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('Rating:',style: TextStyle(fontSize: 30),),
    SizedBox(width:170,child: Text('${widget.hotel?.rating}',style: TextStyle(fontSize:30),))
    ],
    ),
      Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price:',style: TextStyle(fontSize: 30),),
          SizedBox(width:170,child: Text('${widget.hotel?.price}/PerDay',style: TextStyle(fontSize:30),))
        ],
      ),
      SizedBox(height:5,),
      Text('About:',style: TextStyle(fontSize: 30),),
      SizedBox(width:MediaQuery.of(context).size.width,child: Text('${widget.hotel?.description}',style: TextStyle(fontSize:20),)),
    ],
    ),
    )

    )]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items:  [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30.0,
              ),
              label: ''
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: AssetImage('assets/images/luffy.jpg'),

            ),
            label: '',
          )
        ],
      ),
    );
  }
}
