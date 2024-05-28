import 'package:flutter/material.dart';

void main() {
  runApp(const PaymentForm());
}

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment Form',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Container(
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 218, 218, 218).withOpacity(0.5),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.green,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          title: const Text('Payment Form'),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/BACKGROUND.jpg'), // Correct image path
                    fit: BoxFit.cover,
                  ),
                ),
                child: const PaymentFormWidget(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60, // Adjust height as needed
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.spa),
                  onPressed: () {
                    // Handle home button press
                  },
                  tooltip: 'Kids',
                ),
                const Text('Kids'),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // Handle alerts button press
                  },
                  tooltip: 'Alerts',
                ),
                const Text('Alerts'),
                IconButton(
                  icon: const Icon(Icons.speed_rounded),
                  onPressed: () {
                    // Handle monitor button press
                  },
                  tooltip: 'Monitor',
                ),
                const Text('Monitor'),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Handle settings button press
                  },
                  tooltip: 'Settings',
                ),
                const Text('Settings'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentFormWidget extends StatefulWidget {
  const PaymentFormWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentFormWidgetState createState() => _PaymentFormWidgetState();
}

class _PaymentFormWidgetState extends State<PaymentFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String _selectedCurrency = 'XAF';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(0.7),
        child: Column(
          children: [
            const Expanded(
              child: SizedBox(
                height: 50,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(00.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'NUMBER',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                            top: 15.0,
                            bottom: 15,
                            left: 10.0,
                          ),
                          child: TextFormField(
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: 'Please enter your phone number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 7.0),
                        const Text(
                          'Amount',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 15.0,
                                  top: 8.0,
                                  bottom: 15.0,
                                  left: 15.0,
                                ),
                                child: TextFormField(
                                  controller: _amountController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'Please input your amount here',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                        bottomLeft: Radius.circular(30.0),
                                        topLeft: Radius.circular(30.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an amount';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: DropdownButton<String>(
                                value: _selectedCurrency,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedCurrency = newValue!;
                                  });
                                },
                                items: <String>[
                                  'XAF',
                                  'XOF',
                                  'USD',
                                  'EUR',
                                  'GBP'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Payment processed successfully'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            // Adjust padding here
                            minimumSize: const Size(double.infinity, 0),
                            // Set button width
                            backgroundColor:
                                const Color.fromARGB(255, 0, 255, 8),
                          ),
                          child: const Text(
                            'Pay Fees',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
