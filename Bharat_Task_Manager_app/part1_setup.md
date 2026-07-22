# Flutter Training - Part 1: Environment Setup & First Screen  
  
## Bharat Task Manager Application  
  
### What We Will Build in This Part  
  
In this part, you will:  
- Install Flutter on your computer  
- Set up Android Studio  
- Create your first Flutter project  
- Build a welcome screen with your name  
- Run the application on an emulator  
  
---  
  
## Step 1: Install Flutter SDK  
  
### For Windows Users  
  
**Download Flutter**  
  
1. Open your web browser and go to: `https://docs.flutter.dev/get-started/install/windows`  
2. Click on "Download Flutter SDK"  
3. You will get a file named something like `flutter_windows_3.x.x-stable.zip`  
4. Save this file to your Downloads folder  
  
**Extract Flutter**  
  
1. Right-click on the downloaded zip file  
2. Select "Extract All"  
3. Choose location as `C:\src\flutter`  
4. Click "Extract"  
  
**Add Flutter to System Path**  
  
1. Press `Windows + R` keys together  
2. Type `sysdm.cpl` and press Enter  
3. Click on "Advanced" tab  
4. Click "Environment Variables" button  
5. Under "User variables", find "Path" and click "Edit"  
6. Click "New"  
7. Type `C:\src\flutter\bin`  
8. Click "OK" on all windows  
  
**Verify Installation**  
  
1. Press `Windows + R`  
2. Type `cmd` and press Enter  
3. In the black window (Command Prompt), type:  
```  
flutter doctor  
```  
4. Press Enter  
5. You will see a report. Don't worry if you see red crosses - we will fix them  
  
---  
  
### For macOS Users  
  
**Download Flutter**  
  
1. Open Safari or Chrome  
2. Go to: `https://docs.flutter.dev/get-started/install/macos`  
3. Download the Flutter SDK for macOS  
4. The file will be saved in Downloads folder  
  
**Extract and Setup**  
  
1. Open Terminal (Press Cmd + Space, type "terminal", press Enter)  
2. Type these commands one by one:  
  
```bash  
cd ~/Downloads  
unzip flutter_macos_*.zip  
sudo mv flutter /usr/local/  
```  
  
3. When asked for password, type your Mac password (letters won't show, that's normal)  
  
**Add to Path**  
  
1. In Terminal, type:  
```bash  
nano ~/.zshrc  
```  
  
2. Add this line at the end:  
```bash  
export PATH="$PATH:/usr/local/flutter/bin"  
```  
  
3. Press `Control + O` (to save)  
4. Press `Enter`  
5. Press `Control + X` (to exit)  
  
6. Type:  
```bash  
source ~/.zshrc  
```  
  
**Verify Installation**  
  
Type in Terminal:  
```bash  
flutter doctor  
```  
  
---  
  
## Step 2: Install Android Studio  
  
### Download Android Studio  
  
1. Go to: `https://developer.android.com/studio`  
2. Click "Download Android Studio"  
3. Accept the terms  
4. Download will start (file size is around 1 GB)  
  
### Install Android Studio  
  
**For Windows:**  
  
1. Double-click the downloaded `.exe` file  
2. Click "Next" on all screens  
3. Keep all default options selected  
4. Click "Install"  
5. Wait for installation (takes 10-15 minutes)  
6. Click "Finish"  
  
**For macOS:**  
  
1. Open the downloaded `.dmg` file  
2. Drag "Android Studio" to Applications folder  
3. Open Applications folder  
4. Double-click "Android Studio"  
5. Click "Open" if security warning appears  
  
### First Time Setup of Android Studio  
  
1. Android Studio will open with "Welcome" screen  
2. Click "Next"  
3. Select "Standard" installation type  
4. Click "Next"  
5. Choose any theme you like (Light or Dark)  
6. Click "Next"  
7. Click "Finish"  
8. Wait for downloads (this takes 15-20 minutes, downloads around 2 GB)  
  
### Install Flutter and Dart Plugins  
  
