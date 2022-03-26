import 'package:flutter/material.dart';
import 'package:payment_app/views/part/client.dart';
import 'package:payment_app/views/part/seller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = '';

  @override
  void initState() {
    getData();
  }

  void getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userName = preferences.getString('userName')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, automaticallyImplyLeading: false,
        title: Text('Welcome, ' + userName, style: TextStyle(fontFamily: 'Euclid Circular B',
        fontSize: 32.0, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, ),),
        toolbarHeight: height * .08, 
        bottom: TabBar(
          labelColor: Color(0xFF3A3A3A), indicatorColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(fontFamily: 'Euclid Circular A', fontSize: 20.0,
             color: Colors.white, ),
            tabs: [
              Tab(text: "Payments"),
              Tab(text: "Orders"),
            ],
          ),
      ),
      body: TabBarView(
        children: <Widget>[ 
          ClientPage(),
          SellerPage()
        ]
      )
    ));
  }
}