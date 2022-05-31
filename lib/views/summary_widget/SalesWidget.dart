// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idash/constants.dart';
import 'package:idash/models/SalesSummary.dart';
import 'package:idash/services/remote_services.dart';
import 'package:idash/views/summary_widget/ModalSales.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
class SalesWidget extends StatefulWidget {
  @override
  State<SalesWidget> createState() => _SalesWidgetState();
}

class _SalesWidgetState extends State<SalesWidget> {
  // String imsTarget = '';
  // String lifting = '';
  List Reportlist = <SalesSummary>[];
  String current_month = DateFormat('MMMM').format(new DateTime.now());
  String current_year = DateFormat('y').format(new DateTime.now());
  String current_month_id = DateFormat('M').format(new DateTime.now());
  String liftingValue ='0' ;
  double liftingPer = 0.0;
  String collectionValue  = '0';
  double collectionPer = 0.0;
  String deusValue  = '0';
  double deusPer = 0.0 ;
  String imsValue  = '0';
  double imsPer = 0.0 ;
  String imsCollValue  = '0';
  double imsCollPer = 0.0 ;
  void initState() {
    super.initState();
    getApiData();
  }

  getApiData() async {
    var info = await RemoteServices.fetchSalesSummary('?data_month='+current_year+'-'+current_month_id);

    setState(() {
        Reportlist = info!  ;
        liftingValue = (double.parse( Reportlist[0].lifting)/1000000).toStringAsFixed(1);
        liftingPer = double.parse((double.parse(Reportlist[0].lifting) / double.parse(Reportlist[0].liftingTarget)).toStringAsFixed(2));
        collectionValue = (double.parse( Reportlist[0].primaryCollection)/1000000).toStringAsFixed(1);
        collectionPer = double.parse((double.parse(Reportlist[0].primaryCollection) / double.parse(Reportlist[0].lifting)).toStringAsFixed(2));
        deusValue  = ((double.parse( Reportlist[0].lifting) - double.parse( Reportlist[0].primaryCollection)) /1000000).toStringAsFixed(1);
        deusPer =  double.parse(((double.parse( Reportlist[0].lifting) - double.parse( Reportlist[0].primaryCollection)) /  double.parse( Reportlist[0].lifting)).toStringAsFixed(1));
        imsValue = (double.parse( Reportlist[0].ims)/1000000).toStringAsFixed(1);
        imsPer =  double.parse((double.parse(Reportlist[0].marketCollection) / double.parse(Reportlist[0].ims)).toStringAsFixed(2));
        imsCollValue = ((double.parse( Reportlist[0].ims) -  double.parse( Reportlist[0].marketCollection)) / 1000000).toStringAsFixed(1);
        imsCollPer =   double.parse((double.parse(Reportlist[0].marketCollection) / double.parse(Reportlist[0].ims)).toStringAsFixed(2));
        // deusValue  = ((double.parse( Reportlist[0].lifting) - double.parse( Reportlist[0].primaryCollection)) /1000000).toStringAsFixed(1);
        // deusPer =  double.parse(((double.parse( Reportlist[0].lifting) - double.parse( Reportlist[0].primaryCollection)) /  double.parse( Reportlist[0].lifting)).toStringAsFixed(1));
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
                   child: Text('Sales Summary (' + current_month_id + current_month.toString() + '-' +current_year.toString()+')', style: TextStyle( fontWeight: FontWeight.bold , fontSize: 16),)),
               ),
               presentCard(context, 'Lifting' , liftingPer ,  (liftingPer * 100).toString()+'%'  , liftingValue+' M'),
               presentCard(context, 'Collection ', collectionPer ,( collectionPer * 100 ).toString() +'%', collectionValue+' M'),
               presentCard(context, 'Dues ', deusPer , ( deusPer * 100 ).toString() +'%' , deusValue+' M'),
               presentCard(context, 'IMS ', imsPer , ( imsPer * 100 ).toString() +'%' , imsValue+' M'),
               presentCard(context, 'Market Collection Suammary  ', imsCollPer , ( imsCollPer * 100 ).toString() +'%' , imsCollValue+' M'),
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
          GestureDetector (
        //   onTap: () => Navigator.of(context).push(
        // MaterialWithModalsPageRoute(
        //     builder: (context) => SimpleModal())),
          onTap: () => showBarModalBottomSheet(
            expand: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => SalesModal(title),
          ),
      child :
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(title),
            ),
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
