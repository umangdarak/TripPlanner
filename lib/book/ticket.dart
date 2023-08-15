class Ticket {
int id;
String name;
String email;
String phnno;
String location1;
String location2;
String hotel;
Ticket(
    {required this.id, required this.name, required this.email, required this.phnno, required this.location1,required this.location2, required this.hotel});
Ticket.fromMap(Map<String,dynamic> res)
    :id=res['id'],
name=res['name'],
email=res['email'],
phnno=res['phnno'],
location1=res['location1'],
location2=res['location2'],
hotel=res['hotel'];
Map<String,Object> toMap(){
return {'id':id,'name':name,'email':email,'phnno':phnno,'location1':location1,'location2':location2,'hotel':hotel};
}

}
