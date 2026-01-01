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
  bool selectedValue = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Form(
        key : _formKey,
        child : Column(
          children: [
            TextFormField(
              controller : _textController,
              decoration: const InputDecoration(
                labelText: "Text",
                contentPadding: EdgeInsets.all(10),
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "You cannot leave this blank";
                }
                if(value.length<3){
                  return "Enter at least 3 letters";
                }
                return null;
              }
            ),
            Checkbox(
              value: isSelected,
              onChanged: (bool? newValue){
                setState(() {
                  isSelected = newValue!;
                });
              }
            ),
            DropdownButton<bool>(
              value : selectedValue,
              items: const[
                DropdownMenuItem<bool>(
                  value : true,
                  child: Text("Yes"),
                ),
                DropdownMenuItem<bool>(
                  value : false,
                  child: Text("No"),
                ),
              ],
              onChanged: (bool? newValue){
                setState(() {
                  selectedValue = newValue!;
                });
              },
            ),
            ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  setState(() {
                    result = "${_textController.text}\n"
                             "$isSelected "
                             "$selectedValue";
                  });
                }
              },
              style : ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text("Send")
            ),
            Text(
              result,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
