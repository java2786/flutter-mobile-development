# Flutter Training - Part 3: Adding Tasks with Forms  
  
## Bharat Task Manager Application  
  
### What We Will Build in This Part  
  
In this part, you will:  
- Create a form screen to add new tasks  
- Accept user input through text fields  
- Add dropdown for priority selection  
- Validate user input  
- Save new tasks to the list  
- Navigate back with data  
- Learn about TextEditingController and Form widgets  
  
---  
  
## Step 1: Understanding Forms in Flutter  
  
Forms let users input data. For our task manager, we need:  
- Title (text input)  
- Description (text input)  
- Deadline (text input)  
- Priority (dropdown selection)  
  
When user fills the form and clicks "Save", the new task should appear in the task list.  
  
---  
  
## Step 2: Create Add Task Screen  
  
### Create New File  
  
1. Right-click on `lib` folder  
2. New → Dart File  
3. Name: `add_task_screen`  
4. Click OK  
  
### Write Add Task Screen Code  
  
In `add_task_screen.dart`:  
  
```dart  
import 'package:flutter/material.dart';  
import 'task_model.dart';  
  
class AddTaskScreen extends StatefulWidget {  
  @override  
  _AddTaskScreenState createState() => _AddTaskScreenState();  
}  
  
class _AddTaskScreenState extends State<AddTaskScreen> {  
  final _formKey = GlobalKey<FormState>();  
    
  TextEditingController titleController = TextEditingController();  
  TextEditingController descriptionController = TextEditingController();  
  TextEditingController deadlineController = TextEditingController();  
    
  TaskPriority selectedPriority = TaskPriority.medium;  
    
  @override  
  void dispose() {  
    titleController.dispose();  
    descriptionController.dispose();  
    deadlineController.dispose();  
    super.dispose();  
  }  
  
  void saveTask() {  
    if (_formKey.currentState!.validate()) {  
      Task newTask = Task(  
        title: titleController.text,  
        description: descriptionController.text,  
        deadline: deadlineController.text,  
        priority: selectedPriority,  
      );  
        
      Navigator.pop(context, newTask);  
    }  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text('Add New Task'),  
        backgroundColor: Colors.blue,  
        foregroundColor: Colors.white,  
      ),  
      body: SingleChildScrollView(  
        padding: EdgeInsets.all(16),  
        child: Form(  
          key: _formKey,  
          child: Column(  
            crossAxisAlignment: CrossAxisAlignment.start,  
            children: [  
              Text(  
                'Create a New Task',  
                style: TextStyle(  
                  fontSize: 24,  
                  fontWeight: FontWeight.bold,  
                  color: Colors.blue,  
                ),  
              ),  
              SizedBox(height: 8),  
              Text(  
                'Fill in the details below',  
                style: TextStyle(  
                  fontSize: 14,  
                  color: Colors.grey,  
                ),  
              ),  
              SizedBox(height: 30),  
                
              TextFormField(  
                controller: titleController,  
                decoration: InputDecoration(  
                  labelText: 'Task Title',  
                  hintText: 'E.g., Buy groceries',  
                  border: OutlineInputBorder(  
                    borderRadius: BorderRadius.circular(10),  
                  ),  
                  prefixIcon: Icon(Icons.title),  
                ),  
                validator: (value) {  
                  if (value == null || value.isEmpty) {  
                    return 'Please enter a title';  
                  }  
                  if (value.length < 3) {  
                    return 'Title must be at least 3 characters';  
                  }  
                  return null;  
                },  
              ),  
                
              SizedBox(height: 20),  
                
              TextFormField(  
                controller: descriptionController,  
                decoration: InputDecoration(  
                  labelText: 'Description',  
                  hintText: 'E.g., Rice, Dal, Vegetables from D-Mart',  
                  border: OutlineInputBorder(  
                    borderRadius: BorderRadius.circular(10),  
                  ),  
                  prefixIcon: Icon(Icons.description),  
                ),  
                maxLines: 3,  
                validator: (value) {  
                  if (value == null || value.isEmpty) {  
                    return 'Please enter a description';  
                  }  
                  return null;  
                },  
              ),  
                
              SizedBox(height: 20),  
                
              TextFormField(  
                controller: deadlineController,  
                decoration: InputDecoration(  
                  labelText: 'Deadline',  
                  hintText: 'E.g., Tomorrow, 5:00 PM',  
                  border: OutlineInputBorder(  
                    borderRadius: BorderRadius.circular(10),  
                  ),  
                  prefixIcon: Icon(Icons.calendar_today),  
                ),  
                validator: (value) {  
                  if (value == null || value.isEmpty) {  
                    return 'Please enter a deadline';  
                  }  
                  return null;  
                },  
              ),  
                
              SizedBox(height: 20),  
                
              Text(  
                'Priority Level',  
                style: TextStyle(  
                  fontSize: 16,  
                  fontWeight: FontWeight.w500,  
                  color: Colors.black87,  
                ),  
              ),  
                
              SizedBox(height: 10),  
                
              Container(  
                padding: EdgeInsets.symmetric(horizontal: 12),  
                decoration: BoxDecoration(  
                  border: Border.all(color: Colors.grey),  
                  borderRadius: BorderRadius.circular(10),  
                ),  
                child: DropdownButtonHideUnderline(  
                  child: DropdownButton<TaskPriority>(  
                    value: selectedPriority,  
                    isExpanded: true,  
                    icon: Icon(Icons.arrow_drop_down),  
                    items: [  
                      DropdownMenuItem(  
                        value: TaskPriority.high,  
                        child: Row(  
                          children: [  
                            Container(  
                              width: 12,  
                              height: 12,  
                              decoration: BoxDecoration(  
                                color: Colors.red,  
                                shape: BoxShape.circle,  
                              ),  
                            ),  
                            SizedBox(width: 10),  
                            Text('High Priority'),  
                          ],  
                        ),  
                      ),  
                      DropdownMenuItem(  
                        value: TaskPriority.medium,  
                        child: Row(  
                          children: [  
                            Container(  
                              width: 12,  
                              height: 12,  
                              decoration: BoxDecoration(  
                                color: Colors.orange,  
                                shape: BoxShape.circle,  
                              ),  
                            ),  
                            SizedBox(width: 10),  
                            Text('Medium Priority'),  
                          ],  
                        ),  
                      ),  
                      DropdownMenuItem(  
                        value: TaskPriority.low,  
                        child: Row(  
                          children: [  
                            Container(  
                              width: 12,  
                              height: 12,  
                              decoration: BoxDecoration(  
                                color: Colors.green,  
                                shape: BoxShape.circle,  
                              ),  
                            ),  
                            SizedBox(width: 10),  
                            Text('Low Priority'),  
                          ],  
                        ),  
                      ),  
                    ],  
                    onChanged: (TaskPriority? newValue) {  
                      setState(() {  
                        selectedPriority = newValue!;  
                      });  
                    },  
                  ),  
                ),  
              ),  
                
              SizedBox(height: 40),  
                
              Row(  
                children: [  
                  Expanded(  
                    child: OutlinedButton(  
                      onPressed: () {  
                        Navigator.pop(context);  
                      },  
                      style: OutlinedButton.styleFrom(  
                        padding: EdgeInsets.symmetric(vertical: 15),  
                        shape: RoundedRectangleBorder(  
                          borderRadius: BorderRadius.circular(10),  
                        ),  
                        side: BorderSide(color: Colors.grey),  
                      ),  
                      child: Text(  
                        'Cancel',  
                        style: TextStyle(  
                          fontSize: 16,  
                          color: Colors.grey,  
                        ),  
                      ),  
                    ),  
                  ),  
                  SizedBox(width: 16),  
                  Expanded(  
                    child: ElevatedButton(  
                      onPressed: saveTask,  
                      style: ElevatedButton.styleFrom(  
                        backgroundColor: Colors.blue,  
                        foregroundColor: Colors.white,  
                        padding: EdgeInsets.symmetric(vertical: 15),  
                        shape: RoundedRectangleBorder(  
                          borderRadius: BorderRadius.circular(10),  
                        ),  
                      ),  
                      child: Text(  
                        'Save Task',  
                        style: TextStyle(fontSize: 16),  
                      ),  
                    ),  
                  ),  
                ],  
              ),  
            ],  
          ),  
        ),  
      ),  
    );  
  }  
}  
```  
  
