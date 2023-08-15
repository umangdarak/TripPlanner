import 'package:flutter/material.dart';
import 'package:trip2/book/form.dart';
import 'package:trip2/book/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../book/databasehelper.dart';
import '../widgets/destinationwidget.dart';
import '../widgets/hotelwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex=0;
  int _currentTab = 0;
  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
  ];
var myData;
  Widget buildIcon(int index) {
    return GestureDetector(
      onTap:()=>setState(() {
        selectedindex=index;
      }),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: selectedindex==index? Colors.cyan[100]:Colors.grey[200],
          borderRadius: BorderRadius.circular(40.0),
        ), // BoxDecoration
        child: Icon(icons[index], size: 30 ,color: selectedindex==index?Theme.of(context).primaryColor:Color(0xFFB4C1C4),),
      ),
    ); // Container
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit the App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // <-- SEE HERE
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: SafeArea(
              top: true,
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:20,right: 50,left:20),
                    child:
                        Text(
                        "Check out the Hot Destinations!!", style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  const SizedBox(height: 40),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                    icons.asMap().entries.map((MapEntry map) => buildIcon(map.key)).toList()),
                  const SizedBox(height: 40,),
                  SizedBox(width:10),
                  icons[selectedindex]==FontAwesomeIcons.plane?DestinationWidget():icons[selectedindex]==FontAwesomeIcons.bed?HotelWidget():Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('go for a walk',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),
                  ))

                ],

              )
          ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentTab,
                onTap: (int value) {
                  setState(() {
                    _currentTab = value;
                  });
                },
                items:   [
                  const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                    label: ''
                  ),
                  BottomNavigationBarItem(
                    icon: IconButton(onPressed: ()async {
                      Navigator.push<List<dynamic>>(context,MaterialPageRoute(builder: (context){return BookTicket();}));

                   },icon:const Icon(FontAwesomeIcons.user),),
                  label: '',
                  ),
                   BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const ProfileView()));
                        },
                      child: const CircleAvatar(
                        radius: 15.0,
                        backgroundImage: AssetImage('assets/images/luffy.jpg'),

                      ),
                    ),
                label: '',
                  )
                ],
              ),
      ),
    );
  }
}