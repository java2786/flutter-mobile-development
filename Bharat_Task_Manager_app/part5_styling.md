# Flutter Training - Part 5: Styling, Themes & Polish  
  
## Bharat Task Manager Application  
  
### What We Will Build in This Part  
  
In this part, you will:  
- Create a custom color theme  
- Add smooth animations  
- Improve overall visual design  
- Add gradient backgrounds  
- Create custom app theme  
- Add loading animations  
- Make cards more attractive  
- Add icon variety based on task type  
  
---  
  
## Step 1: Understanding Themes  
  
Themes define the overall look of your app:  
- Colors  
- Font styles  
- Button styles  
- App bar styles  
  
Instead of setting colors everywhere, we define them once in a theme.  
  
---  
  
## Step 2: Create App Theme  
  
### Modify main.dart  
  
Update the `MyApp` class in `main.dart`:  
  
```dart  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      title: 'Bharat Task Manager',  
      debugShowCheckedModeBanner: false,  
      theme: ThemeData(  
        primarySwatch: Colors.blue,  
        primaryColor: Color(0xFF2196F3),  
        scaffoldBackgroundColor: Color(0xFFF5F5F5),  
          
        colorScheme: ColorScheme.fromSeed(  
          seedColor: Color(0xFF2196F3),  
          brightness: Brightness.light,  
        ),  
          
        appBarTheme: AppBarTheme(  
          backgroundColor: Color(0xFF2196F3),  
          foregroundColor: Colors.white,  
          elevation: 0,  
          centerTitle: false,  
          titleTextStyle: TextStyle(  
            fontSize: 20,  
            fontWeight: FontWeight.bold,  
            color: Colors.white,  
          ),  
        ),  
          
        cardTheme: CardTheme(  
          elevation: 2,  
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(12),  
          ),  
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),  
        ),  
          
        floatingActionButtonTheme: FloatingActionButtonThemeData(  
          backgroundColor: Color(0xFF2196F3),  
          foregroundColor: Colors.white,  
          elevation: 6,  
        ),  
          
        inputDecorationTheme: InputDecorationTheme(  
          border: OutlineInputBorder(  
            borderRadius: BorderRadius.circular(12),  
          ),  
          filled: true,  
          fillColor: Colors.white,  
        ),  
          
        elevatedButtonTheme: ElevatedButtonThemeData(  
          style: ElevatedButton.styleFrom(  
            backgroundColor: Color(0xFF2196F3),  
            foregroundColor: Colors.white,  
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),  
            shape: RoundedRectangleBorder(  
              borderRadius: BorderRadius.circular(12),  
            ),  
          ),  
        ),  
      ),  
      home: WelcomeScreen(),  
    );  
  }  
}  
```  
  
### Understanding Theme Properties  
  
**Primary Color:**  
```dart  
primaryColor: Color(0xFF2196F3),  
```  
`0xFF2196F3` is hex color code. `0xFF` means fully opaque, `2196F3` is the color.  
  
**Color Scheme:**  
```dart  
colorScheme: ColorScheme.fromSeed(  
  seedColor: Color(0xFF2196F3),  
  brightness: Brightness.light,  
),  
```  
Generates related colors from one main color.  
  
**AppBar Theme:**  
```dart  
appBarTheme: AppBarTheme(  
  backgroundColor: Color(0xFF2196F3),  
  elevation: 0,  // No shadow  
  centerTitle: false,  // Title on left  
),  
```  
All AppBars use these settings automatically.  
  
**Debug Banner:**  
```dart  
debugShowCheckedModeBanner: false,  
```  
Removes "DEBUG" banner from top-right corner.  
  
---  
  
## Step 3: Enhance Welcome Screen with Gradient  
  
### Update Welcome Screen  
  
Replace `WelcomeScreen` in `main.dart`:  
  