### Understanding the Code  
  
**TextEditingController:**  
```dart  
TextEditingController titleController = TextEditingController();  
```  
This controls what user types in a text field. It lets us read and set text.  
  
**Form and GlobalKey:**  
```dart  
final _formKey = GlobalKey<FormState>();  
  
Form(  
  key: _formKey,  
  child: Column(...),  
)  
```  
Form widget groups all input fields. The key helps us validate all fields at once.  
  
**TextFormField:**  
```dart  
TextFormField(  
  controller: titleController,  
  decoration: InputDecoration(  
    labelText: 'Task Title',  
    hintText: 'E.g., Buy groceries',  
    border: OutlineInputBorder(...),  
    prefixIcon: Icon(Icons.title),  
  ),  
  validator: (value) {  
    if (value == null || value.isEmpty) {  
      return 'Please enter a title';  
    }  
    return null;  
  },  
)  
```  
- `controller`: Connects to TextEditingController  
- `decoration`: How field looks  
- `labelText`: Label above field  
- `hintText`: Grey text inside empty field  
- `prefixIcon`: Icon on the left  
- `validator`: Checks if input is valid  
  
**Validation:**  
```dart  
validator: (value) {  
  if (value == null || value.isEmpty) {  
    return 'Please enter a title';  
  }  
  if (value.length < 3) {  
    return 'Title must be at least 3 characters';  
  }  
  return null;  
}  
```  
If validation fails, returns error message. If passes, returns `null`.  
  
