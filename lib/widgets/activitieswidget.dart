import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trip2/widgets/eachactivity.dart';

import '../classes/activities.dart';
import '../classes/destination.dart';

class ActivityWidget extends StatelessWidget {
   final Destination? destination;
  const ActivityWidget({this.destination});

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
                child:Hero(tag:destination!.imageurl,child: ClipRRect(borderRadius:BorderRadius.circular(30),child: Image.asset('${destination?.imageurl}',fit:BoxFit.cover)))
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
                Positioned(bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(top:10,left:15),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${destination?.city}',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white)),

                        Row(
                          children: [
                            Icon(FontAwesomeIcons.locationArrow,color:Colors.white,size:15),
                            SizedBox(width: 5,),
                            Text('${destination?.state}',style:TextStyle(color:Colors.white)),
                            SizedBox(width:260),
                            Icon(FontAwesomeIcons.mapLocationDot,color:Colors.white,size: 25,)
                          ],
                        )
                      ],
                    ),
                  ),
                ),]),
                  Flexible(
                    child: ListView.builder(
                        scrollDirection:Axis.vertical,itemCount:destination?.activities.length,itemBuilder: (context,index){
                      Activity? activity=destination!.activities[index];
                      return GestureDetector(
                        onTap: (){Navigator.push(context,MaterialPageRoute(builder: (_)=>EachActivity(activity:activity)));},
                        child: Hero(
                          tag:activity.imageurl,
                          child: Stack(
                            children: [
                              Container(
                                margin:EdgeInsets.fromLTRB(20, 5, 20, 5),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child:Row(
                                  children: [
                                    ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.asset('${activity.imageurl}',height: MediaQuery.of(context).size.height,width: 200,fit:BoxFit.fitHeight)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(width:150,child: Text('${activity.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                                          SizedBox(height: 15,),
                                          Container(width:150,child: Text('Price:${activity.price}',style: TextStyle(fontSize: 20))),
                                          SizedBox(height: 10,),
                                          Container(width:150,child: Text('Rating:${activity.rating}',style:TextStyle(fontSize: 20)))
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ],
                          ),
                        ),
                      );


                    }),
                  ),


            ]),




    );
  }
}
