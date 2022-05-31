import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:idash/api/api.dart';
import 'package:idash/models/Breakdown.dart';
import 'package:idash/models/Profile.dart';
import 'package:idash/models/SalesSummary.dart';
class RemoteServices {
  static var client = http.Client();

  // static Future<List<AppDashboard>> fetchappDashboard() async {
  //   var response = await  CallApi().getData('app_dashboard');
  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //     var jsone  =  json.decode(jsonString);
  //     var jsonString2 = jsone['data'];

  //     return appDashboardFromJson(json.encode(jsonString2));
  //   } else {
  //     //show error message
  //     return null;
  //   }
  // }






  static Future<Profile?> fetchPofile() async {
    var response = await  CallApi().getData('profile');
    if (response.statusCode == 200) {
       var jsonString = response.body;
      return  profileFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
  static Future<List<SalesSummary>?> fetchSalesSummary(String filter) async {
    var response = await  CallApi().getData('sales_summary'+filter);
    if (response.statusCode == 200) {
       var jsonString = response.body;
      return  salesSummaryFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }


  static Future<List<Breakdown>?> fetchBreakdown(String filter) async {
    var response = await  CallApi().getData('sales_summary'+filter);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return  breakdownFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

}
