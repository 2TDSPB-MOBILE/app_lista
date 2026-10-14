import 'package:flutter/material.dart';
import 'package:app_lista/pages/configuracoes_page.dart';
import 'package:app_lista/pages/todo_list_page.dart';
import 'package:app_lista/pages/nova_tela.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variável que irá controlar qual aba está selecionada
  int currentIndex = 0;

  //Lista das nossas telas
  final List<Widget>pages = [TodoListPage(),ConfiguracoesPage(),NovaTela()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        backgroundColor: const Color.fromARGB(255, 168, 214, 115),
        animationDuration: Duration(milliseconds: 1000),
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
            label: "Tarefas",
            selectedIcon: Icon(Icons.list,color: Colors.red,),
            ),

          NavigationDestination(
            icon: Icon(Icons.settings), 
            label: "Configurações",
            selectedIcon:Icon(Icons.settings,color: Colors.red)
            ),
            NavigationDestination(
            icon: Icon(Icons.facebook),
            label: "Nova Tela",
            selectedIcon: Icon(Icons.facebook, color: Colors.red),
          ),
            
        ]),
    );
  }
}