```dart  
class WelcomeScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      body: Container(  
        decoration: BoxDecoration(  
          gradient: LinearGradient(  
            begin: Alignment.topCenter,  
            end: Alignment.bottomCenter,  
            colors: [  
              Color(0xFF2196F3),  
              Color(0xFF1976D2),  
              Color(0xFF0D47A1),  
            ],  
          ),  
        ),  
        child: SafeArea(  
          child: Center(  
            child: Column(  
              mainAxisAlignment: MainAxisAlignment.center,  
              children: [  
                Container(  
                  padding: EdgeInsets.all(20),  
                  decoration: BoxDecoration(  
                    color: Colors.white,  
                    shape: BoxShape.circle,  
                    boxShadow: [  
                      BoxShadow(  
                        color: Colors.black26,  
                        blurRadius: 20,  
                        offset: Offset(0, 10),  
                      ),  
                    ],  
                  ),  
                  child: Icon(  
                    Icons.task_alt,  
                    size: 80,  
                    color: Color(0xFF2196F3),  
                  ),  
                ),  
                SizedBox(height: 40),  
                Text(  
                  'Welcome to',  
                  style: TextStyle(  
                    fontSize: 24,  
                    color: Colors.white70,  
                    letterSpacing: 1.2,  
                  ),  
                ),  
                SizedBox(height: 10),  
                Text(  
                  'Bharat Task Manager',  
                  style: TextStyle(  
                    fontSize: 36,  
                    fontWeight: FontWeight.bold,  
                    color: Colors.white,  
                    letterSpacing: 0.5,  
                  ),  
                ),  
                SizedBox(height: 10),  
                Container(  
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),  
                  decoration: BoxDecoration(  
                    color: Colors.white24,  
                    borderRadius: BorderRadius.circular(20),  
                  ),  
                  child: Text(  
                    'Organize Your Life',  
                    style: TextStyle(  
                      fontSize: 16,  
                      color: Colors.white,  
                      fontWeight: FontWeight.w300,  
                    ),  
                  ),  
                ),  
                SizedBox(height: 60),  
                Container(  
                  padding: EdgeInsets.all(16),  
                  decoration: BoxDecoration(  
                    color: Colors.white24,  
                    borderRadius: BorderRadius.circular(12),  
                  ),  
                  child: Column(  
                    children: [  
                      Text(  
                        'Created by: Suresh Kumar',  
                        style: TextStyle(  
                          fontSize: 18,  
                          color: Colors.white,  
                        ),  
                      ),  
                      SizedBox(height: 6),  
                      Text(  
                        'Pune, Maharashtra',  
                        style: TextStyle(  
                          fontSize: 14,  
                          color: Colors.white70,  
                        ),  
                      ),  
                    ],  
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
                    backgroundColor: Colors.white,  
                    foregroundColor: Color(0xFF2196F3),  
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),  
                    shape: RoundedRectangleBorder(  
                      borderRadius: BorderRadius.circular(30),  
                    ),  
                    elevation: 8,  
                  ),  
                  child: Row(  
                    mainAxisSize: MainAxisSize.min,  
                    children: [  
                      Text(  
                        'Get Started',  
                        style: TextStyle(  
                          fontSize: 18,  
                          fontWeight: FontWeight.bold,  
                        ),  
                      ),  
                      SizedBox(width: 10),  
                      Icon(Icons.arrow_forward),  
                    ],  
                  ),  
                ),  
              ],  
            ),  
          ),  
        ),  
      ),  
    );  
  }  
}  
```  
  
### Understanding New Design Elements  
  
**Gradient Background:**  
```dart  
decoration: BoxDecoration(  
  gradient: LinearGradient(  
    begin: Alignment.topCenter,  
    end: Alignment.bottomCenter,  
    colors: [  
      Color(0xFF2196F3),  // Light blue  
      Color(0xFF1976D2),  // Medium blue  
      Color(0xFF0D47A1),  // Dark blue  
    ],  
  ),  
),  
```  
Creates smooth color transition from top to bottom.  
  
**Box Shadow:**  
```dart  
boxShadow: [  
  BoxShadow(  
    color: Colors.black26,  // Shadow color  
    blurRadius: 20,         // How blurred  
    offset: Offset(0, 10),  // Position (x, y)  
  ),  
],  
```  
Adds shadow effect to containers.  
  
**SafeArea:**  
```dart  
SafeArea(  
  child: Center(...),  
)  
```  
Prevents content from going behind system UI (status bar, notch).  
  
**Letter Spacing:**  
```dart  
letterSpacing: 1.2,  
```  
Adds space between letters for elegant look.  
  
---  
  
## Step 4: Animate Task Cards  
  
### Create Animated Task Card  
  
In `task_list_screen.dart`, wrap the ListView.builder items with animation:  
  
Replace the `ListView.builder` section with:  
  
