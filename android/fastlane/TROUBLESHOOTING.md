# Fastlane Firebase App Distribution - Troubleshooting

## المشكلة: "Invalid request" عند توزيع APK

### ما تم إصلاحه:

1. ✅ **مسار الـ APK**: تم تحديثه من:
   ```
   ../build/app/outputs/flutter-apk/app-production-release.apk
   ```
   إلى:
   ```
   ../build/app/outputs/apk/Production/release/app-Production-release.apk
   ```

2. ✅ **اسم الـ Flavor**: تم تغييره من `production` إلى `Production` (بحرف كبير)

### إذا استمرت المشكلة "Invalid request":

#### 1. التحقق من الـ App ID في Firebase Console

1. افتح [Firebase Console](https://console.firebase.google.com/)
2. اختر مشروعك: `flutter-app-distrubution-d0e60`
3. اذهب إلى **Project Settings** > **Your apps**
4. تأكد من أن الـ App ID يطابق:
   - **Package name**: `com.example.advance_flutter_project`
   - **App ID**: `1:477151765286:android:867d46fd3694e74aaed7e7`

#### 2. التحقق من الصلاحيات

تأكد من أن:
- حساب Firebase لديه صلاحيات Firebase App Distribution
- الـ service account لديه الصلاحيات المطلوبة

#### 3. تحديث Firebase CLI Token

الـ token في Fastfile قد يكون منتهي الصلاحية. لتحديثه:

```bash
firebase login:ci
```

ثم استبدل الـ token في Fastfile.

#### 4. التحقق من الـ Groups

تأكد من أن الـ groups موجودة في Firebase:
- `qa-team`
- `trusted-testers`

يمكنك التحقق من ذلك في Firebase Console > App Distribution > Testers & Groups

#### 5. استخدام App ID بدلاً من Package Name

جرب استخدام package name مباشرة بدلاً من app ID:

```ruby
firebase_app_distribution(
  app: "com.example.advance_flutter_project",  # بدلاً من app ID
  # ... باقي الإعدادات
)
```

#### 6. التحقق من مسار الـ APK

تأكد من أن الـ APK موجود في المسار المحدد:

```bash
ls -la ../build/app/outputs/apk/Production/release/app-Production-release.apk
```

#### 7. استخدام مسار مطلق

جرب استخدام مسار مطلق:

```ruby
android_artifact_path: File.expand_path("../../build/app/outputs/apk/Production/release/app-Production-release.apk", __FILE__)
```

### معلومات مفيدة:

- **Package name (Production)**: `com.example.advance_flutter_project`
- **Package name (Development)**: `com.example.advance_flutter_project.dev`
- **App ID**: `1:477151765286:android:867d46fd3694e74aaed7e7`
- **Project ID**: `flutter-app-distrubution-d0e60`

### تشغيل Fastlane:

```bash
cd android
fastlane firebase_distribution
```
