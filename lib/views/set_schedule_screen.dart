import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/set_schedule_controller.dart';

class SetScheduleScreen extends StatelessWidget {
  SetScheduleScreen({Key? key}) : super(key: key);

  final controller = Get.put(SetScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedAmount = '100'; // Default selected amount
  String enteredAmount = '100';
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Payment',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Pick an amount',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildAmountPicker('100'),
                buildAmountPicker('500'),
                buildAmountPicker('2000'),
              ],
            ),
            SizedBox(height: 20),
            Text('(or)'),
            Text(
              'Enter an amount',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: amountController,
              onChanged: (value) {
                setState(() {
                  enteredAmount = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Text(
              'Name',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Process payment here using the entered data
                print('Selected Amount: $selectedAmount');
                print('Entered Amount: $enteredAmount');
                print('Name: ${nameController.text}');
                print('Email: ${emailController.text}');
                // Add functionality to process payment
              },
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAmountPicker(String amount) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmount = amount;
          enteredAmount = amount; // Set entered amount to the selected preset
          amountController.text = amount; // Update text field value
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedAmount == amount ? Colors.green : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          '$amount Rupees',
          style: TextStyle(
            fontSize: 16,
            color: selectedAmount == amount ? Colors.green : Colors.black,
          ),
        ),
      ),
    );
  }
}