```dart  
ListView.builder(  
  padding: EdgeInsets.all(16),  
  itemCount: tasks.length,  
  itemBuilder: (context, index) {  
    return TweenAnimationBuilder(  
      duration: Duration(milliseconds: 500),  
      tween: Tween<double>(begin: 0, end: 1),  
      builder: (context, double value, child) {  
        return Transform.scale(  
          scale: value,  
          child: Opacity(  
            opacity: value,  
            child: child,  
          ),  
        );  
      },  
      child: Dismissible(  
        key: Key(tasks[index].title + index.toString()),  
        direction: DismissDirection.endToStart,  
        background: Container(  
          alignment: Alignment.centerRight,  
          padding: EdgeInsets.only(right: 20),  
          margin: EdgeInsets.only(bottom: 16),  
          decoration: BoxDecoration(  
            color: Colors.red,  
            borderRadius: BorderRadius.circular(12),  
          ),  
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
              content: Row(  
                children: [  
                  Icon(Icons.check_circle, color: Colors.white),  
                  SizedBox(width: 10),  
                  Text('$taskTitle deleted'),  
                ],  
              ),  
              behavior: SnackBarBehavior.floating,  
              shape: RoundedRectangleBorder(  
                borderRadius: BorderRadius.circular(10),  
              ),  
              backgroundColor: Colors.red,  
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
      ),  
    );  
  },  
)  
```  
  
### Understanding Animation  
  
**TweenAnimationBuilder:**  
```dart  
TweenAnimationBuilder(  
  duration: Duration(milliseconds: 500),  
  tween: Tween<double>(begin: 0, end: 1),  
  builder: (context, double value, child) {  
    // Animation happens here  
  },  
)  
```  
Animates from `begin` (0) to `end` (1) over 500 milliseconds.  
  
**Transform.scale:**  
```dart  
Transform.scale(  
  scale: value,  // 0 to 1  
  child: child,  
)  
```  
When value = 0, card is invisible (0% size)  
When value = 1, card is full size (100%)  
Creates grow-in effect.  
  
**Opacity:**  
```dart  
Opacity(  
  opacity: value,  // 0 to 1  
  child: child,  
)  
```  
When value = 0, fully transparent  
When value = 1, fully visible  
Creates fade-in effect.  
  
---  
  
## Step 5: Enhance Task Card Design  
  
### Update TaskCard Widget  
  
