import 'dart:convert';
import 'dart:developer';
 
import 'package:idash/api/api.dart';
import 'package:idash/constants.dart'; 
import 'package:idash/services/remote_services.dart';
import 'package:idash/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io'; 
import 'package:image_picker/image_picker.dart';

//import 'package:image_picker/image_picker.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({required Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with WidgetsBindingObserver {
  
  late String name;
  late String phone;
  late int id; 
  var userData;
 
  //for captured image
  getApiData() async {
    var info = await RemoteServices.fetchPofile(); 
    setState(() {
      name = info!.name;
      phone = info.email;
      id = info.id;
    });
  }

  void initState() {
    super.initState(); 
    getApiData();
  }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: kPrimaryColor,
        title: Container(
          child: Column(
            children: [
              Container(
                child: Text(
                  name.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14),
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
          child: Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent.fdac45-1.fna.fbcdn.net/v/t1.6435-9/174758568_1876822559146829_974792907856265948_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeFkfYth7hjnD2OXf7RjQcX5kuTxU0dt8MKS5PFTR23wwtdZe4bvrZUrU0oLjvklqTwMOEa4yAOPDmttjVLAO1v7&_nc_ohc=vhUYX17dckQAX8sNzkP&_nc_ht=scontent.fdac45-1.fna&oh=00_AT-BHAvn06d77Ny2uFTRZkkgyO17KKo74LdTJ6oTy6GKKg&oe=626EA9A2'),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.precision_manufacturing))
        ],
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24), 
            ElevatedButton.icon( 
              onPressed: () async {
                
              },
              icon: Icon(Icons.camera),
              label: Text("Capture"),
            ),

            ClipOval( 
            ),
        
            const SizedBox(height: 24),
            Column(
              children: [
                Text(
                  name.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(phone.toString(), style: TextStyle(color: Colors.grey))
              ],
            ),
            const SizedBox(height: 24),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: kPrimaryColor,
                        size: 24,
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Full Name',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15,
                                  height: 2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Sayem',
                            //profile.profileInfo.length.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              height: 0.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.fingerprint,
                        color: kPrimaryColor,
                        size: 24,
                      ),
                      Column(
                        children: [
                          Text(
                            'User Id',
                            style: TextStyle(
                                fontSize: 15,
                                height: 2,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            id.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              height: 0.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.settings_phone,
                        color: kPrimaryColor,
                        size: 24,
                      ),
                      Column(
                        children: [
                          Text(
                            'Phone Number',
                            style: TextStyle(
                                fontSize: 15,
                                height: 2,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            phone.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              height: 0.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
 
}