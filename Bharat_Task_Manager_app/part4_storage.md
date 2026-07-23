# Flutter Training - Part 4: Local Storage & Data Persistence  
  
## Bharat Task Manager Application  
  
### What We Will Build in This Part  
  
In this part, you will:  
- Save tasks permanently on device  
- Load tasks when app reopens  
- Delete tasks from list  
- Mark tasks as complete/incomplete  
- Learn about SharedPreferences  
- Understand JSON encoding and decoding  
- Add swipe-to-delete functionality  
  
---  
  
## Step 1: Understanding the Problem  
  
Right now, when you:  
- Add tasks → They appear in list  
- Close app → All tasks disappear  
- Reopen app → Only sample tasks show  
  
We need to save tasks on the device so they persist even after app closes.  
  
---  
  
## Step 2: Add SharedPreferences Package  
  
### Modify pubspec.yaml  
  
1. In Android Studio, find `pubspec.yaml` in root folder  
2. Double-click to open it  
3. Find the `dependencies:` section  
4. Add `shared_preferences` under `flutter:`  
  
```yaml  
dependencies:  
  flutter:  
    sdk: flutter  
  
  cupertino_icons: ^1.0.8  
  shared_preferences: ^2.2.2  
```  
  
5. Save the file (Ctrl+S or Cmd+S)  
  
### Get the Package  
  
1. Click Terminal at bottom  
2. Type: `flutter pub get`  
3. Press Enter  
4. Wait for download to complete  
  
You'll see: "Got dependencies!"  
  
---  
  
## Step 3: Make Task Model JSON-Compatible  
  
We need to convert Task objects to JSON (text format) to save them.  
  
### Why Are We Changing task_model.dart Again?  
  
In Part 2, we created `task_model.dart` with just the Task properties and constructor — that was enough to display tasks on screen. Now that we need to save tasks to device storage, we have a new requirement: we need to convert Task objects into text (JSON) and read them back. This means adding two new methods — `toJson()` and `fromJson()` — to the same file.  
  
This is completely normal in real development. As your app grows, models gain new capabilities. You are not fixing a mistake from Part 2 — you are evolving the same class to support a new feature. In a professional codebase, this would be a "git commit" called something like "feat: add JSON serialization to Task model".  
  
### Update task_model.dart  
  
Replace entire `task_model.dart` with:  
  
```dart  
class Task {  
  String title;  
  String description;  
  String deadline;  
  bool isCompleted;  
  TaskPriority priority;  
  
  Task({  
    required this.title,  
    required this.description,  
    required this.deadline,  
    this.isCompleted = false,  
    required this.priority,  
  });  
  
  Map<String, dynamic> toJson() {  
    return {  
      'title': title,  
      'description': description,  
      'deadline': deadline,  
      'isCompleted': isCompleted,  
      'priority': priority.toString(),  
    };  
  }  
  
  factory Task.fromJson(Map<String, dynamic> json) {  
    return Task(  
      title: json['title'],  
      description: json['description'],  
      deadline: json['deadline'],  
      isCompleted: json['isCompleted'],  
      priority: _priorityFromString(json['priority']),  
    );  
  }  
  
  static TaskPriority _priorityFromString(String priority) {  
    if (priority == 'TaskPriority.high') {  
      return TaskPriority.high;  
    } else if (priority == 'TaskPriority.medium') {  
      return TaskPriority.medium;  
    } else {  
      return TaskPriority.low;  
    }  
  }  
}  
  
enum TaskPriority {  
  high,  
  medium,  
  low,  
}  
```  
  
### Understanding JSON Conversion  
  
**toJson Method:**  
```dart  
Map<String, dynamic> toJson() {  
  return {  
    'title': title,  
    'description': description,  
    'deadline': deadline,  
    'isCompleted': isCompleted,  
    'priority': priority.toString(),  
  };  
}  
```  
  
Converts Task object to a Map (like a dictionary). This can be saved as text.  
  
Example:  
```dart  
Task(title: "Buy milk", deadline: "Today", ...)  
```  
Becomes:  
```json  
{  
  "title": "Buy milk",  
  "deadline": "Today",  
  "isCompleted": false,  
  "priority": "TaskPriority.high"  
}  
```  
  
