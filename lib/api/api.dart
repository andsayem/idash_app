import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

class CallApi { 
  final String _url = 'https://idashmdldev.ssgbd.com/api/';
 
  postData(data, apiUrl) async {
    // print(_url);
    var fullUrl;
    fullUrl = _url + apiUrl + await _getToken();
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  postLoginData(data, apiUrl) async {
    var fullUrl;
    fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaderswithout());
  }
  postSignData(data, apiUrl) async {
    var fullUrl;
    fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaderswithout());
  }


//
  postWithTokenData(data, apiUrl) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token').toString();
    //print(token);
    
    var fullUrl;
    fullUrl = _url + apiUrl;
    //print(fullUrl);
   // print('fullUrl');
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers:{
        'Content-type': 'application/json',
        'Accept': 'application/json' ,
        'Authorization' : 'Bearer '+token
      });
  }

  getData(apiUrl) async {
       SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token').toString();
    var fullUrl = _url + apiUrl;
    print(fullUrl);
    return await http.get(Uri.parse(fullUrl), headers:{
        'Content-type': 'application/json',
        'Accept': 'application/json' ,
        'Authorization' : 'Bearer '+token
      });
  }

  _setHeaderswithout() => {
        'Content-type': 'application/json',
        'Accept': 'application/json' 
      };
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
       // 'Authorization': 'Bearer ' +  _getToken(),
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token').toString();
    print(token);
    return  token ;
  }
}