Replace the `TaskCard` class in `task_list_screen.dart`:  
  
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
    return Card(  
      margin: EdgeInsets.only(bottom: 16),  
      elevation: task.isCompleted ? 1 : 4,  
      color: task.isCompleted ? Colors.grey[200] : Colors.white,  
      shape: RoundedRectangleBorder(  
        borderRadius: BorderRadius.circular(16),  
        side: BorderSide(  
          color: task.isCompleted  
              ? Colors.grey.shade300  
              : _getPriorityColor().withOpacity(0.3),  
          width: 2,  
        ),  
      ),  
      child: InkWell(  
        onTap: onTap,  
        borderRadius: BorderRadius.circular(16),  
        child: Container(  
          decoration: BoxDecoration(  
            borderRadius: BorderRadius.circular(16),  
            gradient: task.isCompleted  
                ? null  
                : LinearGradient(  
                    begin: Alignment.topLeft,  
                    end: Alignment.bottomRight,  
                    colors: [  
                      Colors.white,  
                      _getPriorityColor().withOpacity(0.05),  
                    ],  
                  ),  
          ),  
          child: Padding(  
            padding: EdgeInsets.all(16),  
            child: Column(  
              crossAxisAlignment: CrossAxisAlignment.start,  
              children: [  
                Row(  
                  children: [  
                    Container(  
                      padding: EdgeInsets.all(8),  
                      decoration: BoxDecoration(  
                        color: task.isCompleted  
                            ? Colors.green.withOpacity(0.1)  
                            : _getPriorityColor().withOpacity(0.1),  
                        borderRadius: BorderRadius.circular(10),  
                      ),  
                      child: Icon(  
                        task.isCompleted  
                            ? Icons.check_circle  
                            : _getTaskIcon(),  
                        color: task.isCompleted  
                            ? Colors.green  
                            : _getPriorityColor(),  
                        size: 24,  
                      ),  
                    ),  
                    SizedBox(width: 12),  
                    Expanded(  
                      child: Column(  
                        crossAxisAlignment: CrossAxisAlignment.start,  
                        children: [  
                          Text(  
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
                          if (!task.isCompleted)  
                            Container(  
                              margin: EdgeInsets.only(top: 4),  
                              padding: EdgeInsets.symmetric(  
                                  horizontal: 8, vertical: 2),  
                              decoration: BoxDecoration(  
                                color: _getPriorityColor(),  
                                borderRadius: BorderRadius.circular(8),  
                              ),  
                              child: Text(  
                                _getPriorityText(),  
                                style: TextStyle(  
                                  fontSize: 10,  
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
                SizedBox(height: 12),  
                Padding(  
                  padding: EdgeInsets.only(left: 52),  
                  child: Text(  
                    task.description,  
                    style: TextStyle(  
                      fontSize: 14,  
                      color: task.isCompleted  
                          ? Colors.grey  
                          : Colors.black54,  
                      decoration: task.isCompleted  
                          ? TextDecoration.lineThrough  
                          : TextDecoration.none,  
                      height: 1.5,  
                    ),  
                  ),  
                ),  
                SizedBox(height: 12),  
                Padding(  
                  padding: EdgeInsets.only(left: 52),  
                  child: Row(  
                    children: [  
                      Container(  
                        padding: EdgeInsets.symmetric(  
                            horizontal: 10, vertical: 6),  
                        decoration: BoxDecoration(  
                          color: Colors.blue.shade50,  
                          borderRadius: BorderRadius.circular(8),  
                        ),  
                        child: Row(  
                          mainAxisSize: MainAxisSize.min,  
                          children: [  
                            Icon(  
                              Icons.access_time,  
                              size: 14,  
                              color: Colors.blue.shade700,  
                            ),  
                            SizedBox(width: 4),  
                            Text(  
                              task.deadline,  
                              style: TextStyle(  
                                fontSize: 12,  
                                color: Colors.blue.shade700,  
                                fontWeight: FontWeight.w500,  
                              ),  
                            ),  
                          ],  
                        ),  
                      ),  
                    ],  
                  ),  
                ),  
              ],  
            ),  
          ),  
        ),  
      ),  
    );  
  }  
  
  IconData _getTaskIcon() {  
    String lowerTitle = task.title.toLowerCase();  
      
    if (lowerTitle.contains('buy') || lowerTitle.contains('shop') ||  
        lowerTitle.contains('purchase') || lowerTitle.contains('groceries')) {  
      return Icons.shopping_cart;  
    } else if (lowerTitle.contains('call') || lowerTitle.contains('phone')) {  
      return Icons.phone;  
    } else if (lowerTitle.contains('assignment') || lowerTitle.contains('study') ||  
        lowerTitle.contains('exam') || lowerTitle.contains('college')) {  
      return Icons.school;  
    } else if (lowerTitle.contains('book') || lowerTitle.contains('ticket') ||  
        lowerTitle.contains('reserve')) {  
      return Icons.confirmation_number;  
    } else if (lowerTitle.contains('pay') || lowerTitle.contains('bill') ||  
        lowerTitle.contains('premium')) {  
      return Icons.payment;  
    } else if (lowerTitle.contains('visit') || lowerTitle.contains('go to') ||  
        lowerTitle.contains('temple')) {  
      return Icons.place;  
    } else {  
      return Icons.task_alt;  
    }  
  }  
  
  Color _getPriorityColor() {  
    if (task.priority == TaskPriority.high) {  
      return Colors.red.shade600;  
    } else if (task.priority == TaskPriority.medium) {  
      return Colors.orange.shade600;  
    } else {  
      return Colors.green.shade600;  
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
  
### Understanding Card Enhancements  
  
**Border:**  
```dart  
side: BorderSide(  
  color: _getPriorityColor().withOpacity(0.3),  
  width: 2,  
),  
```  
Adds colored border around card.  
  
**Subtle Gradient:**  
```dart  
gradient: LinearGradient(  
  begin: Alignment.topLeft,  
  end: Alignment.bottomRight,  
  colors: [  
    Colors.white,  
    _getPriorityColor().withOpacity(0.05),  
  ],  
),  
```  
Very light gradient for visual depth.  
  
**Smart Icons:**  
```dart  
IconData _getTaskIcon() {  
  String lowerTitle = task.title.toLowerCase();  
    
  if (lowerTitle.contains('buy')) {  
    return Icons.shopping_cart;  
  }  
  // More conditions...  
}  
```  
Shows different icons based on task title:  
- Shopping tasks → Shopping cart icon  
- Phone tasks → Phone icon  
- College tasks → School icon  
  
---  
  
## Step 6: Improve Empty State  
  
### Update Empty State in TaskListScreen  
  
Find the empty state section and replace it:  
  
```dart  
Center(  
  child: Column(  
    mainAxisAlignment: MainAxisAlignment.center,  
    children: [  
      Container(  
        padding: EdgeInsets.all(30),  
        decoration: BoxDecoration(  
          color: Colors.blue.shade50,  
          shape: BoxShape.circle,  
        ),  
        child: Icon(  
          Icons.task_alt,  
          size: 80,  
          color: Colors.blue.shade200,  
        ),  
      ),  
      SizedBox(height: 24),  
      Text(  
        'No Tasks Yet!',  
        style: TextStyle(  
          fontSize: 24,  
          fontWeight: FontWeight.bold,  
          color: Colors.grey.shade700,  
        ),  
      ),  
      SizedBox(height: 8),  
      Text(  
        'Tap the + button below to create',  
        style: TextStyle(  
          fontSize: 16,  
          color: Colors.grey.shade500,  
        ),  
      ),  
      Text(  
        'your first task',  
        style: TextStyle(  
          fontSize: 16,  
          color: Colors.grey.shade500,  
        ),  
      ),  
      SizedBox(height: 30),  
      Container(  
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),  
        decoration: BoxDecoration(  
          color: Colors.blue.shade50,  
          borderRadius: BorderRadius.circular(20),  
        ),  
        child: Row(  
          mainAxisSize: MainAxisSize.min,  
          children: [  
            Icon(Icons.lightbulb_outline, color: Colors.blue.shade700, size: 20),  
            SizedBox(width: 8),  
            Text(  
              'Stay organized and productive!',  
              style: TextStyle(  
                color: Colors.blue.shade700,  
                fontSize: 14,  
                fontWeight: FontWeight.w500,  
              ),  
            ),  
          ],  
        ),  
      ),  
    ],  
  ),  
)  
```  
  
---  
  
## Step 7: Enhance Add Task Screen  
  
### Update Add Task Screen Header  
  
In `add_task_screen.dart`, update the header section:  
  
```dart  
Container(  
  padding: EdgeInsets.all(20),  
  decoration: BoxDecoration(  
    gradient: LinearGradient(  
      colors: [Colors.blue.shade400, Colors.blue.shade600],  
    ),  
    borderRadius: BorderRadius.circular(16),  
  ),  
  child: Column(  
    crossAxisAlignment: CrossAxisAlignment.start,  
    children: [  
      Row(  
        children: [  
          Icon(Icons.add_task, color: Colors.white, size: 32),  
          SizedBox(width: 12),  
          Text(  
            'Create New Task',  
            style: TextStyle(  
              fontSize: 24,  
              fontWeight: FontWeight.bold,  
              color: Colors.white,  
            ),  
          ),  
        ],  
      ),  
      SizedBox(height: 8),  
      Text(  
        'Fill in the details to add a new task to your list',  
        style: TextStyle(  
          fontSize: 14,  
          color: Colors.white70,  
        ),  
      ),  
    ],  
  ),  
),  
```  
  
Add this at the beginning of the Column, before the first TextFormField.  
  
---  
  
## Step 8: Add Loading Animation  
  
### Create Better Loading Screen  
  
In `task_list_screen.dart`, update the loading section:  
  
```dart  
isLoading  
    ? Center(  
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [  
            CircularProgressIndicator(  
              strokeWidth: 3,  
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),  
            ),  
            SizedBox(height: 20),  
            Text(  
              'Loading your tasks...',  
              style: TextStyle(  
                fontSize: 16,  
                color: Colors.grey.shade600,  
              ),  
            ),  
          ],  
        ),  
      )  
    : // rest of code  
```  
  
---  
  
## Common Issues and Solutions  
  
### Issue 1: Gradient Not Showing  
  
**Solution:**  
Make sure Container has `decoration`, not `color`:  
```dart  
// Wrong  
Container(  
  color: Colors.blue,  
  decoration: BoxDecoration(gradient: ...),  // Won't work  
)  
  
// Correct  
Container(  
  decoration: BoxDecoration(gradient: ...),  
)  
```  
  
### Issue 2: Animation Laggy  
  
**Solution:**  
Reduce animation duration:  
```dart  
duration: Duration(milliseconds: 300),  // Instead of 500  
```  
  
### Issue 3: Colors Look Different  
  
**Solution:**  
Use exact hex codes for consistency:  
```dart  
Color(0xFF2196F3)  // Always same blue  
```  
  
---  
  
## Practice Tasks  
  
### Task 1: Add Dark Theme  
  
Create a dark mode for the app:  
- Dark background  
- Light text  
- Adjusted colors  
  
### Task 2: Animate Button Press  
  
Add scale animation to buttons when pressed.  
  
Hint: Use `AnimatedContainer` or `GestureDetector` with `Transform.scale`  
  
### Task 3: Add More Icon Categories  
  
Extend `_getTaskIcon()` to recognize:  
- Meeting/appointment  
- Email tasks  
- Exercise/health tasks  
- Entertainment tasks  
  
### Task 4: Custom Font  
  
Add a custom font from Google Fonts package:  
```yaml  
# pubspec.yaml  
dependencies:  
  google_fonts: ^6.1.0  
```  
  
### Task 5: Ripple Effect Color  
  
Change the ripple effect color in InkWell:  
```dart  
InkWell(  
  splashColor: Colors.blue.withOpacity(0.3),  
  highlightColor: Colors.blue.withOpacity(0.1),  
  onTap: onTap,  
  child: ...,  
)  
```  
  
---  
  
## Quick Reference  
  
### Color Formats  
  
```dart  
// Named colors  
Colors.blue  
Colors.red.shade600  // Darker shade  
  
// Hex colors  
Color(0xFFRRGGBB)  
Color(0xFF2196F3)  
  
// ARGB (Alpha, Red, Green, Blue)  
Color.fromARGB(255, 33, 150, 243)  
  
// Opacity  
Colors.blue.withOpacity(0.5)  // 50% transparent  
```  
  
### Gradient Types  
  
```dart  
// Linear (top to bottom, left to right, etc.)  
LinearGradient(  
  begin: Alignment.topCenter,  
  end: Alignment.bottomCenter,  
  colors: [Colors.blue, Colors.purple],  
)  
  
// Radial (circular from center)  
RadialGradient(  
  colors: [Colors.blue, Colors.purple],  
)  
  
// Sweep (circular rotating)  
SweepGradient(  
  colors: [Colors.blue, Colors.purple],  
)  
```  
  
### Shadow Types  
  
```dart  
// Box shadow (for containers)  
boxShadow: [  
  BoxShadow(  
    color: Colors.black26,  
    blurRadius: 10,  
    offset: Offset(0, 5),  
    spreadRadius: 2,  
  ),  
]  
  
// Text shadow  
shadows: [  
  Shadow(  
    color: Colors.black26,  
    blurRadius: 10,  
    offset: Offset(2, 2),  
  ),  
]  
```  
  
### Border Radius  
  
```dart  
// All corners same  
BorderRadius.circular(12)  
  
// Different corners  
BorderRadius.only(  
  topLeft: Radius.circular(20),  
  topRight: Radius.circular(20),  
  bottomLeft: Radius.circular(0),  
  bottomRight: Radius.circular(0),  
)  
```  
  
---  
  
## What We Learned  
  
1. Creating app-wide themes with ThemeData  
2. Using hex color codes  
3. Creating gradient backgrounds  
4. Adding box shadows for depth  
5. Animation with TweenAnimationBuilder  
6. Transform.scale for grow effects  
7. Opacity for fade effects  
8. Smart icon selection based on content  
9. Border styling for cards  
10. SafeArea for system UI spacing  
11. Letter spacing for typography  
12. Floating behavior for SnackBars  
13. Creating visually appealing empty states  
14. Combining multiple visual effects  
  
---  
  
## Next Part Preview  
  
In Part 6 (Final), we will:  
- Configure app name and icon  
- Set up app permissions  
- Generate release APK  
- Test on real device  
- Prepare for distribution  
- Learn about app signing  
- Create launcher icon  
- Build final production app  
  
Make sure your app looks great and all features work before moving to Part 6!  
  
---  
  
## Checklist Before Moving to Part 6  
  
- [ ] App has custom theme applied  
- [ ] Welcome screen has gradient background  
- [ ] Task cards animate when loading  
- [ ] Cards have colored borders  
- [ ] Icons change based on task type  
- [ ] Empty state looks attractive  
- [ ] All colors are consistent  
- [ ] SnackBars are styled  
- [ ] Loading screen shows properly  
- [ ] App looks polished overall  
- [ ] You completed at least 2 practice tasks  
  
If all items are checked, you're ready for Part 6 - the final part!  
  
---  
  
**Important:** Visual design makes the difference between a good app and a great app. Users judge apps in the first few seconds based on how they look. Take time to adjust colors, spacing, and animations until you're proud of how your app looks.  
  
Save your project. Part 6 will prepare it for the real world!