**fromJson Factory:**  
```dart  
factory Task.fromJson(Map<String, dynamic> json) {  
  return Task(  
    title: json['title'],  
    description: json['description'],  
    deadline: json['deadline'],  
    isCompleted: json['isCompleted'],  
    priority: _priorityFromString(json['priority']),  
  );  
}  
```  
  
Creates Task object from JSON. Reverses the toJson process.  
  
**Priority Conversion:**  
```dart  
static TaskPriority _priorityFromString(String priority) {  
  if (priority == 'TaskPriority.high') {  
    return TaskPriority.high;  
  } else if (priority == 'TaskPriority.medium') {  
    return TaskPriority.medium;  
  } else {  
    return TaskPriority.low;  
  }  
}  
```  
  
Converts priority string back to enum.  
  
---  
  
## Step 4: Create Task Storage Service  
  
### Create New File  
  
1. Right-click on `lib` folder  
2. New → Dart File  
3. Name: `task_storage`  
4. Click OK  
  
### Write Storage Code  
  
In `task_storage.dart`:  
  
```dart  
import 'dart:convert';  
import 'package:shared_preferences/shared_preferences.dart';  
import 'task_model.dart';  
  
class TaskStorage {  
  static const String TASKS_KEY = 'tasks_list';  
  
  static Future<void> saveTasks(List<Task> tasks) async {  
    final prefs = await SharedPreferences.getInstance();  
      
    List<String> tasksJson = tasks.map((task) {  
      return jsonEncode(task.toJson());  
    }).toList();  
      
    await prefs.setStringList(TASKS_KEY, tasksJson);  
  }  
  
  static Future<List<Task>> loadTasks() async {  
    final prefs = await SharedPreferences.getInstance();  
      
    List<String>? tasksJson = prefs.getStringList(TASKS_KEY);  
      
    if (tasksJson == null) {  
      return [];  
    }  
      
    List<Task> tasks = tasksJson.map((taskString) {  
      Map<String, dynamic> taskMap = jsonDecode(taskString);  
      return Task.fromJson(taskMap);  
    }).toList();  
      
    return tasks;  
  }  
  
  static Future<void> clearAllTasks() async {  
    final prefs = await SharedPreferences.getInstance();  
    await prefs.remove(TASKS_KEY);  
  }  
}  
```  
  
### Understanding Storage Code  
  
**SharedPreferences:**  
```dart  
final prefs = await SharedPreferences.getInstance();  
```  
Gets access to device storage. Like opening a file cabinet.  
  
**Saving Tasks:**  
```dart  
static Future<void> saveTasks(List<Task> tasks) async {  
  // 1. Get SharedPreferences  
  final prefs = await SharedPreferences.getInstance();  
    
  // 2. Convert each task to JSON string  
  List<String> tasksJson = tasks.map((task) {  
    return jsonEncode(task.toJson());  
  }).toList();  
    
  // 3. Save to device  
  await prefs.setStringList(TASKS_KEY, tasksJson);  
}  
```  
  
Process:  
1. Task object → toJson() → Map  
2. Map → jsonEncode() → String  
3. String → save to device  
  
**Loading Tasks:**  
```dart  
static Future<List<Task>> loadTasks() async {  
  // 1. Get SharedPreferences  
  final prefs = await SharedPreferences.getInstance();  
    
  // 2. Load strings from device  
  List<String>? tasksJson = prefs.getStringList(TASKS_KEY);  
    
  // 3. If nothing saved, return empty list  
  if (tasksJson == null) {  
    return [];  
  }  
    
  // 4. Convert each string back to Task  
  List<Task> tasks = tasksJson.map((taskString) {  
    Map<String, dynamic> taskMap = jsonDecode(taskString);  
    return Task.fromJson(taskMap);  
  }).toList();  
    
  return tasks;  
}  
```  
  
Process (reverse of saving):  
1. Load strings from device  
2. String → jsonDecode() → Map  
3. Map → fromJson() → Task object  
  
