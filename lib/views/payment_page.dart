import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value == "") {
                  return 'Please enter amount';
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: const Text('PAY'))
          ],
        ),
      )),
    );
  }
}
