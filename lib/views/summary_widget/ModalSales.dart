
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:idash/constants.dart';
class SalesModal extends StatefulWidget {
  final String title;
  const SalesModal(this.title);

  @override
  State<SalesModal> createState() => _SalesModalState();
}

class _SalesModalState extends State<SalesModal> {
  Widget build(BuildContext context) {
    final List<EarningsTimeline> listEarnings = [
      EarningsTimeline(month: "Jan", earning: 20),
      EarningsTimeline(month: "Feb", earning: 10),
      EarningsTimeline(month: "Mar", earning: 25),
      EarningsTimeline(month: "Apr", earning: 15),
      EarningsTimeline(month: "May", earning: 22),
      EarningsTimeline(month: "Jun", earning: 18),
      EarningsTimeline(month: "Jul", earning: 12),
      EarningsTimeline(month: "Aug", earning: 15),
      EarningsTimeline(month: "Sep", earning: 22),
      EarningsTimeline(month: "Oct", earning: 20),
      EarningsTimeline(month: "Nov", earning: 11),
      EarningsTimeline(month: "Dec", earning: 16)
    ];

    List<charts.Series<EarningsTimeline, String>> timeline = [

      charts.Series(
        id: "Subscribers",
        data: listEarnings,
        domainFn: (EarningsTimeline timeline, _) => timeline.month,
        measureFn: (EarningsTimeline timeline, _) => timeline.earning,
        labelAccessorFn: (EarningsTimeline timeline, _) => timeline.earning.toStringAsFixed(0),
        colorFn: (EarningsTimeline timeline, _) =>
            charts.ColorUtil.fromDartColor(kPrimaryColor),
      )
    ];

    return Scaffold(
      body: Container(


              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text( widget.title +' Summary'),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 550,
                      child: charts.BarChart(

                        timeline,
                        animate: true,
                        vertical: false,
                        barRendererDecorator:
                        new charts.BarLabelDecorator<String>(),
                        // selectionModels: [
                        //   new charts.SelectionModelConfig(
                        //     type: charts.SelectionModelType.info,
                        //     // changedListener: _onSelectionChanged,
                        //     // updatedListener: _onSelectionChanged,
                        //   )
                        // ],
                      ),
                  ),
                    ),

                  ],
                ),

          )),
    );
  }

  Widget _buildRow(String imageAsset, String name, double score) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 12),
          Container(height: 2, color: kPrimaryColor),
          SizedBox(height: 12),
          Row(
            children: <Widget>[
              CircleAvatar(
                  backgroundImage: AssetImage('assets/images/light-1.png')),
              SizedBox(width: 12),
              Text(name),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.yellow[900],
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text('$score'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget test() {
    return const Tooltip(
      message: 'I am a Tooltip',
      child: Text('Hover over the text to show a tooltip.'),
    );
  }

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    if (selectedDatum.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            elevation: 16,
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(height: 20),
                  Center(child: Text('Leaderboard')),
                  SizedBox(height: 20),
                  _buildRow('assets/choc.png', 'Name 1', 1000),
                  _buildRow('assets/choc.png', 'Name 2', 2000),
                  _buildRow('assets/choc.png', 'Name 3', 3000),
                  _buildRow('assets/choc.png', 'Name 4', 4000),
                  _buildRow('assets/choc.png', 'Name 5', 5000),
                  _buildRow('assets/choc.png', 'Name 6', 6000),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}

class EarningsTimeline {
  final String month;
  final double earning;

  EarningsTimeline({
    required this.month,
    required this.earning,
  });
}