**Future and async:**  
```dart  
Future<void> saveTasks(...) async {  
  await prefs.setStringList(...);  
}  
```  
Operations that take time (reading/writing storage) use Future. `async` allows using `await`.  
  
---  

## Why SharedPreferences and Not a Database?  
  
Students who have heard about SQLite or Firebase might wonder: why are we using SharedPreferences instead?  
  
Here is the honest answer:  
  
SharedPreferences stores data as simple key-value pairs — think of it as a small personal notepad. It works well when you need to save a list of items where the total number is small (under a few hundred), you do not need to search or filter from the device side, and all items are loaded at once when the app opens.  
  
SQLite is a proper database that stores data in structured tables with rows and columns. It is better when you have hundreds or thousands of records, need to search or filter without loading everything, or need to relate multiple types of data together (for example, tasks linked to projects linked to users).  
  
For Bharat Task Manager, SharedPreferences is the correct choice. A student's task list will typically have fewer than 50 tasks, we load the entire list at startup anyway, and there is only one type of data. Using SQLite here would be like using a filing cabinet to store three sticky notes.  
  
When you build apps with large datasets — an inventory of 10,000 products, a hospital's patient records, a library catalogue — that is when SQLite (via the `sqflite` package in Flutter) becomes the right tool.  
  
---  
  
## Step 5: Update Task List Screen to Use Storage  
  
### Modify task_list_screen.dart  
  
Add this import at the top:  
```dart  
import 'task_storage.dart';  
import 'dart:convert';  
```  
  
Replace the `_TaskListScreenState` class with:  
  
```dart  
class _TaskListScreenState extends State<TaskListScreen> {  
  List<Task> tasks = [];  
  bool isLoading = true;  
  
  @override  
  void initState() {  
    super.initState();  
    loadTasksFromStorage();  
  }  
  
  Future<void> loadTasksFromStorage() async {  
    List<Task> loadedTasks = await TaskStorage.loadTasks();  
      
    if (loadedTasks.isEmpty) {  
      loadedTasks = getSampleTasks();  
      await TaskStorage.saveTasks(loadedTasks);  
    }  
      
    setState(() {  
      tasks = loadedTasks;  
      isLoading = false;  
    });  
  }  
  
  Future<void> saveTasksToStorage() async {  
    await TaskStorage.saveTasks(tasks);  
  }  
  
  void deleteTask(int index) {  
    setState(() {  
      tasks.removeAt(index);  
    });  
    saveTasksToStorage();  
  }  
  
  void toggleTaskCompletion(int index) {  
    setState(() {  
      tasks[index].isCompleted = !tasks[index].isCompleted;  
    });  
    saveTasksToStorage();  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text('My Tasks (${tasks.length})'),  
        backgroundColor: Colors.blue,  
        foregroundColor: Colors.white,  
        actions: [  
          IconButton(  
            icon: Icon(Icons.delete_sweep),  
            onPressed: () {  
              showDialog(  
                context: context,  
                builder: (BuildContext context) {  
                  return AlertDialog(  
                    title: Text('Clear All Tasks'),  
                    content: Text('Are you sure you want to delete all tasks?'),  
                    actions: [  
                      TextButton(  
                        onPressed: () {  
                          Navigator.pop(context);  
                        },  
                        child: Text('Cancel'),  
                      ),  
                      TextButton(  
                        onPressed: () {  
                          setState(() {  
                            tasks.clear();  
                          });  
                          TaskStorage.clearAllTasks();  
                          Navigator.pop(context);  
                        },  
                        child: Text(  
                          'Delete All',  
                          style: TextStyle(color: Colors.red),  
                        ),  
                      ),  
                    ],  
                  );  
                },  
              );  
            },  
          ),  
        ],  
      ),  
      body: isLoading  
          ? Center(  
              child: CircularProgressIndicator(),  
            )  
          : tasks.isEmpty  
              ? Center(  
                  child: Column(  
                    mainAxisAlignment: MainAxisAlignment.center,  
                    children: [  
                      Icon(  
                        Icons.task_alt,  
                        size: 80,  
                        color: Colors.grey[300],  
                      ),  
                      SizedBox(height: 16),  
                      Text(  
                        'No tasks yet!',  
                        style: TextStyle(  
                          fontSize: 18,  
                          color: Colors.grey,  
                        ),  
                      ),  
                      SizedBox(height: 8),  
                      Text(  
                        'Tap + to add your first task',  
                        style: TextStyle(  
                          fontSize: 14,  
                          color: Colors.grey,  
                        ),  
                      ),  
                    ],  
                  ),  
                )  
              : ListView.builder(  
                  padding: EdgeInsets.all(16),  
                  itemCount: tasks.length,  
                  itemBuilder: (context, index) {  
                    return Dismissible(  
                      key: Key(tasks[index].title + index.toString()),  
                      direction: DismissDirection.endToStart,  
                      background: Container(  
                        alignment: Alignment.centerRight,  
                        padding: EdgeInsets.only(right: 20),  
                        color: Colors.red,  
                        child: Icon(  
                          Icons.delete,  
                          color: Colors.white,  
                          size: 30,  
                        ),  
                      ),  
                      onDismissed: (direction) {  
                        String taskTitle = tasks[index].title;  
                        deleteTask(index);  
                          
                        ScaffoldMessenger.of(context).showSnackBar(  
                          SnackBar(  
                            content: Text('$taskTitle deleted'),  
                            duration: Duration(seconds: 2),  
                          ),  
                        );  
                      },  
                      child: TaskCard(  
                        task: tasks[index],  
                        onTap: () {  
                          toggleTaskCompletion(index);  
                        },  
                      ),  
                    );  
                  },  
                ),  
      floatingActionButton: FloatingActionButton(  
        onPressed: () async {  
          final result = await Navigator.push(  
            context,  
            MaterialPageRoute(  
              builder: (context) => AddTaskScreen(),  
            ),  
          );  
  
          if (result != null) {  
            setState(() {  
              tasks.add(result);  
            });  
            saveTasksToStorage();  
              
            ScaffoldMessenger.of(context).showSnackBar(  
              SnackBar(  
                content: Text('Task added successfully!'),  
                duration: Duration(seconds: 2),  
                backgroundColor: Colors.green,  
              ),  
            );  
          }  
        },  
        child: Icon(Icons.add),  
        backgroundColor: Colors.blue,  
      ),  
    );  
  }  
}  
```  
  
