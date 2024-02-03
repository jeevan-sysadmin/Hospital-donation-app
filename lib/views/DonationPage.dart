import 'package:flutter/material.dart';

class MoneyDonationPage extends StatefulWidget {
  @override
  _MoneyDonationPageState createState() => _MoneyDonationPageState();
}

class _MoneyDonationPageState extends State<MoneyDonationPage> {
  String selectedAmount = '';
  final TextEditingController customAmountController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Donation Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pick an amount:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              _buildAmountSelection('100', '100 rupees'),
              _buildAmountSelection('500', '500 rupees'),
              _buildAmountSelection('2000', '2000 rupees'),
              SizedBox(height: 20.0),
              Text(
                'Or enter an amount:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              _buildCustomAmountField(),
              SizedBox(height: 20.0),
              Text(
                'User Details:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              _buildTextField(nameController, 'Enter name'),
              SizedBox(height: 10.0),
              _buildTextField(emailController, 'Enter email'),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _displayDonationDetails();
                },
                child: Text('Pay'),
              ),
              SizedBox(height: 20.0),
              Text(
                'Donation Details:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text('Amount: $selectedAmount'),
              Text('Name: ${nameController.text}'),
              Text('Email: ${emailController.text}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountSelection(String value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedAmount,
          onChanged: (String? newValue) {
            setState(() {
              selectedAmount = newValue!;
              customAmountController.clear();
            });
          },
        ),
        Text(label),
      ],
    );
  }

  Widget _buildCustomAmountField() {
    return TextFormField(
      controller: customAmountController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Enter amount',
        border: OutlineInputBorder(),
      ),
      onChanged: (_) {
        setState(() {
          selectedAmount = '';
        });
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(),
      ),
    );
  }

  void _displayDonationDetails() {
    String amount = selectedAmount.isNotEmpty
        ? '$selectedAmount rupees'
        : '${customAmountController.text} rupees';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Donation Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Amount: $amount'),
              Text('Name: ${nameController.text}'),
              Text('Email: ${emailController.text}'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MoneyDonationPage(),
  ));
}
