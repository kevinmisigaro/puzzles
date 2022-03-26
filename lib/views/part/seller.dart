import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SellerPage extends StatefulWidget {
  const SellerPage({ Key? key }) : super(key: key);

  @override
  State<SellerPage> createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  TextEditingController tableController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(width: width, child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .02,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0, ),
              child: ListTile(
                title:Text('History', style: TextStyle(fontFamily: 'Euclid Circular A',
                  fontSize: 24.0, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
              ),
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              // controller: scrollController,
              shrinkWrap: true, primary: false,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding( padding: const EdgeInsets.only(left: 10.0, right: 10.0, top:4.0, bottom: 4.0),
                  child: Container(width: width * .95, height: height * .08,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), color: Color(0xFFD3D3D3),),
                      child: ListTile(onTap: () {
                        showModalBottomSheet<void>(context: context, isScrollControlled: true,
                          enableDrag: true, isDismissible: true, builder: (BuildContext context) {
                            return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                              return Container(padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom,),
                                color: Colors.white, child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start, mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(height: MediaQuery.of(context).size.height * .02,),
                                  Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0, ),
                                    child: ListTile(
                                      title:Text('Order Details', style: TextStyle(fontFamily: 'Euclid Circular A',
                                        fontSize: 16.0, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * .02,),
                                  QrImage(
                                    data: "1234567890",
                                    version: QrVersions.auto,
                                    size: 200.0,
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * .02,),
                                  Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0, ),
                                    child: ListTile(dense: true,
                                      title:Text('Table : 10', style: TextStyle(fontFamily: 'Euclid Circular A',
                                        fontSize: 35.0, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0, ),
                                    child: ListTile(dense: true,
                                      title:Text('Amount : 10,000', style: TextStyle(fontFamily: 'Euclid Circular A',
                                        fontSize: 28.0, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * .02,),
                                ],
                              ),
                            ),
                          );
                        },);
                        });
                      },
                        title:Text('Table : 10', style: TextStyle(fontFamily: 'Euclid Circular A', fontSize: 22.0,
                          color: Color(0xFF3A3A3A), fontWeight: FontWeight.w700,),),
                        subtitle: Text('Amount : 10,000', style: TextStyle(fontFamily: 'Euclid Circular A',
                          fontSize: 12.0, color: Theme.of(context).primaryColor, ),),
                        trailing: Text('Complete', style: TextStyle(fontFamily: 'Euclid Circular A', fontSize: 10.0,
                              color: Color(0xFF3A3A3A), fontWeight: FontWeight.w500,),),
                )));
              },),           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor, child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet<void>(context: context, isScrollControlled: true,
            enableDrag: true, isDismissible: true, builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                return Container(padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,),
                  color: Colors.white, child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height * .02,),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0, ),
                      child: ListTile(
                        title:Text('Create Order', style: TextStyle(fontFamily: 'Euclid Circular A',
                          fontSize: 16.0, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .02,),
                    Container(width: width * .85, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), 
                      color: Color(0xFFD3D3D3), ),
                      child: Padding(padding: EdgeInsets.only(left: 12),
                      child: TextFormField(controller: tableController, keyboardType: TextInputType.text, 
                        style : TextStyle(fontSize: 14.0, color: Color(0xFF3A3A3A)), decoration: InputDecoration(border: InputBorder.none, 
                        labelStyle: TextStyle(fontSize: 14.0, color: Color(0xFF3A3A3A), fontWeight: FontWeight.w600,), labelText: "Table",
                      ),),),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .02,),
                    Container(width: width * .85, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), 
                      color: Color(0xFFD3D3D3), ),
                      child: Padding(padding: EdgeInsets.only(left: 12),
                      child: TextFormField(controller: amountController, keyboardType: TextInputType.number, 
                        style : TextStyle(fontSize: 14.0, color: Color(0xFF3A3A3A)), decoration: InputDecoration(border: InputBorder.none, 
                        labelStyle: TextStyle(fontSize: 14.0, color: Color(0xFF3A3A3A), fontWeight: FontWeight.w600,), labelText: "Amount",
                      ),),),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .02,),
                    InkWell( 
                      onTap: () async {
                        
                      },
                      child: Container(alignment: Alignment.center,  width: width * .85, height: 55,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text('Save', style: TextStyle( fontFamily: 'Euclid Circular A',
                          fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },);
          });
        },
      ),
    );
  }
}