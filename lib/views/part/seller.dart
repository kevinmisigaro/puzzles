import 'package:flutter/material.dart';

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
        backgroundColor: Theme.of(context).primaryColor, child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(context: context, 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),),),
              isScrollControlled: false, enableDrag: true, isDismissible: true, builder: (context) {
                return DraggableScrollableSheet(initialChildSize: 1, maxChildSize: 1, 
                  minChildSize: 1, expand: true, builder: (context, scrollController) {
                  return Container(color: Colors.white, child: Column(children: [
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
                  ],),);
                });
          });
        },
      ),
    );
  }
}