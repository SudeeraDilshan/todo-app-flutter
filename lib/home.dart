import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './model/todo.dart';
import './widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList=ToDo.toDoList();
  List<ToDo> _foundTodo = [];
  final textController = TextEditingController();

  @override
  void initState() {
    _foundTodo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 188, 246),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [_searchBox(),
              Expanded(
                child: ListView(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 27,bottom: 20),
                    child: Text("All ToDos",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                  ),
                  for(ToDo todo in _foundTodo.reversed)
                    TodoItem(todo: todo,onToDoChanged: _handleToDoChange,onToDoDeleted: _handleToDoDelete,),
               
                ],),
              )
            
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(margin: EdgeInsets.only(bottom: 20,right: 20,left: 20),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(0.0, 0.0),blurRadius: 10.0,spreadRadius: 1.0)],borderRadius: BorderRadius.circular(10)),
              child: TextField(decoration: InputDecoration(
                  hintText: "Add a new odo item",
                  border: InputBorder.none,
              ),
              controller: textController,),)),
              Container(margin: EdgeInsets.only(right: 20,bottom: 20),
              child: ElevatedButton(onPressed: (){addTodo(textController.text);}, child: Text("+",style: TextStyle(fontSize: 40),),
              style: ElevatedButton.styleFrom(minimumSize: Size(40,40),elevation: 10),),)
            ],),
          )
        ],
      )
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 117, 188, 246),
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Icon(Icons.menu,color: Colors.black,size: 30,),
      Container(height: 40,width: 40,child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset("name.jpg")
      ),)],),
    );
  }

Widget _searchBox(){
  return  Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
              child:  TextField(
                onChanged: (value) => {runFilter(value)},
                decoration:const InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search,color: Colors.grey,size: 20,),
                  border: InputBorder.none,
                  prefixIconConstraints: BoxConstraints(minWidth: 25,minHeight: 20),
                  hintStyle: TextStyle(color: Colors.grey),

                ),
              ),
           );
}

void _handleToDoChange(ToDo todo){
  setState(() {
    todo.isDone=!todo.isDone;
  });
}

void _handleToDoDelete(ToDo todo){
  setState(() {
    todoList.remove(todo);
  });
}

void addTodo(String todo){
  setState(() {
    todoList.add(ToDo(id: todoList.length.toString(),todoText: todo));
  });
  textController.clear();
}

void runFilter(String enteredKeyword){
  List<ToDo> results = [];
  if(enteredKeyword.isEmpty){
    results = todoList;
  }else{
    results = todoList.where((element) => element.todoText!.contains(enteredKeyword)).toList();
  }
  setState(() {
    _foundTodo = results;
  });
}
}