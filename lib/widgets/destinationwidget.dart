import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trip2/widgets/activitieswidget.dart';

import '../classes/destination.dart';

class DestinationWidget extends StatelessWidget {
  const DestinationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Top Destinations',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: GestureDetector(onTap:(){
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('I havent coded this part yet')));
               },
                   child: const Text("see all  ",style: TextStyle(color:Colors.cyanAccent),)),
             )
          ],
        ),
        SizedBox(height: 20,),
        Container(height: 500,width: MediaQuery.of(context).size.width,
          color: Theme.of(context).scaffoldBackgroundColor,
          child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (context,index){
              Destination destination=destinations[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ActivityWidget(destination: destination,)));
                },
                child: Container(width:MediaQuery.of(context).size.width-30,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Theme.of(context).scaffoldBackgroundColor
                ),
                child:Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Positioned(bottom:15,
                      child: Container(width: 380,
                      height: 100,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text('${destination.activities?.length} activities',style:const TextStyle(fontWeight: FontWeight.bold,fontSize:25,letterSpacing: 1.2)),
                          SizedBox(height: 10,),
                              Text('${destination.description}',style: const TextStyle(color:Colors.grey,fontSize:15)),
                        ],

                        ),
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow:[ BoxShadow(
                          color:Colors.black26,
                          offset: Offset(0,2),
                          blurRadius: 6
                        )]

                      ),
                      child:Stack(
                        children: [
                          Hero(
                            
                            tag:destination.imageurl,
                            child: ClipRRect(
                              borderRadius:BorderRadius.circular(20),
                              child: Image(
                                image:AssetImage('${destination.imageurl}'),
                                height: 380,
                                width: 380,
                                fit:BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(bottom: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(top:10,left:15),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${destination.city}',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white)),

                                  Row(
                                    children: [
                                      Icon(FontAwesomeIcons.locationArrow,color:Colors.white,size:15),
                                      SizedBox(width: 5,),
                                      Text('${destination.state}',style:TextStyle(color:Colors.white)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    )
                  ],

                )
                ),
              );
            },
          )
        )
      ],
    );
  }
}