1. After downloads complete, you'll see "Welcome to Android Studio"  
2. Click on "Plugins" (on the left side)  
3. In search box, type "Flutter"  
4. Click "Install" next to Flutter plugin  
5. It will ask to install Dart plugin also - click "Accept"  
6. Click "Restart IDE"  
7. Android Studio will close and reopen  
  
---  
  
## Step 3: Configure Android Emulator  
  
### Create Virtual Device  
  
1. In Android Studio welcome screen, click "More Actions"  
2. Select "Virtual Device Manager"  
3. Click "Create Device"  
4. Select "Phone" category (already selected)  
5. Choose "Pixel 5" from the list  
6. Click "Next"  
7. Under "Recommended" tab, select "Tiramisu" (API Level 33)  
8. Click "Download" next to it  
9. Accept license agreement  
10. Click "Next"  
11. Wait for download (around 1 GB, takes 10-15 minutes)  
12. Click "Finish" when done  
13. Click "Next"  
14. Name your device: "My_Android_Phone"  
15. Click "Finish"  
  
### Test the Emulator  
  
1. You will see your device "My_Android_Phone" in the list  
2. Click the "Play" button (▶) next to it  
3. Wait for 2-3 minutes  
4. Android phone screen will appear on your computer  
5. You can close it for now (click X)  
  
---  
  
## Step 4: Create Your First Flutter Project  
  
### Using Android Studio  
  
1. Click "New Flutter Project"  
2. Select "Flutter" from left panel  
3. Make sure Flutter SDK path is shown (if not, click "..." and select your flutter folder)  
4. Click "Next"  
5. Project name: `bharat_task_manager`  
   - Note: Use only small letters and underscore, no spaces  
6. Description: `A task management app for Indian users`  
7. Project location: Choose any folder you like (Desktop is good)  
8. Organization: `com.learner.app`  
9. Click "Create"  
10. Wait for project creation (takes 2-3 minutes)  
  
### Understanding Project Structure  
  
Once project opens, you'll see folders on left side:  
  
```  
bharat_task_manager/  
├── android/           (Android specific files)  
├── ios/              (iOS specific files - ignore for now)  
├── lib/              (Our Dart code goes here)  
│   └── main.dart     (Starting point of app)  
├── test/             (Testing files)  
└── pubspec.yaml      (Project configuration)  
```  
  
We will mostly work in `lib` folder.  
  
---  
  
## Step 5: Understanding main.dart File  
  
### Open main.dart  
  
1. On left side, expand `lib` folder  
2. Double-click on `main.dart`  
3. You will see code in the editor  
  
### What's in main.dart  
  
The file has a lot of code. Don't worry about understanding everything. Here's what matters:  
  
```dart  
void main() {  
  runApp(const MyApp());  
}  
```  
  
This is the starting point. When app launches, `main()` function runs first.  
  
---  
  
## Step 6: Create Your First Screen  
  
### Delete Everything and Start Fresh  
  
1. In `main.dart`, select all code (Ctrl+A on Windows, Cmd+A on Mac)  
2. Press Delete  
3. Now file is empty  
  
### Write Your First Code  
  
Copy this code and paste in `main.dart`:  
  
```dart  
import 'package:flutter/material.dart';  
  
void main() {  
  runApp(MyApp());  
}  
  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      title: 'Bharat Task Manager',  
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
          ],  
        ),  
      ),  
    );  
  }  
}  
```  
  
### Personalize the Code  
  
Change the name and location to yours:  
  
```dart  
Text(  
  'Created by: Your Name Here',  // Put your actual name  
  style: TextStyle(  
    fontSize: 18,  
    color: Colors.black87,  
  ),  
),  
SizedBox(height: 10),  
Text(  
  'Your City, Your State',  // Put your city and state  
  style: TextStyle(  
    fontSize: 16,  
    color: Colors.grey,  
  ),  
),  
```  
  
---  
  
## Step 7: Run Your Application  
  
### Start the Emulator  
  
1. At the top of Android Studio, you'll see a dropdown that says "No Device"  
2. Click on it  
3. Select "My_Android_Phone"  
4. Wait for emulator to start (2-3 minutes)  
5. You'll see Android phone screen  
  
