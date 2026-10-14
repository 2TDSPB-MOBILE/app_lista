import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatelessWidget {
  

  const ConfiguracoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text("Voltar")),
          ],
        ),
      ),

    );
  }
}