### Understanding the Changes  
  
**Loading State:**  
```dart  
bool isLoading = true;  
  
if (isLoading) {  
  return Center(child: CircularProgressIndicator());  
}  
```  
Shows loading spinner while fetching tasks from storage.  
  
**Load on Start:**  
```dart  
Future<void> loadTasksFromStorage() async {  
  List<Task> loadedTasks = await TaskStorage.loadTasks();  
    
  if (loadedTasks.isEmpty) {  
    loadedTasks = getSampleTasks();  
    await TaskStorage.saveTasks(loadedTasks);  
  }  
    
  setState(() {  
    tasks = loadedTasks;  
    isLoading = false;  
  });  
}  
```  
When screen opens, load saved tasks. If none exist, load sample tasks.  
  
**Save After Changes:**  
```dart  
Future<void> saveTasksToStorage() async {  
  await TaskStorage.saveTasks(tasks);  
}  
```  
Saves tasks whenever list changes.  
  
**Delete Task:**  
```dart  
void deleteTask(int index) {  
  setState(() {  
    tasks.removeAt(index);  
  });  
  saveTasksToStorage();  
}  
```  
Removes task from list and saves.  
  
**Dismissible Widget:**  
```dart  
Dismissible(  
  key: Key(tasks[index].title + index.toString()),  
  direction: DismissDirection.endToStart,  
  background: Container(  
    alignment: Alignment.centerRight,  
    padding: EdgeInsets.only(right: 20),  
    color: Colors.red,  
    child: Icon(Icons.delete, color: Colors.white),  
  ),  
  onDismissed: (direction) {  
    deleteTask(index);  
  },  
  child: TaskCard(...),  
)  
```  
Allows swipe-to-delete. Swipe left to reveal red background, then task deletes.  
  
