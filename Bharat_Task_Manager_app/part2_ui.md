# Flutter Training - Part 2: Building Task List UI  
  
## Bharat Task Manager Application  
  
### What We Will Build in This Part  
  
In this part, you will:  
- Add navigation from welcome screen to task list  
- Create a task list screen  
- Display multiple tasks in a scrollable list  
- Design task cards with different colors  
- Learn about ListView and Card widgets  
- Add a floating action button  
  
---  
  
## Step 1: Understanding What We'll Build  
  
By the end of this part, your app will have:  
  
**Welcome Screen** (Already done in Part 1)  
↓  
**Task List Screen** (New - shows all tasks)  
  
The task list will display sample tasks like:  
- "Complete Flutter assignment - Deadline: Today"  
- "Buy groceries from D-Mart - Tomorrow"  
- "Book railway tickets to Chennai - 2 days"  
  
Each task will be in a card with colors indicating urgency.  
  
---  
  
## Step 2: Create Task Model  
  
Before displaying tasks, we need to define what a "task" is.  
  
### Create a New File  
  
1. In Android Studio, right-click on `lib` folder  
2. Select New → Dart File  
3. Name it: `task_model`  
4. Click OK  
  
### Write Task Model Code  
  
In `task_model.dart`, type:  
  
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
}  
  
enum TaskPriority {  
  high,  
  medium,  
  low,  
}  
```  
  
### Understanding the Code  
  
**Class Definition:**  
```dart  
class Task {  
  // Properties  
}  
```  
Think of a class as a blueprint. Just like a blueprint for a house defines rooms, this defines what makes a task.  
  
**Properties:**  
```dart  
String title;           // Task name  
String description;     // Details about task  
String deadline;        // When it's due  
bool isCompleted;       // Done or not (true/false)  
TaskPriority priority;  // How urgent  
```  
  
**Constructor:**  
```dart  
Task({  
  required this.title,  
  required this.description,  
  required this.deadline,  
  this.isCompleted = false,  
  required this.priority,  
});  
```  
This is how we create a new task. `required` means we must provide that value. `= false` means if we don't specify, it defaults to false.  
  
**Enum:**  
```dart  
enum TaskPriority {  
  high,  
  medium,  
  low,  
}  
```  
Enum is like a multiple-choice list. A task can only be high, medium, or low priority.  
  
---  
  
## Step 3: Create Sample Tasks  
  
### Create Another New File  
  
1. Right-click on `lib` folder  
2. New → Dart File  
3. Name: `sample_data`  
4. Click OK  
  
### Write Sample Data  
  
In `sample_data.dart`:  
  
```dart  
import 'task_model.dart';  
  
List<Task> getSampleTasks() {  
  return [  
    Task(  
      title: 'Complete Flutter Assignment',  
      description: 'Finish the mobile app development assignment given by professor',  
      deadline: 'Today, 6:00 PM',  
      priority: TaskPriority.high,  
    ),  
    Task(  
      title: 'Buy Groceries from D-Mart',  
      description: 'Rice, Dal, Vegetables, Milk, Bread',  
      deadline: 'Tomorrow',  
      priority: TaskPriority.medium,  
    ),  
    Task(  
      title: 'Book Railway Tickets',  
      description: 'Pune to Chennai, Sleeper Class, for Ramesh and Dinesh',  
      deadline: '2 days left',  
      priority: TaskPriority.high,  
    ),  
    Task(  
      title: 'Call Mukesh about Project',  
      description: 'Discuss the college project details and timeline',  
      deadline: 'Today, 8:00 PM',  
      priority: TaskPriority.medium,  
    ),  
    Task(  
      title: 'Submit LIC Premium',  
      description: 'Policy number: 123456789, Amount: ₹5000',  
      deadline: '3 days left',  
      priority: TaskPriority.low,  
    ),  
    Task(  
      title: 'Prepare for Exam',  
      description: 'Study chapters 5, 6, and 7 for Data Structures exam',  
      deadline: 'Tomorrow, 9:00 AM',  
      priority: TaskPriority.high,  
    ),  
    Task(  
      title: 'Order Flipkart Package',  
      description: 'Laptop charger and mouse for college work',  
      deadline: 'This week',  
      priority: TaskPriority.low,  
    ),  
  ];  
}  
```  
  
### Understanding the Code  
  
**Function:**  
```dart  
List<Task> getSampleTasks() {  
  return [  
    // List of tasks  
  ];  
}  
```  
This function returns a list of tasks. We can call this function whenever we need sample data.  
  
**Creating a Task:**  
```dart  
Task(  
  title: 'Complete Flutter Assignment',  
  description: 'Finish the mobile app development assignment given by professor',  
  deadline: 'Today, 6:00 PM',  
  priority: TaskPriority.high,  
)  
```  
Each task is created using the blueprint we defined earlier. Notice we don't set `isCompleted` - it defaults to `false`.  
  
---  
  
## Step 4: Create Task List Screen  
  
### Create New File  
  
1. Right-click on `lib` folder  
2. New → Dart File  
3. Name: `task_list_screen`  
4. Click OK  
  
### Write Task List Screen Code  
  
In `task_list_screen.dart`:  
  
```dart  
import 'package:flutter/material.dart';  
import 'task_model.dart';  
import 'sample_data.dart';  
  