**DropdownButton:**  
```dart  
DropdownButton<TaskPriority>(  
  value: selectedPriority,  
  items: [  
    DropdownMenuItem(  
      value: TaskPriority.high,  
      child: Row(...),  
    ),  
  ],  
  onChanged: (TaskPriority? newValue) {  
    setState(() {  
      selectedPriority = newValue!;  
    });  
  },  
)  
```  
Shows a dropdown menu. When user selects, `onChanged` is called. We use `setState` to update UI.  
  
**setState:**  
```dart  
setState(() {  
  selectedPriority = newValue!;  
});  
```  
Tells Flutter "data changed, rebuild UI". Without this, UI won't update.  
  
**Saving Task:**  
```dart  
void saveTask() {  
  if (_formKey.currentState!.validate()) {  
    Task newTask = Task(  
      title: titleController.text,  
      description: descriptionController.text,  
      deadline: deadlineController.text,  
      priority: selectedPriority,  
    );  
      
    Navigator.pop(context, newTask);  
  }  
}  
```  
- Validates all fields  
- Creates new Task object  
- Returns to previous screen with the task  
  
**Navigator.pop with data:**  
```dart  
Navigator.pop(context, newTask);  
```  
Goes back and sends `newTask` to previous screen.  
  
**dispose:**  
```dart  
@override  
void dispose() {  
  titleController.dispose();  
  descriptionController.dispose();  
  deadlineController.dispose();  
  super.dispose();  
}  
```  
Cleans up controllers when screen is removed. Prevents memory leaks.  
  
**SingleChildScrollView:**  
```dart  
SingleChildScrollView(  
  padding: EdgeInsets.all(16),  
  child: Form(...),  
)  
```  
Makes content scrollable. If keyboard appears, user can scroll to see all fields.  
  
---  
  
## Step 3: Connect Add Task Screen to Task List  
  
### Modify task_list_screen.dart  
  
Open `task_list_screen.dart` and find the FloatingActionButton. Replace:  
  
```dart  
floatingActionButton: FloatingActionButton(  
  onPressed: () {  
    // We'll add task creation later  
  },  
  child: Icon(Icons.add),  
  backgroundColor: Colors.blue,  
),  
```  
  
With:  
  
```dart  
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
    }  
  },  
  child: Icon(Icons.add),  
  backgroundColor: Colors.blue,  
),  
```  
  
Also, add this import at the top of `task_list_screen.dart`:  
  
```dart  
import 'add_task_screen.dart';  
```  
  
### Understanding the Changes  
  
**async and await:**  
```dart  
onPressed: () async {  
  final result = await Navigator.push(...);  
}  
```  
`async` means function can wait. `await` waits for navigation to finish and get result.  
  
**Getting Result:**  
```dart  
final result = await Navigator.push(  
  context,  
  MaterialPageRoute(  
    builder: (context) => AddTaskScreen(),  
  ),  
);  
```  
When user saves task, it comes back in `result`.  
  
