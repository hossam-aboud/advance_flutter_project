# advance_flutter_project

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## CI/CD Setup - Running Different Flavors

This project supports multiple build flavors for CI/CD (Continuous Integration / Continuous Deployment):

- **Development**: For development and testing
- **Production**: For production releases

### How to Run the App

#### Method 1: Using VS Code / Cursor Launch Configurations (Recommended)

1. Open the project in VS Code or Cursor
2. Go to the Run and Debug panel (F5 or Cmd+Shift+D)
3. Select one of the following configurations from the dropdown:
   - **DocDoc Development** - Runs the development flavor
   - **DocDoc Production** - Runs the production flavor
4. Click the Run button or press F5

#### Method 2: Using Terminal Commands

**For Development:**
```bash
flutter run --flavor Development --target lib/main_development.dart
```

**For Production:**
```bash
flutter run --flavor Production --target lib/main_production.dart
```

#### Method 3: Building APK/IPA

**Build Development APK:**
```bash
flutter build apk --flavor Development --target lib/main_development.dart
```

**Build Production APK:**
```bash
flutter build apk --flavor Production --target lib/main_production.dart
```

**Build iOS (Development):**
```bash
flutter build ios --flavor Development --target lib/main_development.dart
```

**Build iOS (Production):**
```bash
flutter build ios --flavor Production --target lib/main_production.dart
```

### Project Structure

- `lib/main_development.dart` - Entry point for Development flavor
- `lib/main_production.dart` - Entry point for Production flavor
- `.vscode/launch.json` - VS Code launch configurations
- `android/app/build.gradle.kts` - Android flavor configurations
- `ios/Runner.xcodeproj` - iOS scheme configurations

### Notes

- Development flavor uses application ID suffix `.dev` (e.g., `com.example.advance_flutter_project.dev`)
- Production flavor uses the base application ID (e.g., `com.example.advance_flutter_project`)
- Both flavors can be installed simultaneously on the same device since they have different application IDs