**AlertDialog:**  
```dart  
AlertDialog(  
  title: Text('Clear All Tasks'),  
  content: Text('Are you sure?'),  
  actions: [  
    TextButton(onPressed: () {}, child: Text('Cancel')),  
    TextButton(onPressed: () {}, child: Text('Delete All')),  
  ],  
)  
```  
Confirmation popup before clearing all tasks.  
  
**SnackBar:**  
```dart  
ScaffoldMessenger.of(context).showSnackBar(  
  SnackBar(  
    content: Text('Task deleted'),  
    duration: Duration(seconds: 2),  
  ),  
);  
```  
Shows temporary message at bottom of screen.  
  
---  
  
## Step 6: Update Task Card for Completion Toggle  
  
### Modify TaskCard Class  
  
In `task_list_screen.dart`, update the `TaskCard` class:  
  
```dart  
class TaskCard extends StatelessWidget {  
  final Task task;  
  final VoidCallback onTap;  
  
  TaskCard({  
    required this.task,  
    required this.onTap,  
  });  
  
  @override  
  Widget build(BuildContext context) {  
    Color priorityColor;  
    if (task.priority == TaskPriority.high) {  
      priorityColor = Colors.red[100]!;  
    } else if (task.priority == TaskPriority.medium) {  
      priorityColor = Colors.orange[100]!;  
    } else {  
      priorityColor = Colors.green[100]!;  
    }  
  
    return Card(  
      margin: EdgeInsets.only(bottom: 16),  
      elevation: task.isCompleted ? 1 : 3,  
      color: task.isCompleted ? Colors.grey[200] : priorityColor,  
      child: InkWell(  
        onTap: onTap,  
        borderRadius: BorderRadius.circular(12),  
        child: Padding(  
          padding: EdgeInsets.all(16),  
          child: Column(  
            crossAxisAlignment: CrossAxisAlignment.start,  
            children: [  
              Row(  
                children: [  
                  Icon(  
                    task.isCompleted  
                        ? Icons.check_circle  
                        : Icons.radio_button_unchecked,  
                    color: task.isCompleted ? Colors.green : Colors.grey,  
                  ),  
                  SizedBox(width: 12),  
                  Expanded(  
                    child: Text(  
                      task.title,  
                      style: TextStyle(  
                        fontSize: 18,  
                        fontWeight: FontWeight.bold,  
                        color: task.isCompleted  
                            ? Colors.grey  
                            : Colors.black87,  
                        decoration: task.isCompleted  
                            ? TextDecoration.lineThrough  
                            : TextDecoration.none,  
                      ),  
                    ),  
                  ),  
                ],  
              ),  
              SizedBox(height: 8),  
              Padding(  
                padding: EdgeInsets.only(left: 36),  
                child: Text(  
                  task.description,  
                  style: TextStyle(  
                    fontSize: 14,  
                    color: task.isCompleted ? Colors.grey : Colors.black54,  
                    decoration: task.isCompleted  
                        ? TextDecoration.lineThrough  
                        : TextDecoration.none,  
                  ),  
                ),  
              ),  
              SizedBox(height: 12),  
              Padding(  
                padding: EdgeInsets.only(left: 36),  
                child: Row(  
                  children: [  
                    Icon(  
                      Icons.access_time,  
                      size: 16,  
                      color: Colors.black45,  
                    ),  
                    SizedBox(width: 4),  
                    Text(  
                      task.deadline,  
                      style: TextStyle(  
                        fontSize: 12,  
                        color: Colors.black45,  
                      ),  
                    ),  
                    Spacer(),  
                    if (!task.isCompleted)  
                      Container(  
                        padding:  
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),  
                        decoration: BoxDecoration(  
                          color: _getPriorityColor(),  
                          borderRadius: BorderRadius.circular(12),  
                        ),  
                        child: Text(  
                          _getPriorityText(),  
                          style: TextStyle(  
                            fontSize: 12,  
                            color: Colors.white,  
                            fontWeight: FontWeight.bold,  
                          ),  
                        ),  
                      ),  
                  ],  
                ),  
              ),  
            ],  
          ),  
        ),  
      ),  
    );  
  }  
  
  Color _getPriorityColor() {  
    if (task.priority == TaskPriority.high) {  
      return Colors.red;  
    } else if (task.priority == TaskPriority.medium) {  
      return Colors.orange;  
    } else {  
      return Colors.green;  
    }  
  }  
  
  String _getPriorityText() {  
    if (task.priority == TaskPriority.high) {  
      return 'HIGH';  
    } else if (task.priority == TaskPriority.medium) {  
      return 'MEDIUM';  
    } else {  
      return 'LOW';  
    }  
  }  
}  
```  
  
