import "package:flutter/material.dart";
import "package:app_lista/widgets/tarefa_list_item.dart";

List<String> listTarefas = [];

final TextEditingController tarefaController = TextEditingController();


class TodoListPage extends StatefulWidget {
  const TodoListPage ({super.key});  

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex:2,
                      child: TextField(   
                        controller: tarefaController,             
                        decoration: InputDecoration(
                          labelText: "Adicione uma nota",
                          hintText: "Ex: Práticar Flutter",
                          border:OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    ElevatedButton(
                      onPressed: (){
                        String text = tarefaController.text;
                        setState(() {
                          listTarefas.add(text);
                        });
                        tarefaController.clear();
                      }, 
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber
                      ),
                      )
                  ],
                ),
                SizedBox(height: 16,),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for(String tarefa in listTarefas)
                        TarefaListItem()
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Você possui 0 tarefas pendentes")
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffa1250d)
                      ),
                      onPressed: (){},
                      child: Text(
                        "Limpar Tudo",
                        style: TextStyle(color: Colors.white),
                      )
                      )
                  ],
                ),           
        
              ],
            ),          
          ),
        ),
      )
    );
  }
}