import 'package:flutter/material.dart';
import 'package:app_lista/pages/configuracoes_page.dart';
import 'package:app_lista/pages/todo_list_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variável que irá controlar qual aba está selecionada
  int currentIndex = 0;

  //Lista das nossas telas
  final List<Widget>pages = [TodoListPage(),ConfiguracoesPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        //Estamos informando qual index está selecionado
        selectedIndex: currentIndex,
        onDestinationSelected: (index){
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const[
          NavigationDestination(
            icon: Icon(Icons.list), 
            label: "Tarefas"),

          NavigationDestination(
            icon: Icon(Icons.settings), 
            label: "Configurações")
        ]),
    );
  }
}