### Understanding Completion Visuals  
  
**Completion Icon:**  
```dart  
Icon(  
  task.isCompleted  
      ? Icons.check_circle  
      : Icons.radio_button_unchecked,  
  color: task.isCompleted ? Colors.green : Colors.grey,  
)  
```  
Shows checked circle if completed, empty circle if not.  
  
**Strikethrough Text:**  
```dart  
Text(  
  task.title,  
  style: TextStyle(  
    decoration: task.isCompleted  
        ? TextDecoration.lineThrough  
        : TextDecoration.none,  
  ),  
)  
```  
Crosses out completed task text.  
  
**Grey Background:**  
```dart  
color: task.isCompleted ? Colors.grey[200] : priorityColor,  
```  
Completed tasks get grey background instead of priority color.  
  
**InkWell:**  
```dart  
InkWell(  
  onTap: onTap,  
  child: Padding(...),  
)  
```  
Makes entire card tappable with ripple effect.  
  
---  
  
## Step 7: Test Storage and Features  
  
### Test Data Persistence  
  
1. Run the app  
2. Add 2-3 new tasks  
3. Close the app completely (swipe away from recent apps)  
4. Reopen the app  
5. Your tasks should still be there!  
  
### Test Task Completion  
  
1. Tap on any task  
2. It should:  
   - Show check icon  
   - Get strikethrough text  
   - Turn grey  
   - Remove priority badge  
3. Tap again to mark incomplete  
  
### Test Swipe Delete  
  
1. Swipe any task from right to left  
2. Red delete background appears  
3. Task gets deleted  
4. Snackbar shows "Task deleted"  
  
### Test Clear All  
  
1. Tap trash icon in app bar (top-right)  
2. Confirmation dialog appears  
3. Click "Delete All"  
4. All tasks removed  
  
---  
  
## Step 8: Add Statistics  
  
Let's show completed vs pending tasks.  
  
### Add to AppBar  
  
In `task_list_screen.dart`, modify the AppBar title:  
  
```dart  
AppBar(  
  title: Column(  
    crossAxisAlignment: CrossAxisAlignment.start,  
    children: [  
      Text(  
        'My Tasks',  
        style: TextStyle(fontSize: 20),  
      ),  
      Text(  
        '${tasks.where((t) => !t.isCompleted).length} pending, '  
        '${tasks.where((t) => t.isCompleted).length} completed',  
        style: TextStyle(fontSize: 12),  
      ),  
    ],  
  ),  
  backgroundColor: Colors.blue,  
  foregroundColor: Colors.white,  
  // rest of code  
)  
```  
  
### Understanding the Code  
  
**where() Method:**  
```dart  
tasks.where((t) => !t.isCompleted).length  
```  
Filters tasks where `isCompleted` is false, then counts them.  
  
```dart  
tasks.where((t) => t.isCompleted).length  
```  
Filters tasks where `isCompleted` is true, then counts them.  
  
---  
  
## Common Issues and Solutions  
  
### Issue 1: Tasks Not Saving  
  
**Solution:**  
Make sure you call `saveTasksToStorage()` after:  
- Adding task  
- Deleting task  
- Toggling completion  
  
### Issue 2: SharedPreferences Error  
  
**Solution:**  
1. Check `pubspec.yaml` has correct package  
2. Run `flutter pub get`  
3. Restart app  
  
### Issue 3: JSON Decode Error  
  
**Solution:**  
Make sure:  
- `toJson()` includes all properties  
- `fromJson()` reads all properties  
- Property names match exactly  
  
