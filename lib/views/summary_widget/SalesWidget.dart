import 'package:flutter/material.dart';
import 'package:idash/constants.dart';
import 'package:idash/services/remote_services.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SalesWidget extends StatefulWidget {
  @override
  State<SalesWidget> createState() => _SalesWidgetState();
}

class _SalesWidgetState extends State<SalesWidget> {
  String imsTarget = '';
  String lifting = ''; 
  void initState() {
    super.initState();
    getApiData();
  }

  getApiData() async {
    var info = await RemoteServices.fetchSalesSummary();
    setState(() {
      imsTarget = info![0].imsTarget;
      lifting = info![0].lifting;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10 , right: 10),
          child: Column(
            children: [
               Padding(
                 padding: const EdgeInsets.only(left: 15 , top: 15 , bottom: 10),
                 child: Align(
                   alignment: Alignment.topLeft,
                   child: Text('Sales Summary (April-2022)' , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 16),)),
               ),
               presentCard(context, 'Lifting' , 0.7 , lifting , '1061.9 M'),
               presentCard(context, 'Collection ', 0.5, '1234' , '105.7 M'),
               presentCard(context, 'Dues ', 0.9, '23456' , '956.2 M'),
               presentCard(context, 'IMS ', 0.6, '345678' , '956.2 M'),
               presentCard(context, 'Market Collection Suammary  ', 1, '345678' , '-1954.5 M'),
            ],
          ),
        ),
      ),
    );
  }

  Container presentCard(
    BuildContext context, 
    String title ,
    double progress  ,
    String progressValue ,  
    String total,
    ) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(title),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: LinearPercentIndicator(
                    lineHeight: 20,
                    center: Text(progressValue),
                    progressColor: kPrimaryColor,
                    barRadius: Radius.elliptical(5, 10),
                    percent: progress,
                    animation: true,
                    animationDuration: 2000,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(total , style: TextStyle( fontWeight: FontWeight.bold), ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
