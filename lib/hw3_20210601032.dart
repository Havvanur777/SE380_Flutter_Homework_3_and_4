import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW3',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'HW3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelected = false;
  String selectedValue = "No";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child : Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Text",
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Checkbox(
              value: isSelected,
              onChanged: (bool? newValue){
                setState(() {
                  isSelected = newValue!;
                });
              }
            ),
            DropdownButton(
              value : selectedValue,
              items: <String>["Yes", "No"].map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue){
                setState(() {
                  selectedValue = newValue!;
                });
              },
            ),
            ElevatedButton(
              onPressed: (){

              },
              style : ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text("Send")
            ),
          ],
        ),
      ),
    );
  }
}
