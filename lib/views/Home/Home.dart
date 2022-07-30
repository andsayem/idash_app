import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idash/constants.dart';
import 'package:idash/services/remote_services.dart';
import 'package:idash/views/summary_widget/SalesWidget.dart';
import 'dart:convert';
import 'package:idash/widget/navigation_drawer_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  const Home();
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  String state = 'Animation start';
  bool isRunning = true;

  TextEditingController codeController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          drawer: NavigationDrawerWidget(),
          appBar: AppBar(
            toolbarHeight: 60,
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            title: Container(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Integrated Dashboard',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            //centerTitle: true,
            //elevation: 20,
            shadowColor: kPrimaryLightColor,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            leading: Container(
              child: Row(
                children: [
                  Builder(
                    builder: (context) => // Ensure Scaffold is in context
                        IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () => Scaffold.of(context).openDrawer()),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
            ],
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        text: 'Sales',
                      ),
                      Tab(
                        text: 'Production',
                      ),
                      Tab(
                        text: 'Finance',
                      ),
                      Tab(
                        text: 'Supply Chain',
                      ),
                    ]),
                preferredSize: Size.fromHeight(30.0)),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: SalesWidget(),
              ),
              Container(
                child: Center(
                  child: Text('Tab 2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 3'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 4'),
                ),
              ),
            ],
          )),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       drawer: NavigationDrawerWidget(),
  //       appBar: AppBar(
  //         toolbarHeight: 60,
  //         backgroundColor: kPrimaryColor,
  //         title: Container(
  //           child: Column(
  //             children: [
  //               Container(
  //                 child: Text(
  //                   'Integrated Dashboard',
  //                   textAlign: TextAlign.start,
  //                   style: TextStyle(fontSize: 18),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         //centerTitle: true,
  //         //elevation: 20,
  //         shadowColor: kPrimaryLightColor,
  //         //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //         leading: Container(
  //           child: Row(
  //             children: [
  //               Builder(
  //                 builder: (context) => // Ensure Scaffold is in context
  //                     IconButton(
  //                         icon: Icon(Icons.menu),
  //                         onPressed: () => Scaffold.of(context).openDrawer()),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
  //         ],
  //         bottom: PreferredSize(
  //           preferredSize:  Size.fromHeight(30.0),
  //           child: TabBar(
  //           controller: _tabController,
  //           tabs: [
  //             Tab(
  //               text: 'Sales',
  //             ),
  //             Tab(
  //               text: 'Production',
  //             ),
  //             Tab(
  //               text: 'Finance',
  //             ),
  //              Tab(
  //               text: 'Supply Chain',
  //             ),
  //           ],
  //                 ),
  //         ),
  //       ),
  //       body: Container(

  //           child: SingleChildScrollView(
  //             child: Column(
  //               children: <Widget>[
  //                 Align(
  //                   alignment: Alignment.topLeft,
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 15),
  //                     child: Text('Sales Summary (April-2022)' , style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold),),
  //                   )),
  //                 Padding(
  //                   padding: EdgeInsets.all(5),
  //                   child: LinearPercentIndicator(
  //                     lineHeight: 15,
  //                     center: Text( lifting),
  //                     progressColor: kPrimaryColor,
  //                     barRadius: Radius.elliptical(5, 10),
  //                     percent: .7,
  //                     animation: true,
  //                     animationDuration: 2000,
  //                   ),
  //                 ),
  //                 // ignore: prefer_const_constructors
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 15 , bottom: 10),
  //                   child: Align(
  //                     alignment: Alignment.topLeft,
  //                     child: Text('Lifting'),
  //                   ),
  //                 ),

  //                 Padding(
  //                   padding: EdgeInsets.all(5),
  //                   child: LinearPercentIndicator(
  //                     lineHeight: 15,
  //                     center: Text('70%'),
  //                     progressColor: kPrimaryColor,
  //                     barRadius: Radius.elliptical(5, 10),
  //                     percent: .7,
  //                     animation: true,
  //                     animationDuration: 1400,
  //                   ),
  //                 ),
  //                  Padding(
  //                   padding: const EdgeInsets.only(left: 15 , bottom: 10),
  //                   child: Align(
  //                     alignment: Alignment.topLeft,
  //                     child: Text('Collection'),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(5),
  //                   child: LinearPercentIndicator(
  //                     lineHeight: 15,
  //                     center: Text('80%'),
  //                     progressColor: kPrimaryColor,
  //                     barRadius: Radius.elliptical(5, 10),
  //                     percent: .7,
  //                     animation: true,
  //                     animationDuration: 1400,
  //                   ),
  //                 ),
  //                  Padding(
  //                   padding: const EdgeInsets.only(left: 15 , bottom: 10),
  //                   child: Align(
  //                     alignment: Alignment.topLeft,
  //                     child: Text('Dues'),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(5),
  //                   child: LinearPercentIndicator(
  //                     lineHeight: 15,
  //                     center: Text('70%'),
  //                     progressColor: kPrimaryColor,
  //                     barRadius: Radius.elliptical(5, 10),
  //                     percent: .7,
  //                     animation: true,
  //                     animationDuration: 1400,
  //                   ),
  //                 ),
  //                  Padding(
  //                   padding: const EdgeInsets.only(left: 15 , bottom: 10),
  //                   child: Align(
  //                     alignment: Alignment.topLeft,
  //                     child: Text('IMS'),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(5),
  //                   child: LinearPercentIndicator(
  //                     lineHeight: 15,
  //                     center: Text('70%'),
  //                     progressColor: kPrimaryColor,
  //                     barRadius: Radius.elliptical(5, 10),
  //                     percent: .7,
  //                     animation: true,
  //                     animationDuration: 1400,
  //                   ),
  //                 ),
  //                  Padding(
  //                   padding: const EdgeInsets.only(left: 15 , bottom: 10),
  //                   child: Align(
  //                     alignment: Alignment.topLeft,
  //                     child: Text('Market Collection Suammary'),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),

  //       ));
  // }
}