**Adding Task to List:**  
```dart  
if (result != null) {  
  setState(() {  
    tasks.add(result);  
  });  
}  
```  
If user saved (not cancelled), add task to list and rebuild UI.  
  
---  
  
## Step 4: Run and Test  
  
### Test the Complete Flow  
  
1. Run the app  
2. Click "View My Tasks"  
3. You'll see the task list  
4. Click the + button (bottom-right)  
5. Add Task screen opens  
  
### Try Adding a Task  
  
Fill the form:  
- Title: "Visit Temple on Sunday"  
- Description: "Go to Siddhivinayak Temple with Ramesh and family"  
- Deadline: "This Sunday, 8:00 AM"  
- Priority: Select "High Priority"  
  
Click "Save Task"  
  
### What Should Happen  
  
- Form closes  
- Returns to task list  
- New task appears at the bottom  
- Has red background (high priority)  
- Shows all the details you entered  
  
### Try Form Validation  
  
Try submitting empty form:  
1. Click + button  
2. Don't fill anything  
3. Click "Save Task"  
4. You should see error messages under each field  
  
Try short title:  
1. Type just "Go"  
2. Click "Save Task"  
3. Should see "Title must be at least 3 characters"  
  
---  
  
## Step 5: Improving the Form  
  
### Add Example Tasks Section  
  
Modify `add_task_screen.dart` - add this after "Fill in the details below":  
  
```dart  
SizedBox(height: 20),  
Container(  
  padding: EdgeInsets.all(12),  
  decoration: BoxDecoration(  
    color: Colors.blue[50],  
    borderRadius: BorderRadius.circular(10),  
  ),  
  child: Column(  
    crossAxisAlignment: CrossAxisAlignment.start,  
    children: [  
      Row(  
        children: [  
          Icon(Icons.lightbulb_outline, color: Colors.blue, size: 20),  
          SizedBox(width: 8),  
          Text(  
            'Example Tasks:',  
            style: TextStyle(  
              fontWeight: FontWeight.bold,  
              color: Colors.blue,  
            ),  
          ),  
        ],  
      ),  
      SizedBox(height: 8),  
      Text(  
        '• Submit college assignment\n'  
        '• Book train tickets to Chennai\n'  
        '• Pay electricity bill online\n'  
        '• Call Mukesh about project',  
        style: TextStyle(fontSize: 12, color: Colors.black54),  
      ),  
    ],  
  ),  
),  
SizedBox(height: 30),  
```  
  
This gives users ideas for tasks.  
  
---  
  
## Step 6: Add Character Count to Description  
  
Show how many characters user has typed.  
  
### Modify Description Field  
  
Replace the description TextFormField with:  
  
```dart  
Column(  
  crossAxisAlignment: CrossAxisAlignment.start,  
  children: [  
    TextFormField(  
      controller: descriptionController,  
      decoration: InputDecoration(  
        labelText: 'Description',  
        hintText: 'E.g., Rice, Dal, Vegetables from D-Mart',  
        border: OutlineInputBorder(  
          borderRadius: BorderRadius.circular(10),  
        ),  
        prefixIcon: Icon(Icons.description),  
      ),  
      maxLines: 3,  
      maxLength: 200,  
      onChanged: (value) {  
        setState(() {});  
      },  
      validator: (value) {  
        if (value == null || value.isEmpty) {  
          return 'Please enter a description';  
        }  
        return null;  
      },  
    ),  
    SizedBox(height: 5),  
    Text(  
      '${descriptionController.text.length}/200 characters',  
      style: TextStyle(  
        fontSize: 12,  
        color: Colors.grey,  
      ),  
    ),  
  ],  
),  
```  
  
### What Changed  
  
**maxLength:**  
```dart  
maxLength: 200,  
```  
Limits description to 200 characters.  
  
**onChanged:**  
```dart  
onChanged: (value) {  
  setState(() {});  
},  
```  
Calls `setState` whenever text changes. This updates the character count.  
  
**Character Counter:**  
```dart  
Text(  
  '${descriptionController.text.length}/200 characters',  
  style: TextStyle(fontSize: 12, color: Colors.grey),  
),  
```  
Shows "X/200 characters" below field.  
  
