<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For writing tips, see:
https://dart.dev/tools/pub/writing-package-pages
-->

# flutter_quick_nav

The `flutter_quick_nav` package is a Flutter navigation utility that simplifies screen transitions. It provides an easy way to push, replace, and reset screens — with smooth fade animations — making your app’s navigation more elegant and manageable.

## Features

- Navigate to a new screen with a fade animation.
- Replace the current screen with another.
- Push a screen and remove all previous routes until a named route.
- Clean and minimal API with `BuildContext` and `Widget`.

---

## 🚀 Screenshots

> *Note: This package affects screen transitions only, not UI layout.*

---

## 🔧 Installation

### 1. Depend on it

Add this to your package’s `pubspec.yaml` file:

```yaml
dependencies:
  flutter_quick_nav: ^1.0.0
```

### 2. Install it

Run either of the following commands in your terminal:


```yaml
  flutter pub get
```

### 3. Import it

```yaml
  import 'package:flutter_quick_nav/flutter_quick_nav.dart';
```

## 🧑‍💻 Usage Example

```yaml
import 'package:flutter/material.dart';
import 'package:flutter_quick_nav/flutter_quick_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_quick_nav Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FlutterQuickNav.push(context, const SecondPage());
          },
          child: const Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                FlutterQuickNav.replace(context, const FinalPage());
              },
              child: const Text('Replace with Final Page'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                FlutterQuickNav.pushAndRemoveUntil(
                  context,
                  const HomePage(),
                  untilRoute: '/home',
                );
              },
              child: const Text('Push and remove until /home'),
            ),
          ],
        ),
      ),
    );
  }
}

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Final Page')),
      body: const Center(child: Text('You made it to the final page!')),
    );
  }
}

```
## 📦 Null Safety
This package is fully null-safe and supports the latest versions of Flutter.

## 💡 Contribution
Contributions, issues, and feature requests are welcome!
Feel free to open an issue or submit a pull request.

##  License
This project is licensed under the MIT License — see the LICENSE file for details.

## 🙌 Support
If you like this package, don't forget to give it a ⭐ on GitHub and share it with others!
