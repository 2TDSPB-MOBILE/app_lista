import "package:app_lista/models/tarefa.dart";
import "package:flutter/material.dart";
import "package:app_lista/widgets/tarefa_list_item.dart";

List<Tarefa> listTarefas = [];

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
                          Tarefa newTarefa = Tarefa(
                            titulo: text,
                            dateTime: DateTime.now()
                          );
                          listTarefas.add(newTarefa);
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
                      for(Tarefa tarefa in listTarefas)
                        TarefaListItem(
                          tarefa: tarefa,
                          onDelete:onDelete
                        )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Você possui ${listTarefas.length} tarefas pendentes")
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
  void onDelete(Tarefa tarefa){
    setState(() {
      listTarefas.remove(tarefa);
    });
  }
}