import 'package:trip2/classes/activities.dart';

class Destination
{
  String imageurl;
  String? city;
  String? state;
  String? description;
  List<Activity> activities=[];
  Destination({required this.imageurl,this.city,this.state,this.description,required this.activities});



}

List<Destination> destinations=[
  Destination(
    imageurl:'assets/images/charminar.jpg',
    city:'Hyderabad',
    state:'Telangana',
    description: 'Come visit the beautiful city of Hyderabad!!',
    activities: [Activity(
      imageurl:'assets/images/charminar1.jpg',
      name:'Charminar',

      starttimes: '9:00am to 6:00pm',
      rating:'4.9',
      price:'50',
      description: 'Come visit the beautiful Charminar'
    ),
    Activity(
      imageurl:'assets/images/golkonda.jpg',
        name:'Golkonda Fort',
      starttimes: '9:00am to 6:00pm',
      rating:'4.6',
      price:'20',
      description: 'Come and explore the wonderful ruins of the Golkonda Fort'
    ),
    Activity(
      imageurl:'assets/images/hitech.jpg',
      name:'Hitech City',
      starttimes: 'open 24/7',
      rating:'5.0',
      price:'free',
      description: 'Welcome to the tech city in Hyderabad'
    )]
  ),
  Destination(
    imageurl: 'assets/images/delhi.jpg',
    city:'New Delhi',
    state:'Haryana',
    description: 'Come visit the captial of India!!',
      activities: [Activity(
      imageurl:'assets/images/redfort.jpg',
      name:'Redfort',

          starttimes: '9:00am to 6:00pm',
      rating:'4.9',
      price:'50',
          description: 'Come visit Redfort'

      ),
  Activity(
      imageurl:'assets/images/parliment.jpg',
      name:'The Parliment of India',
      starttimes: '9:00am to 6:00pm',
      rating:'4.6',
      price:'20',
      description: 'Check out the parliment of India!1'

  ),
  Activity(
      imageurl:'assets/images/indiagate.jpg',
      name:'IndiaGate',
      starttimes: 'open 24/7',
      rating:'5.0',
      price:'free',
      description: 'Welcome to the India Gate'

  )]
  ),
  Destination(
    imageurl: 'assets/images/mumbai.jpg',
    city:'Mumbai',
    state:'Maharastra',
    description: 'Come visit Mumbai!!',
    activities:  [Activity(
      imageurl:'assets/images/gatewaymumbai.jpg',
      name:'The GateWay of India',

        starttimes: '9:00am to 6:00pm',
      rating:'4.9',
      price:'50',
        description: 'Come visit the beautiful GateWay of India'

    ),
  Activity(
      imageurl:'assets/images/marinedrive.jpg',
      name:'Marine Drive',
      starttimes: 'open 24/7',
      rating:'4.6',
      price:'free',      description: 'Come and explore the wonderful Marine Drive'

  ),
  Activity(
      imageurl:'assets/images/elephantacaves.jpg',
      name:'Elephanta Caves',
      starttimes: '9:00am to 6:00pm',
      rating:'5.0',
      price:'200',
      description: 'Explore the majestic Elephanta Caves'

  )]
  )
];