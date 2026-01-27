# Flutter Flavors Setup Guide

## المشكلة الحالية
Flutter لا يرى الـ schemes (Development و Production) عند التشغيل على macOS/iOS.

## الحلول الممكنة

### الحل 1: استخدام Terminal مباشرة (الأسهل)

بدلاً من استخدام Android Studio، استخدم Terminal:

```bash
# للتطوير
flutter run --flavor Development --target lib/main_development.dart -d macos

# للإنتاج
flutter run --flavor Production --target lib/main_production.dart -d macos
```

### الحل 2: فتح Xcode وتحديث الـ Schemes

1. افتح Xcode:
   ```bash
   open ios/Runner.xcworkspace
   ```

2. في Xcode:
   - اذهب إلى Product > Scheme > Manage Schemes
   - تأكد من أن الـ schemes (Development و Production) موجودة ومفعلة (Shared)
   - إذا لم تكن موجودة، أنشئها:
     - اضغط على "+" لإضافة scheme جديد
     - اختر "Runner" كـ target
     - اسم الـ scheme: "Development"
     - كرر نفس الخطوات لـ "Production"

3. في كل scheme:
   - اضغط على "Edit Scheme"
   - في "Run" action، اختر Build Configuration المناسب:
     - Development scheme → Debug-Development
     - Production scheme → Debug-Production

### الحل 3: استخدام Android بدلاً من macOS

إذا كنت تختبر على Android، استخدم:

```bash
flutter run --flavor Development --target lib/main_development.dart -d android
```

### الحل 4: التحقق من إعدادات الـ Schemes

تأكد من أن ملفات الـ schemes موجودة في:
- `ios/Runner.xcodeproj/xcshareddata/xcschemes/Development.xcscheme`
- `ios/Runner.xcodeproj/xcshareddata/xcschemes/Production.xcscheme`

## ملاحظات

- الـ schemes موجودة في المشروع لكن Flutter قد لا يراها في بعض الحالات
- الحل الأفضل هو استخدام Terminal مباشرة أو فتح Xcode وتحديث الـ schemes
- يمكنك أيضاً استخدام Android للتطوير إذا كان macOS يسبب مشاكل
