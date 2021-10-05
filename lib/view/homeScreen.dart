import 'dart:io';

import 'package:day_manager/components/recentTransList.dart';
import 'package:day_manager/components/homeReportContainer.dart';
import 'package:day_manager/constFiles/colors.dart';
import 'package:day_manager/controller/transactionController.dart';
import 'package:day_manager/controller/transDetailController.dart';
import 'package:day_manager/customWidgets/textButton.dart';
import 'package:day_manager/main.dart';
import 'package:day_manager/view/transactionList.dart';
import 'package:day_manager/view/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String number = "";
  var aaa = "";

  @override
  void initState() {
    super.initState();
    getData('name').then((value) => number = value);
  }

  @override
  static File? imageFile;
  TextEditingController controller = TextEditingController();
  TextEditingController _textFieldController = TextEditingController();
  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Name'),
            content: TextField(
              onChanged: (text) {
                aaa = text;
              },
              controller: _textFieldController,
              obscureText: false,
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Submit'),
                onPressed: () {
                  _save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _textFieldController.text = aaa;

    TransactionController transactionController =
        Provider.of<TransactionController>(context);
    TransDetailController transactionDetailController =
        Provider.of<TransDetailController>(context);

    return transactionController.fetching
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              //userData
              // UserProfileCard(),
              Row(
                children: [
                  Container(
                    height: 85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "สวัสดีคุณ,",
                          style: TextStyle(
                            color: greyText,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(21.0),
                        //   child: Text(number.toString()),
                        // ),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 12.0),
                  text:new TextSpan(
                          text : number.toString(),
                          style: TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            decoration: TextDecoration.none,
                          ),
                        ),)
                        
                      ],
                    ),
                  ),
                  SizedBox(width: 80.0),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: RaisedButton(
                                child: Text(
                                  'ใส่ชือ',
                                  style: GoogleFonts.kanit(),
                                ),
                                color: Colors.greenAccent,
                                textColor: Colors.white,
                                onPressed: () => _displayDialog(context)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: RaisedButton(
                              child: Text(
                                'โปรไฟล์',
                                style: GoogleFonts.kanit(),
                              ),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              HomeReportContainer(transactionController: transactionController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text("รายการทั้งหมด",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ))),
                  Expanded(
                    child: CustomTextButton(
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TransactionList())),
                      textStyle: TextStyle(
                          color: selectedTextButton,
                          fontWeight: FontWeight.bold),
                      text: 'ดูทั้งหมด',
                    ),
                  )
                ],
              ),
              RecentTransList(
                  transController: transactionController,
                  transDetailController: transactionDetailController),
            ],
          );
  }
  // Shared preferences

  // _read() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'name';
  //   final value = prefs.getString(key) ?? 0;
  //   print('read: $value');
  // }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'name';
    final value = aaa;
    prefs.setString(key, value);
    print('saved: $value + "  " $key');
  }

  Future<String> getData(String key) async {
    var pref = await SharedPreferences.getInstance();
    var number = pref.getString(key) ?? "";
    return number;
  }
}
