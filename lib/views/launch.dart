import 'package:flutter/material.dart';
import 'package:payment_app/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({ Key? key }) : super(key: key);

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    checkData();
    super.initState();
  }

  void checkData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool firstTime = preferences.getBool('firstTime') != null && preferences.getBool('firstTime') != false ? true : false;
    if (firstTime) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(height: height, width: width,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .70,),
              Container(width: width * .85, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), 
                  color: const Color(0xFFD3D3D3), ),
                  child: Padding(padding: const EdgeInsets.only(left: 12),
                  child: TextFormField(controller: nameController, keyboardType: TextInputType.text, 
                    style : const TextStyle(fontSize: 14.0, color: Color(0xFF3A3A3A)), decoration: const InputDecoration(
                      border: InputBorder.none, 
                    labelStyle: TextStyle(
                      fontSize: 14.0, 
                      color: Color(0xFF3A3A3A), 
                      fontWeight: FontWeight.w600,
                      ), 
                  labelText: "User Name",
                  ),),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .02,),
              InkWell( 
                onTap: () async {
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.setString('userName', nameController.text);
                  preferences.setBool('firstTime', true);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
                },
                child: Container(alignment: Alignment.center, width: width * .85, height: 55,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Text('Save', style: TextStyle( fontFamily: 'Euclid Circular A',
                    fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}