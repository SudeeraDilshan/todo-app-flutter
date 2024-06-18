import 'package:flutter/material.dart';
import 'package:flutter_application/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onToDoDeleted;
  const TodoItem({required this.todo,super.key,required this.onToDoChanged,required this.onToDoDeleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        onTap: () => {onToDoChanged(todo)},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),),
        tileColor: Colors.white,
        leading: Icon(todo.isDone? Icons.check_box:Icons.check_box_outline_blank,color: Color.fromARGB(255, 3, 99, 194),),
        title: Text(todo.todoText!,style: TextStyle(color: Colors.black,fontSize: 16,decoration: todo.isDone ?TextDecoration.lineThrough:TextDecoration.none),),
        trailing: Container(height: 35,width: 35,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),
        child: IconButton(onPressed: ()=>{onToDoDeleted(todo)}, icon: Icon(Icons.delete),iconSize: 18,color: Colors.white,),)
      )
    );
  }
}