---  
  
## Step 7: Add Quick Deadline Options  
  
Let users select common deadlines with buttons.  
  
### Add Below Priority Dropdown  
  
After the priority dropdown code, add:  
  
```dart  
SizedBox(height: 20),  
  
Text(  
  'Quick Deadline Options',  
  style: TextStyle(  
    fontSize: 16,  
    fontWeight: FontWeight.w500,  
    color: Colors.black87,  
  ),  
),  
  
SizedBox(height: 10),  
  
Wrap(  
  spacing: 10,  
  children: [  
    ChoiceChip(  
      label: Text('Today'),  
      selected: deadlineController.text == 'Today',  
      onSelected: (selected) {  
        if (selected) {  
          setState(() {  
            deadlineController.text = 'Today';  
          });  
        }  
      },  
    ),  
    ChoiceChip(  
      label: Text('Tomorrow'),  
      selected: deadlineController.text == 'Tomorrow',  
      onSelected: (selected) {  
        if (selected) {  
          setState(() {  
            deadlineController.text = 'Tomorrow';  
          });  
        }  
      },  
    ),  
    ChoiceChip(  
      label: Text('This Week'),  
      selected: deadlineController.text == 'This Week',  
      onSelected: (selected) {  
        if (selected) {  
          setState(() {  
            deadlineController.text = 'This Week';  
          });  
        }  
      },  
    ),  
    ChoiceChip(  
      label: Text('Next Week'),  
      selected: deadlineController.text == 'Next Week',  
      onSelected: (selected) {  
        if (selected) {  
          setState(() {  
            deadlineController.text = 'Next Week';  
          });  
        }  
      },  
    ),  
  ],  
),  
  
SizedBox(height: 20),  
```  
  
### Understanding ChoiceChip  
  
**ChoiceChip:**  
```dart  
ChoiceChip(  
  label: Text('Today'),  
  selected: deadlineController.text == 'Today',  
  onSelected: (selected) {  
    if (selected) {  
      setState(() {  
        deadlineController.text = 'Today';  
      });  
    }  
  },  
),  
```  
Creates a selectable chip (small rounded button). When clicked, sets deadline field.  
  
**Wrap Widget:**  
```dart  
Wrap(  
  spacing: 10,  
  children: [  
    // Chips  
  ],  
)  
```  
Arranges children horizontally, wrapping to next line if needed. `spacing: 10` adds gap between chips.  
  
---  
  
## Step 8: Test All Features  
  
### Test Adding Tasks  
  
Try adding these tasks:  
  
**Task 1:**  
- Title: "Pay LIC Premium"  
- Description: "Policy 123456789, Amount ₹5000, Before 5th of month"  
- Deadline: Click "This Week" chip  
- Priority: High  
  
**Task 2:**  
- Title: "Order Books from Flipkart"  
- Description: "Data Structures by Karumanchi, Operating Systems by Galvin"  
- Deadline: Click "Tomorrow" chip  
- Priority: Medium  
  
**Task 3:**  
- Title: "Call Dinesh"  
- Description: "Discuss college project presentation schedule"  
- Deadline: Type "Today, 7:00 PM"  
- Priority: Low  
  
### Verify  
  
After adding, check:  
- All three tasks appear in list  
- Each has correct color  
- Details match what you entered  
- Priority badges are correct  
  
---  
  
## Common Issues and Solutions  
  
### Issue 1: Validation Not Working  
  
**Solution:**  
Make sure Form has the key:  
```dart  
Form(  
  key: _formKey,  
  child: Column(...),  
)  
```  
  
And saveTask uses it:  
```dart  
if (_formKey.currentState!.validate()) {  
  // Save code  
}  
```  
  
### Issue 2: Dropdown Not Updating  
  
**Solution:**  
Make sure onChanged has setState:  
```dart  
onChanged: (TaskPriority? newValue) {  
  setState(() {  
    selectedPriority = newValue!;  
  });  
},  
```  
  
### Issue 3: New Task Not Appearing  
  
**Solution:**  
Check if FloatingActionButton has:  
```dart  
if (result != null) {  
  setState(() {  
    tasks.add(result);  
  });  
}  
```  
  
### Issue 4: Character Count Not Updating  
  
