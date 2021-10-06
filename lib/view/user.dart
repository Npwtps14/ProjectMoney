import 'package:day_manager/components/userProfileCard.dart';
import 'package:day_manager/pdf.dart';
import 'package:day_manager/view/homeScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:restart_app/restart_app.dart';

import '../main.dart';
import 'home.dart';

class ProfilePage extends StatefulWidget {
  final name;

  const ProfilePage({this.name = ''});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var dio = Dio();

  Future postProfile() async {
    final String pathUrl = 'https://meowdev.herokuapp.com/profiles';

    dynamic profiles = {
      "name": nameController.text.toString(),
      "phone": phoneController.text.toString(),
      "email": emailController.text.toString(),
      "salary": salaryController.text.toString(),
    };
    var response = await dio.post(pathUrl,
        data: profiles,
        options: Options(headers: {
          'Content-type': 'application/json',
        }));

    return response.data;
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController rankController = new TextEditingController();
  TextEditingController salaryController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text = widget.name;
    return new Scaffold(
        body: new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: 60.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: new Text('PROFILE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      fontFamily: 'sans-serif-light',
                                      color: Colors.black)),
                            )
                          ],
                        )),
                  ],
                ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                    decoration:
                                        const InputDecoration(hintText: ""),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                    decoration:
                                        const InputDecoration(hintText: ""),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: new Text(
                                      'เงินเดือน',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  flex: 2,
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
                                    decoration:
                                        const InputDecoration(hintText: ""),
                                  ),
                                  flex: 2,
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 45.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              _status ? _getEditIcon() : new Container(),
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
    ));
  }

  // Widget _getEditIcon() {
  //   return new Expanded(
  //     child: Padding(
  //       padding: EdgeInsets.only(left: 10.0),
  //       child: Container(
  //           child: new RaisedButton(
  //         child: new Text("เพิ่มข้อมูล"),
  //         textColor: Colors.white,
  //         color: Colors.green,
  //         onPressed: () async {
  //           await postProfile().then((value) {
  //             print(value);
  //             Restart.restartApp();
  //             setState(() {
  //               _status = true;
  //               FocusScope.of(context).requestFocus(new FocusNode());
  //             });
  //           });
  //         },
  //         shape: new RoundedRectangleBorder(
  //             borderRadius: new BorderRadius.circular(20.0)),
  //       )),
  //     ),
  //     flex: 2,
  //   );
  // }
  Widget _getEditIcon() {
    return new Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Container(
            child: new RaisedButton(
          child: new Text("สร้าง PDF"),
          textColor: Colors.white,
          color: Colors.green,
          onPressed: () {
            var userData = new MaterialPageRoute(
              builder: (BuildContext contex) =>
                  PdfPage(name: nameController.text),
            );
            // Navigator.of(context).push(userData);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0)),
        )),
      ),
      flex: 2,
    );
  }
}