### Issue 4: Swipe Not Working  
  
**Solution:**  
Each Dismissible needs unique key:  
```dart  
key: Key(tasks[index].title + index.toString()),  
```  
  
---  
  
## Practice Tasks  
  
### Task 1: Add Edit Functionality  
  
Allow users to edit existing tasks:  
- Long press on task card  
- Opens AddTaskScreen with pre-filled data  
- Save updates the task  
  
### Task 2: Sort Tasks by Priority  
  
Add a sort button that arranges tasks:  
- High priority first  
- Then medium  
- Then low  
  
Hint:  
```dart  
tasks.sort((a, b) {  
  return a.priority.index.compareTo(b.priority.index);  
});  
```  
  
### Task 3: Add Task Creation Date  
  
Modify Task model to include creation date:  
```dart  
String createdAt;  
```  
Display it on the card.  
  
### Task 4: Filter Completed Tasks  
  
Add a button to show/hide completed tasks.  
  
Hint: Use a boolean variable `showCompleted` and filter list.  
  
### Task 5: Add Task Counter Per Priority  
  
Show count of tasks for each priority level.  
  
---  
  
## Quick Reference  
  
### SharedPreferences Operations  
  
```dart  
// Get instance  
final prefs = await SharedPreferences.getInstance();  
  
// Save string  
await prefs.setString('key', 'value');  
  
// Save string list  
await prefs.setStringList('key', ['val1', 'val2']);  
  
// Read string  
String? value = prefs.getString('key');  
  
// Read string list  
List<String>? list = prefs.getStringList('key');  
  
// Remove key  
await prefs.remove('key');  
  
// Clear all  
await prefs.clear();  
```  
  
### JSON Operations  
  
```dart  
// Object to JSON string  
String json = jsonEncode(object.toJson());  
  
// JSON string to Object  
Map<String, dynamic> map = jsonDecode(jsonString);  
Object obj = Object.fromJson(map);  
```  
  
### List Operations  
  
```dart  
// Add item  
list.add(item);  
  
// Remove at index  
list.removeAt(index);  
  
// Clear all  
list.clear();  
  
// Filter  
List<Task> completed = tasks.where((t) => t.isCompleted).toList();  
  
// Map  
List<String> titles = tasks.map((t) => t.title).toList();  
  
// Sort  
list.sort((a, b) => a.compareTo(b));  
```  
  
---  
  
## What We Learned  
  
1. Adding packages to pubspec.yaml  
2. SharedPreferences for local storage  
3. Converting objects to JSON  
4. Converting JSON back to objects  
5. Saving and loading data from storage  
6. Dismissible widget for swipe-to-delete  
7. AlertDialog for confirmations  
8. SnackBar for notifications  
9. InkWell for tap effects  
10. Conditional styling (completed tasks)  
11. List filtering with where()  
12. CircularProgressIndicator for loading  
13. Future and async operations  
14. Data persistence across app restarts  
  
---  
  
## Next Part Preview  
  
In Part 5, we will:  
- Enhance UI with custom colors and themes  
- Add animations  
- Improve visual design  
- Add app icons  
- Configure app name and theme  
- Make the app more polished and professional  
  
Keep your project working perfectly before moving to Part 5!  
  
---  
  
## Checklist Before Moving to Part 5  
  
- [ ] Tasks save when added  
- [ ] Tasks persist after closing app  
- [ ] Can mark tasks as complete/incomplete  
- [ ] Completed tasks show different styling  
- [ ] Swipe-to-delete works  
- [ ] Delete confirmation shows snackbar  
- [ ] Clear all button works  
- [ ] Statistics show in app bar  
- [ ] Loading indicator appears on app start  
- [ ] Empty state shows when no tasks  
- [ ] You completed at least 2 practice tasks  
  
If all items are checked, you're ready for Part 5!  
  
---  
  
**Important:** Data persistence is critical for any real app. Understanding how to save and load data will help you in every future project. Experiment with SharedPreferences - try saving other data types, create different storage keys, build your own storage service.  
  
Save your project. We'll make it beautiful in Part 5!