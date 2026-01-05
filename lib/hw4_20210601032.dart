import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW4',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'HW4'),
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
  bool selectedValue = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  String result = "";
  FormElement selectedFormElement = FormElement.all;

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
            DropdownButton<FormElement>(
              value: selectedFormElement,
              items: FormElement.values.map((FormElement value){
                return DropdownMenuItem<FormElement>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
              onChanged: (FormElement? newValue){
                setState(() {
                  selectedFormElement = newValue!;
                });
              },
            ),
            switch(selectedFormElement){
              FormElement.text => TextFormField(
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
              FormElement.check => Checkbox(
                value: selectedValue,
                onChanged: (bool? newValue){
                  setState(() {
                    selectedValue = newValue!;
                  });
                }
              ),
              FormElement.drop => DropdownButton<bool>(
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
              FormElement.all => Column(
                children : [
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
                    value: selectedValue,
                    onChanged: (bool? newValue){
                      setState(() {
                        selectedValue = newValue!;
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
                ]
              ),
            },
            ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  setState(() {
                    result = "${_textController.text}\n"
                             "$selectedValue "
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

enum FormElement{
  all,
  text,
  check,
  drop
}
