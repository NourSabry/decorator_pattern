// ignore_for_file: prefer_final_fields, avoid_print, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textController = TextEditingController();
  int _value = 0;

  String _showText() {
    if (_textController.text.isNotEmpty && _value != null) {
      return _textController.text;
    } else {
      const SnackBar(
        content: Text('please make sure to complete the previous questions'),
      );
    }
    return "";
  }

  List<DropdownMenuItem> _options = const [
    DropdownMenuItem(
      value: 0,
      child: Text("LowerCase"),
    ),
    DropdownMenuItem(
      value: 1,
      child: Text("UpperCase"),
    ),
    DropdownMenuItem(
      value: 2,
      child: Text("RedColored"),
    ),
    DropdownMenuItem(
      value: 3,
      child: Text("BoldText"),
    ),
  ];

  var _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
 
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Text Shifter",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter your desired text here",
              style: TextStyle(fontSize: 16),
            ),
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: "input your text here",
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "now how you want it to apear?",
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton(
              items: _options,
              value: _value,
              onChanged: (dynamic value) {
          
                setState(() {
                  _value = value!;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showText;
                  setState(() {
                    _isPressed = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Show my text",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.08,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  
                  _isPressed ? _textController.text : "",
                  style: TextStyle(
                    color: _value == 2 ? Colors.red : Colors.black,
                    fontWeight: _value == 3 ? FontWeight.bold : FontWeight.w600,
                    fontSize: 16,
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