**Solution:**  
TextFormField must have:  
```dart  
onChanged: (value) {  
  setState(() {});  
},  
```  
  
---  
  
## Practice Tasks  
  
### Task 1: Add Maximum Title Length  
  
Limit title to 50 characters like we did for description.  
  
### Task 2: Add More Quick Deadline Options  
  
Add chips for:  
- "This Month"  
- "Next Month"  
- "Urgent"  
  
### Task 3: Change Form Colors  
  
Make the form use:  
- Green theme instead of blue  
- Different border colors  
- Different button colors  
  
### Task 4: Add Snackbar Confirmation  
  
When task is saved, show a message at bottom:  
"Task added successfully!"  
  
Hint: Use this code in saveTask:  
```dart  
ScaffoldMessenger.of(context).showSnackBar(  
  SnackBar(content: Text('Task added successfully!')),  
);  
```  
  
### Task 5: Add Clear All Button  
  
Add a button that clears all fields when clicked.  
  
Hint:  
```dart  
titleController.clear();  
descriptionController.clear();  
deadlineController.clear();  
setState(() {  
  selectedPriority = TaskPriority.medium;  
});  
```  
  
---  
  
## Quick Reference  
  
### Form Widgets  
  
| Widget | Purpose | Key Properties |  
|--------|---------|----------------|  
| `Form` | Groups input fields | `key` for validation |  
| `TextFormField` | Text input | `controller`, `validator`, `decoration` |  
| `DropdownButton` | Dropdown menu | `value`, `items`, `onChanged` |  
| `ChoiceChip` | Selectable chip | `label`, `selected`, `onSelected` |  
| `OutlinedButton` | Button with border | `onPressed`, `child`, `style` |  
  
### TextEditingController  
  
```dart  
// Create  
TextEditingController controller = TextEditingController();  
  
// Read value  
String text = controller.text;  
  
// Set value  
controller.text = "New value";  
  
// Clear  
controller.clear();  
  
// Must dispose  
controller.dispose();  
```  
  
### Validation  
  
```dart  
validator: (value) {  
  if (value == null || value.isEmpty) {  
    return 'Field is required';  
  }  
  if (value.length < 3) {  
    return 'Must be at least 3 characters';  
  }  
  // Add more checks  
  return null; // Means valid  
}  
```  
  
### setState  
  
```dart  
setState(() {  
  // Change variables here  
  selectedValue = newValue;  
});  
```  
Always use setState when changing variables that affect UI.  
  
---  
  
## What We Learned  
  
1. Creating forms with Form widget  
2. TextEditingController for managing input  
3. TextFormField for text input  
4. Input validation  
5. DropdownButton for selections  
6. ChoiceChip for quick options  
7. setState for updating UI  
8. async/await for waiting on navigation  
9. Passing data back with Navigator.pop  
10. SingleChildScrollView for scrollable content  
11. dispose method for cleanup  
12. Wrap widget for flexible layout  
13. Form decoration and styling  
14. Character counting  
15. OutlinedButton vs ElevatedButton  
  
---  
  
## Next Part Preview  
  
In Part 4, we will:  
- Save tasks permanently using local storage  
- Load saved tasks when app opens  
- Delete tasks from list  
- Mark tasks as completed  
- Learn about SharedPreferences  
- Understand JSON encoding/decoding  
  
Make sure your add task form works perfectly before moving to Part 4!  
  
---  
  
## Checklist Before Moving to Part 4  
  
- [ ] Add task form opens when + button clicked  
- [ ] All fields accept input  
- [ ] Validation shows error for empty fields  
- [ ] Validation checks minimum length  
- [ ] Dropdown shows three priority options  
- [ ] Quick deadline chips work  
- [ ] Character counter updates as you type  
- [ ] Save button creates new task  
- [ ] New task appears in task list  
- [ ] Cancel button goes back without saving  
- [ ] You added at least 3 custom tasks  
- [ ] You completed at least 2 practice tasks  
  
If all items are checked, you're ready for Part 4!  
  
---  
  
**Note:** Forms are the foundation of user interaction. Understanding controllers, validation, and state management here will help you build any app in the future. Take your time, experiment with different inputs, and make sure you're comfortable with all concepts.  
  
Save your project. We'll add data persistence in Part 4!