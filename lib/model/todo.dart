 class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> toDoList(){
    return [
      ToDo(
        id: '1',
        todoText: 'Learn Flutter',
        isDone: true,
      ),
      ToDo(
        id: '2',
        todoText: 'Learn Dart',
        isDone: false,
      ),
      ToDo(
        id: '3',
        todoText: 'Learn State Management',
        isDone: false,
      ),
      ToDo(
        id: '4',
        todoText: 'Learn API Integration',
        isDone: false,
      ),
      ToDo(
        id: '5',
        todoText: 'Learn Firebase',
        isDone: false,
      ),
    ];
  }
 }