import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trip2/book/form.dart';

import 'databasehelper.dart';



class BankDetails extends StatefulWidget {


  static String? validate(String?i) {
    if (i!.isEmpty){return 'Field Required';}
    return null;
  }

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  final _bankController=TextEditingController();
List<String>banks=['SBI','BankOfBaroda','AxisBank','Kotak'];
  final _passwordController=TextEditingController();

  final formkey =GlobalKey<FormState>();
bool loading=true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body:SingleChildScrollView(
          child: Container(height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30)
            ),
            child:Padding(
              padding: const EdgeInsets.only(left:20,right:20),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Image.asset('assets/images/bank.png',height: 300,width: 300,),
                  Form(
                    key:formkey,
                    child: Center(
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 100,),
                        Container(height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(20)

                          ),
                          child: Row(
                              children: [
                                const Text('  Select Bank:'),
                                const SizedBox(width: 5,),
                                Container(height: 30,
                                  child: DropdownMenu(requestFocusOnTap: true,inputDecorationTheme: const InputDecorationTheme(constraints:BoxConstraints(
                                      maxHeight: 32
                                  ),
                                      border: InputBorder.none,alignLabelWithHint: true),
                                    hintText: 'Bank',dropdownMenuEntries: banks.map((String e){return DropdownMenuEntry(value: e,label: e);}).toList(),
                                  ),
                                ),]),),
                        SizedBox(height: 20,),
                        Container(decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20)

                        ),
                          child: TextFormField(
                            showCursor: false,
                            //validator: validate,
                            controller: _bankController,
                            decoration: const InputDecoration(hintText: '  BankAccount Number',contentPadding:EdgeInsets.only(left:10),border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20)

                        ),
                          child: TextFormField(
                            obscureText: true,
                            showCursor: false,
                            //validator: validate,
                            controller: _passwordController,
                            decoration: const InputDecoration(hintText: '  Password',border: InputBorder.none,contentPadding: EdgeInsets.only(left:10)),
                          ),
                        ),
                        SizedBox(height: 50,),
                        TextButton(onPressed: () async{
                                  setState(() {
                                    loading=false;
                                  });
      Future.delayed(Duration(seconds: 3)).then((value){
                         Navigator.pushReplacementNamed(context,'home');});
                                    }
                        ,child: loading?Text('Book!'):CircularProgressIndicator(color:Colors.blueAccent)),




                      ],
                      ),
                    ),
            ),
                ],
              )
          )
      ),
        )),
    );
  }
}