class TaskListScreen extends StatefulWidget {  
  @override  
  _TaskListScreenState createState() => _TaskListScreenState();  
}  
  
class _TaskListScreenState extends State<TaskListScreen> {  
  List<Task> tasks = [];  
  
  @override  
  void initState() {  
    super.initState();  
    tasks = getSampleTasks();  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text('My Tasks'),  
        backgroundColor: Colors.blue,  
        foregroundColor: Colors.white,  
      ),  
      body: tasks.isEmpty  
          ? Center(  
              child: Text(  
                'No tasks yet!',  
                style: TextStyle(fontSize: 18, color: Colors.grey),  
              ),  
            )  
          : ListView.builder(  
              padding: EdgeInsets.all(16),  
              itemCount: tasks.length,  
              itemBuilder: (context, index) {  
                return TaskCard(task: tasks[index]);  
              },  
            ),  
      floatingActionButton: FloatingActionButton(  
        onPressed: () {  
          // We'll add task creation later  
        },  
        child: Icon(Icons.add),  
        backgroundColor: Colors.blue,  
      ),  
    );  
  }  
}  
  
class TaskCard extends StatelessWidget {  
  final Task task;  
  
  TaskCard({required this.task});  
  
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
      elevation: 3,  
      color: priorityColor,  
      child: Padding(  
        padding: EdgeInsets.all(16),  
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: [  
            Text(  
              task.title,  
              style: TextStyle(  
                fontSize: 18,  
                fontWeight: FontWeight.bold,  
                color: Colors.black87,  
              ),  
            ),  
            SizedBox(height: 8),  
            Text(  
              task.description,  
              style: TextStyle(  
                fontSize: 14,  
                color: Colors.black54,  
              ),  
            ),  
            SizedBox(height: 12),  
            Row(  
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
                Container(  
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),  
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
          ],  
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
  
### Understanding the New Concepts  
  
**StatefulWidget vs StatelessWidget:**  
  
Previously we used `StatelessWidget`. Now we use `StatefulWidget` because our screen has data that can change (the task list).  
  
```dart  
class TaskListScreen extends StatefulWidget {  
  @override  
  _TaskListScreenState createState() => _TaskListScreenState();  
}  
```  
  
**State Class:**  
```dart  
class _TaskListScreenState extends State<TaskListScreen> {  
  List<Task> tasks = [];  
    
  @override  
  void initState() {  
    super.initState();  
    tasks = getSampleTasks();  
  }  
}  
```  
  
`initState()` runs once when screen loads. Here we fill the task list with sample data.  
  
**AppBar:**  
```dart  
AppBar(  
  title: Text('My Tasks'),  
  backgroundColor: Colors.blue,  
  foregroundColor: Colors.white,  
)  
```  
The top bar of the screen showing title and back button.  
  
**ListView.builder:**  
```dart  
ListView.builder(  
  padding: EdgeInsets.all(16),  
  itemCount: tasks.length,  
  itemBuilder: (context, index) {  
    return TaskCard(task: tasks[index]);  
  },  
)  
```  
  
This creates a scrollable list. For each task, it builds a `TaskCard`.  
- `itemCount`: How many items  
- `itemBuilder`: How to build each item  
- `index`: Position in list (0, 1, 2, ...)  
  
**FloatingActionButton:**  
```dart  
floatingActionButton: FloatingActionButton(  
  onPressed: () {  
    // Action when pressed  
  },  
  child: Icon(Icons.add),  
  backgroundColor: Colors.blue,  
)  
```  
The round button at bottom-right corner.  
  
**Card Widget:**  
```dart  
Card(  
  margin: EdgeInsets.only(bottom: 16),  
  elevation: 3,  
  color: priorityColor,  
  child: Padding(  
    padding: EdgeInsets.all(16),  
    child: Column(  
      // Card contents  
    ),  
  ),  
)  
```  
Creates a material design card with shadow (`elevation`).  
  
**Row Widget:**  
```dart  
Row(  
  children: [  
    Icon(...),  
    Text(...),  
    Spacer(),  
    Container(...),  
  ],  
)  
```  
Arranges children horizontally. `Spacer()` pushes items apart.  
  
**Conditional Color:**  
```dart  
Color priorityColor;  
if (task.priority == TaskPriority.high) {  
  priorityColor = Colors.red[100]!;  
} else if (task.priority == TaskPriority.medium) {  
  priorityColor = Colors.orange[100]!;  
} else {  
  priorityColor = Colors.green[100]!;  
}  
```  
Different priority levels get different background colors.  
  
---  
  
## Step 5: Add Navigation from Welcome Screen  
  
Now we need to connect welcome screen to task list screen.  
  
### Modify main.dart  
  
Open `main.dart` and replace everything with:  
  
```dart  
import 'package:flutter/material.dart';  
import 'task_list_screen.dart';  
  
void main() {  
  runApp(MyApp());  
}  
  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      title: 'Bharat Task Manager',  
      theme: ThemeData(  
        primarySwatch: Colors.blue,  
      ),  
      home: WelcomeScreen(),  
    );  
  }  
}  
  
class WelcomeScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      backgroundColor: Colors.white,  
      body: Center(  
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [  
            Icon(  
              Icons.task_alt,  
              size: 100,  
              color: Colors.blue,  
            ),  
            SizedBox(height: 20),  
            Text(  
              'Welcome to',  
              style: TextStyle(  
                fontSize: 24,  
                color: Colors.grey,  
              ),  
            ),  
            SizedBox(height: 10),  
            Text(  
              'Bharat Task Manager',  
              style: TextStyle(  
                fontSize: 32,  
                fontWeight: FontWeight.bold,  
                color: Colors.blue,  
              ),  
            ),  
            SizedBox(height: 40),  
            Text(  
              'Created by: Suresh Kumar',  
              style: TextStyle(  
                fontSize: 18,  
                color: Colors.black87,  
              ),  
            ),  
            SizedBox(height: 10),  
            Text(  
              'Pune, Maharashtra',  
              style: TextStyle(  
                fontSize: 16,  
                color: Colors.grey,  
              ),  
            ),  
            SizedBox(height: 60),  
            ElevatedButton(  
              onPressed: () {  
                Navigator.push(  
                  context,  
                  MaterialPageRoute(  
                    builder: (context) => TaskListScreen(),  
                  ),  
                );  
              },  
              style: ElevatedButton.styleFrom(  
                backgroundColor: Colors.blue,  
                foregroundColor: Colors.white,  
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),  
                shape: RoundedRectangleBorder(  
                  borderRadius: BorderRadius.circular(30),  
                ),  
              ),  
              child: Text(  
                'View My Tasks',  
                style: TextStyle(fontSize: 18),  
              ),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}  
```  
  
### What Changed  
  
**Added Icon:**  
```dart  
Icon(  
  Icons.task_alt,  
  size: 100,  
  color: Colors.blue,  
),  
```  
Shows a task icon at the top.  
  
**Added Button:**  
```dart  
ElevatedButton(  
  onPressed: () {  
    Navigator.push(  
      context,  
      MaterialPageRoute(  
        builder: (context) => TaskListScreen(),  
      ),  
    );  
  },  
  child: Text('View My Tasks'),  
)  
```  
  
**Navigator.push:**  
This navigates to a new screen. Think of it like opening a new page.  
- `context`: Current location in app  
- `MaterialPageRoute`: Android-style page transition  
- `builder`: Creates the new screen (TaskListScreen)  
  
**Button Styling:**  
```dart  
style: ElevatedButton.styleFrom(  
  backgroundColor: Colors.blue,  
  foregroundColor: Colors.white,  
  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),  
  shape: RoundedRectangleBorder(  
    borderRadius: BorderRadius.circular(30),  
  ),  
),  
```  
Makes button blue with white text, rounded corners.  
  
---  
  
## Step 6: Run and Test the App  
  
### Run the Application  
  
1. Make sure emulator is running  
2. Click green Play button  
3. Wait for app to build and launch  
  
### What You Should See  
  
**Welcome Screen:**  
- Task icon at top  
- Welcome message  
- Your name and city  
- "View My Tasks" button  
  
**Click the Button:**  
- Screen slides to left  
- Task list appears  
- 7 sample tasks displayed  
- Each task has:  
  - Title in bold  
  - Description  
  - Deadline with clock icon  
  - Priority badge (HIGH/MEDIUM/LOW)  
  - Background color based on priority  
  
**Colors:**  
- High priority: Light red background, red badge  
- Medium priority: Light orange background, orange badge  
- Low priority: Light green background, green badge  
  
**Back Navigation:**  
- Press back button in app bar  
- Or use device back button  
- Returns to welcome screen  
  
---  
  
## Step 7: Understanding the Complete Flow  
  
### App Structure  
  
```  
main.dart  
  └── MyApp (MaterialApp)  
        └── WelcomeScreen  
              └── Button clicked → Navigates to  
                    └── TaskListScreen  
                          └── ListView  
                                └── TaskCard (for each task)  
```  
  
### Data Flow  
  
```  
sample_data.dart  
  └── getSampleTasks()  
        └── Returns List<Task>  
              └── Used by TaskListScreen  
                    └── Displayed in TaskCards  
```  
  
---  
  
## Step 8: Customizing Your Task List  
  
### Add Your Own Tasks  
  
Open `sample_data.dart` and add personal tasks:  
  
```dart  
Task(  
  title: 'Your Task Title',  
  description: 'Your task description here',  
  deadline: 'When it's due',  
  priority: TaskPriority.high, // or medium or low  
),  
```  
  
Example:  
  
```dart  
Task(  
  title: 'Visit Home in Diwali',  
  description: 'Book train tickets to hometown for Diwali celebration',  
  deadline: '5 days left',  
  priority: TaskPriority.high,  
),  
```  
  
### Change Priority Colors  
  
In `task_list_screen.dart`, find the `TaskCard` class and modify colors:  
  
```dart  
Color priorityColor;  
if (task.priority == TaskPriority.high) {  
  priorityColor = Colors.pink[100]!;  // Change to pink  
} else if (task.priority == TaskPriority.medium) {  
  priorityColor = Colors.yellow[100]!;  // Change to yellow  
} else {  
  priorityColor = Colors.blue[100]!;  // Change to blue  
}  
```  
  
### Change Badge Colors  
  
```dart  
Color _getPriorityColor() {  
  if (task.priority == TaskPriority.high) {  
    return Colors.pink;  // Change badge color  
  } else if (task.priority == TaskPriority.medium) {  
    return Colors.amber;  
  } else {  
    return Colors.indigo;  
  }  
}  
```  
  
---  
  
## Common Issues and Solutions  
  
### Issue 1: Import Error (Red Lines)  
  
If you see red lines under imports:  
  
**Solution:**  
1. Click Terminal at bottom  
2. Type: `flutter pub get`  
3. Press Enter  
4. Restart app  
  
### Issue 2: Tasks Not Showing  
  
**Solution:**  
1. Check `sample_data.dart` has tasks  
2. Check `initState()` calls `getSampleTasks()`  
3. Stop and restart app  
  
### Issue 3: Wrong Colors  
  
**Solution:**  
Make sure you're using:  
```dart  
Colors.red[100]!     // Light color for background  
Colors.red           // Dark color for badge  
```  
The `[100]` makes it lighter. Higher numbers (200, 300) make it darker.  
  
### Issue 4: Button Not Working  
  
**Solution:**  
Check `Navigator.push` is inside `onPressed`:  
```dart  
onPressed: () {  
  Navigator.push(...);  
},  
```  
  
---  
  
## Practice Tasks  
  
### Task 1: Add More Sample Tasks  
  
Add 3 more tasks with Indian context:  
- Something related to Indian festivals  
- Something related to college/education  
- Something related to family  
  
### Task 2: Change All Colors  
  
Modify the app to use:  
- Green theme instead of blue  
- Different priority colors  
- Different background color for welcome screen  
  
### Task 3: Add Task Count  
  
In AppBar title, show how many tasks you have:  
```dart  
title: Text('My Tasks (${tasks.length})'),  
```  
  
### Task 4: Add Icons to Cards  
  
Add an icon before the title in each card based on priority:  
- High: Warning icon  
- Medium: Info icon  
- Low: Check icon  
  
Hint: Use `Icon` widget before title text.  
  
### Task 5: Change Card Design  
  
Modify the card to:  
- Have rounded corners: `shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))`  
- More shadow: `elevation: 5`  
- Different padding  
  
---  
  
## Quick Reference  
  
### New Widgets Learned  
  
| Widget | Purpose | Key Properties |  
|--------|---------|----------------|  
| `AppBar` | Top bar with title | `title`, `backgroundColor` |  
| `ListView.builder` | Scrollable list | `itemCount`, `itemBuilder` |  
| `Card` | Material card | `elevation`, `color`, `margin` |  
| `Row` | Horizontal layout | `children`, `mainAxisAlignment` |  
| `Spacer` | Flexible space | Pushes items apart |  
| `FloatingActionButton` | Floating button | `onPressed`, `child` |  
| `ElevatedButton` | Raised button | `onPressed`, `child`, `style` |  
| `Icon` | Display icon | `Icons.name`, `size`, `color` |  
  
### Navigation  
  
```dart  
// Go to new screen  
Navigator.push(  
  context,  
  MaterialPageRoute(  
    builder: (context) => NewScreen(),  
  ),  
);  
  
// Go back  
Navigator.pop(context);  
```  
  
### Common Icons  
  
```dart  
Icons.add  
Icons.task_alt  
Icons.access_time  
Icons.check  
Icons.warning  
Icons.info  
Icons.home  
Icons.person  
Icons.settings  
Icons.delete  
```  
  
### EdgeInsets (Padding/Margin)  
  
```dart  
EdgeInsets.all(16)                          // All sides: 16  
EdgeInsets.symmetric(horizontal: 20)        // Left and right: 20  
EdgeInsets.symmetric(vertical: 10)          // Top and bottom: 10  
EdgeInsets.only(top: 10, left: 20)         // Specific sides  
```  
  
---  
  
## What We Learned  
  
1. Creating a data model (Task class)  
2. Using enums for fixed choices  
3. Creating sample data  
4. StatefulWidget and State  
5. ListView.builder for dynamic lists  
6. Card widget for material design  
7. Row widget for horizontal layout  
8. Navigation between screens  
9. AppBar for screen title  
10. FloatingActionButton  
11. ElevatedButton with custom styling  
12. Conditional rendering and colors  
13. Icons and their usage  
  
---  
  
## Next Part Preview  
  
In Part 3, we will:  
- Create a form to add new tasks  
- Accept user input for title, description, deadline  
- Add priority selection  
- Save the new task to the list  
- Learn about TextField and DropdownButton  
- Understand form validation  
  
Make sure your task list is working perfectly before moving to Part 3!  
  
---  
  
## Checklist Before Moving to Part 3  
  
- [ ] Welcome screen shows icon and button  
- [ ] Clicking button navigates to task list  
- [ ] Task list shows all 7 sample tasks  
- [ ] Each task card has correct colors  
- [ ] High priority tasks are red  
- [ ] Medium priority tasks are orange  
- [ ] Low priority tasks are green  
- [ ] Floating action button is visible  
- [ ] Back button works correctly  
- [ ] You added at least 2 custom tasks  
- [ ] You completed at least 3 practice tasks  
  
If all items are checked, you're ready for Part 3!  
  
---  
  
**Important:** Don't rush through this part. Play with the code. Change colors, add tasks, modify layouts. The more you experiment, the better you'll understand. Each concept we learn here will be used in the next parts.  
  
Save your project. We'll build on this in Part 3!