### Run the App  
  
1. Click the green "Play" button (▶) at the top  
2. Or press Shift+F10 (Windows) or Control+R (Mac)  
3. You'll see "Running..." at the bottom  
4. Wait for 1-2 minutes (first time takes longer)  
5. Your app will open in the emulator  
  
### What You Should See  
  
You should see a white screen with:  
- "Welcome to" in grey  
- "Bharat Task Manager" in blue and bold  
- Your name  
- Your city and state  
  
---  
  
## Step 8: Understanding What We Wrote  
  
### Breaking Down the Code  
  
**Import Statement:**  
```dart  
import 'package:flutter/material.dart';  
```  
This brings Flutter's building blocks into our code. Think of it like opening a toolbox.  
  
**Main Function:**  
```dart  
void main() {  
  runApp(MyApp());  
}  
```  
This is where your app starts running. It calls `MyApp`.  
  
**MyApp Class:**  
```dart  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      title: 'Bharat Task Manager',  
      home: WelcomeScreen(),  
    );  
  }  
}  
```  
This sets up your app's basic structure. `MaterialApp` gives us Material Design (Google's design system). `home` tells which screen to show first.  
  
**WelcomeScreen Class:**  
```dart  
class WelcomeScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      backgroundColor: Colors.white,  
      body: Center(  
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [  
            // Text widgets here  
          ],  
        ),  
      ),  
    );  
  }  
}  
```  
  
- `Scaffold`: Provides basic screen structure (like a blank canvas)  
- `backgroundColor`: Sets screen background color  
- `Center`: Centers everything inside it  
- `Column`: Arranges children vertically (top to bottom)  
- `mainAxisAlignment: MainAxisAlignment.center`: Centers items vertically  
  
**Text Widget:**  
```dart  
Text(  
  'Bharat Task Manager',  
  style: TextStyle(  
    fontSize: 32,  
    fontWeight: FontWeight.bold,  
    color: Colors.blue,  
  ),  
),  
```  
  
- `Text`: Displays text on screen  
- `style`: Controls how text looks  
- `fontSize`: Size of text (32 means 32 pixels)  
- `fontWeight.bold`: Makes text bold  
- `color`: Text color  
  
**SizedBox:**  
```dart  
SizedBox(height: 10),  
```  
Creates empty space. Here, 10 pixels of vertical space.  
  
---  
  
## Step 9: Making Changes and Hot Reload  
  
### Try Changing Something  
  
1. In your code, find this line:  
```dart  
fontSize: 32,  
```  
  
2. Change 32 to 40:  
```dart  
fontSize: 40,  
```  
  
3. Save the file (Ctrl+S on Windows, Cmd+S on Mac)  
  
4. Look at the emulator - the title should become bigger instantly!  
  
This is called "Hot Reload" - Flutter's superpower. You can see changes without restarting the app.  
  
### Experiment More  
  
Try changing:  
  
**Background Color:**  
```dart  
backgroundColor: Colors.lightBlue[50],  
```  
  
**Title Color:**  
```dart  
color: Colors.orange,  
```  
  
**Add More Spacing:**  
```dart  
SizedBox(height: 30),  
```  
  
After each change, save and watch it update!  
  
---  
  
## Step 10: Understanding Widget Tree  
  
Flutter apps are built using "widgets". Everything is a widget!  
  
Our app's widget tree:  
  
```  
MaterialApp  
  └── WelcomeScreen (Scaffold)  
        └── body (Center)  
              └── Column  
                    ├── Text ("Welcome to")  
                    ├── SizedBox (spacing)  
                    ├── Text ("Bharat Task Manager")  
                    ├── SizedBox (spacing)  
                    ├── Text (Your name)  
                    ├── SizedBox (spacing)  
                    └── Text (Your city)  
```  
  
Each widget is a building block. We combine them to build screens.  
  
---  
  
## Common Issues and Solutions  
  
### Issue 1: "No Device Available"  
  
**Solution:**  
1. Go to Tools → Device Manager  
2. Click Play button next to "My_Android_Phone"  
3. Wait for emulator to start  
4. Try running again  
  
