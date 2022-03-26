import 'package:flutter/material.dart';
import 'package:payment_app/views/scan.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({ Key? key }) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(width: width, child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .02,),
            
            Padding(padding: const EdgeInsets.only(left: 12.0, ),
              child: ListTile(
                title:Text('History', style: TextStyle(fontFamily: 'Euclid Circular A',
                  fontSize: 24.0, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
              ),
            ),
            ListView.builder(
              physics: const ScrollPhysics(),
              // controller: scrollController,
              shrinkWrap: true, primary: false,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding( padding: const EdgeInsets.only(left: 10.0, right: 10.0, top:4.0, bottom: 4.0),
                  child: Container(width: width * .95, height: height * .08,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), color: Color(0xFFD3D3D3),),
                      child: ListTile(
                        title:Text('10,000', style: TextStyle(fontFamily: 'Euclid Circular A', fontSize: 22.0,
                          color: Color(0xFF3A3A3A), fontWeight: FontWeight.w700,),),
                        subtitle: Text('Not Complete', style: TextStyle(fontFamily: 'Euclid Circular A',
                          fontSize: 12.0, color: Theme.of(context).primaryColor, ),),
                        trailing: Text('21-12-22', style: TextStyle(fontFamily: 'Euclid Circular A', fontSize: 10.0,
                              color: Color(0xFF3A3A3A), fontWeight: FontWeight.w500,),),
                )));
              },),           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor, child: const Icon(Icons.qr_code_scanner),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScanPage()));
        },
      ),
    );
  }
}