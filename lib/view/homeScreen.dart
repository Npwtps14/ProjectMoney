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
import 'package:day_manager/pdf.dart';
import 'package:day_manager/view/userpdf_page.dart';
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
  var user = "";
  @override
  void initState() {
    super.initState();
    getData('name').then((value) => number = value);
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController salaryController = new TextEditingController();
  TextEditingController lastSalaryController = new TextEditingController();
  TextEditingController incomeController = new TextEditingController();
  TextEditingController paysController = new TextEditingController();
  @override
  static File? imageFile;
  TextEditingController controller = TextEditingController();
  TextEditingController _textFieldController = TextEditingController();
  _userDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('สร้างรายงาน'),
            content: Container(
              color: Colors.white,
              child: new ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      new Container(
                        height: 60.0,
                        color: Colors.white,
                      ),
                      Center(
                        child: new Card(
                          color: Color(0xffFFFFFF),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 0.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'ข้อมูลบุคคล',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'ชื่อ-นามสกุล',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            keyboardType: TextInputType.name,
                                            controller: nameController,
                                            decoration: const InputDecoration(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Email',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: emailController,
                                            decoration: const InputDecoration(
                                                hintText: ""),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'เบอร์โทรศัพท์',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: phoneController,
                                            decoration: const InputDecoration(
                                                hintText: ""),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'เงินเดือนเต็ม',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        child: new TextField(
                                          controller: salaryController,
                                          decoration: const InputDecoration(
                                              hintText: ""),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'เงินเดือนล่าสุด',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        child: new TextField(
                                          controller: lastSalaryController,
                                          decoration: const InputDecoration(
                                              hintText: ""),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'รายรับ',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        child: new TextField(
                                          controller: incomeController,
                                          decoration: const InputDecoration(
                                              hintText: ""),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'รายจ่าย',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        child: new TextField(
                                          keyboardType: TextInputType.number,
                                          controller: paysController,
                                          decoration: const InputDecoration(
                                              hintText: ""),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Submit'),
                onPressed: () {
                  var userData = new MaterialPageRoute(
                    builder: (BuildContext contex) => PdfPage(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      saraly: salaryController.text,
                      lastSaraly: lastSalaryController.text,
                      income: incomeController.text,
                      pays: paysController.text
                      
                    ),
                  );
                  Navigator.of(context).push(userData);
                },
              )
            ],
          );
        });
  }

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
                          text: new TextSpan(
                            text: number.toString(),
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        )
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
                                  'รายงาน',
                                  style: GoogleFonts.kanit(),
                                ),
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                onPressed: () => _userDialog(context)),
                            // onPressed: () {
                            //   var userData = new MaterialPageRoute(
                            //     builder: (BuildContext contex) =>
                            //         UserpdfPage(),
                            //   );
                            //   Navigator.of(context).push(userData);
                            // },
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