### Issue 2: Red Underlines in Code  
  
**Solution:**  
1. Click on Terminal at the bottom  
2. Type: `flutter pub get`  
3. Press Enter  
4. Wait for completion  
  
### Issue 3: App Shows Error Screen  
  
**Solution:**  
1. Check if you copied code correctly  
2. Make sure there are no red underlines  
3. Stop the app (red square button at top)  
4. Run again (green play button)  
  
### Issue 4: Emulator is Very Slow  
  
**Solution:**  
1. Close other heavy applications  
2. Or use a physical Android phone:  
   - Connect phone with USB cable  
   - Enable "Developer Options" on phone  
   - Enable "USB Debugging"  
   - Select your phone from device dropdown  
  
---  
  
## Practice Tasks  
  
### Task 1: Change All Colors  
  
Modify your welcome screen to use these colors:  
- Background: Light green  
- Title: Dark green  
- Your name: Black  
- City: Grey  
  
### Task 2: Add More Information  
  
Add these additional details below city:  
- Your college name  
- Current date  
  
Hint: Use more `Text` widgets and `SizedBox` for spacing.  
  
### Task 3: Increase All Font Sizes  
  
Make all text 20% bigger than current sizes.  
  
### Task 4: Add a Subtitle  
  
Between "Welcome to" and "Bharat Task Manager", add a new line:  
"Your Personal Productivity Partner"  
Make it orange color with size 20.  
  
---  
  
## Quick Reference  
  
### Common Widgets Used  
  
| Widget | Purpose | Example |  
|--------|---------|---------|  
| `MaterialApp` | App foundation | Wraps entire app |  
| `Scaffold` | Screen structure | Provides screen layout |  
| `Center` | Centers children | Centers content |  
| `Column` | Vertical layout | Stacks widgets vertically |  
| `Text` | Display text | Shows text on screen |  
| `SizedBox` | Spacing | Creates empty space |  
  
### Common Colors  
  
```dart  
Colors.white  
Colors.black  
Colors.blue  
Colors.red  
Colors.green  
Colors.orange  
Colors.grey  
Colors.purple  
Colors.pink  
Colors.yellow  
Colors.lightBlue[50]  // Very light blue  
Colors.blue[900]       // Very dark blue  
```  
  
### Text Styles  
  
```dart  
fontSize: 20           // Text size  
fontWeight: FontWeight.bold    // Bold text  
fontWeight: FontWeight.normal  // Normal text  
color: Colors.blue     // Text color  
```  
  
---  
  
## What We Learned  
  
1. Installing Flutter and Android Studio  
2. Setting up Android emulator  
3. Creating a Flutter project  
4. Writing basic Dart code  
5. Using common widgets: MaterialApp, Scaffold, Center, Column, Text, SizedBox  
6. Running app on emulator  
7. Using Hot Reload to see instant changes  
8. Understanding widget tree structure  
9. Styling text with TextStyle  
10. Adding spacing between elements  
  
---  
  
## Next Part Preview  
  
In Part 2, we will:  
- Create a navigation system  
- Build a task list screen  
- Display a list of tasks  
- Learn about ListView widget  
- Add sample task data  
- Style our task cards  
  
Keep your project ready. We'll continue building on this foundation!  
  
---  
  
## Checklist Before Moving to Part 2  
  
- [ ] Flutter is installed and `flutter doctor` shows success  
- [ ] Android Studio is installed with Flutter plugin  
- [ ] Emulator is created and running  
- [ ] Project `bharat_task_manager` is created  
- [ ] App runs successfully on emulator  
- [ ] You can see welcome screen with your name  
- [ ] Hot Reload works when you make changes  
- [ ] You completed at least 2 practice tasks  
  
If all checkboxes are ticked, you're ready for Part 2!  
  
---  
  
**Remember:** Programming is not about memorizing. It's about understanding concepts and practicing. Don't worry if you don't understand everything. As we build more, things will become clearer.  
  
Take your time with this part. Make sure your environment is working perfectly before moving ahead.