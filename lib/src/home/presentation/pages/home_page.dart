import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ride_uber/src/home/presentation/widgets/home_map.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: <Widget>[HomeMap()],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 15.0,
                          spreadRadius: 15.0,
                          offset: Offset(0.7, 0.7))
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0))),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Nice to see you!',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Fira-Regular',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Select your next destination',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Fira-Bold',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.055),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 35.0,
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Text('Where are we going?',
                                    style: TextStyle(
                                        fontFamily: 'Fira-Bold',
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.home_outlined,
                                        color: Colors.white,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.07,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Add Your Home Location',
                                          style: TextStyle(
                                              fontFamily: 'Fira-Bold',
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06),
                                        ),
                                        Text(
                                          'Get Home Quickly',
                                          style: TextStyle(
                                              fontFamily: 'Fira-Regular',
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.cases,
                                        color: Colors.white,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.07,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Add Your Work Location',
                                          style: TextStyle(
                                              fontFamily: 'Fira-Bold',
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06),
                                        ),
                                        Text(
                                          'Get to Work with Ease',
                                          style: TextStyle(
                                              fontFamily: 'Fira-Regular',
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
