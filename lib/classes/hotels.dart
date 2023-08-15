class Hotels
{
  String imageurl;
  String? name;
  String? location;
  double? rating;
  String? description;
  int price;
  Hotels({required this.imageurl,this.name,this.location,this.rating,this.description,required this.price});

}

List<Hotels> hotels=[
  Hotels(
    imageurl: 'assets/images/parkhyatt.jpg',
    name:'ParkHyatt',
    location:'Hyderabad',
    rating:5.0,
      description:'Park Hyatt Hyderabad is one of the most luxurious 5 star hotels in Hyderabad. With opulent architecture and unparalleled service, it’s not a stay but a journey that unfolds into rare and intimate experiences.',
  price:550
  ),
  Hotels(
    imageurl: 'assets/images/itckakatiya.png',
    name:'ITC Kakatiya',
    location: 'Hyderabad',
    rating:4.9,
    description: 'ITC Kakatiya pays tribute to the age of the great Kakatiya Dynasty. Located in the heart of the commercial district of Hyderabad, the hotel welcomes its guests to a renaissance of art, design and a bountiful life.',
    price:450
  ),
  Hotels(
      imageurl: 'assets/images/thetajmahalpalace.jpg',
      name:'The TajMahal Palace',
      location: 'Mumbai',
      rating:5.0,
    description: 'The Taj Mahal Palace is a heritage, five-star, luxury hotel in the Colaba area of Mumbai, Maharashtra, India, situated next to the Gateway of India. Built in the Indo-Saracenic style, it opened in 1903 as the Taj Mahal Hotel and has historically often been known simply as "The Taj".',
    price:600
  ),
  Hotels(
      imageurl: 'assets/images/theashok.jpg',
      name:'The Ashok',
      location: 'NewDelhi',
      rating:4.6,
      description:'In harmony with its amazing Lutyen’s settings rises The Ashok. An inspirationally conceived architectural marvel designed to capture the essence of surrounding natural wonders amidst the hustle and bustle of the capital city. ',
    price:650
  ),
  Hotels(
      imageurl: 'assets/images/tajhoteldelhi.jpg',
      name:'TajHotel',
      location: 'NewDelhi',
      rating:4.9,
    description: 'The Capital’s Palace Since 1983. Nestled amidst the heart of the historic Indian capital city, the iconic Taj Palace, New Delhi has held a distinguished position amongst the finest hotels of the world for close to four decades. ',
    price:540
  )
];



