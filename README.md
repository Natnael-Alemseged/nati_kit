# Nati Kit 🚀

A robust Flutter UI toolkit with production-ready components, theming, and utilities.

Built by **Natnael Alemseged** for rapid Flutter app development.

## Features

### 🎨 UI Components

- **NatiAppBar** - Customizable app bar with flexible height, colors, and actions
- **AppButton** - All-purpose button (solid, outline, loading, disabled states)
- **InputField** - Robust form input with validation, password toggle, formatters
- **Toast System** - Rich notifications with haptic feedback

### 🛠️ Utilities

- **HapticService** - Centralized haptic feedback (success, warning, error patterns)

### 🎭 Theming

- **AppTheme** - Material 3 theme with consistent styling
- **AppColors** - Standardized color palette

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  nati_kit:
    path: ../nati_kit # For local development
    # OR from pub.dev (after publishing):
    # nati_kit: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Quick Start

### Import the package

```dart
import 'package:nati_kit/nati_kit.dart';
```

### Use Components

#### App Bar

```dart
Scaffold(
  appBar: NatiAppBar(
    title: "My App",
    height: 80,
    backgroundColor: kcPrimaryColor,
    actions: [
      IconButton(icon: Icon(Icons.settings), onPressed: () {}),
    ],
  ),
)
```

#### Button

```dart
AppButton(
  text: "Submit",
  onPressed: () {},
  // Optional customization:
  outline: true,
  isBusy: false,
  icon: Icon(Icons.send),
)
```

#### Input Field

```dart
InputField(
  controller: emailController,
  label: "Email",
  hintText: "Enter your email",
  keyboardType: TextInputType.emailAddress,
  validator: (value) => value?.isEmpty ?? true ? "Required" : null,
)
```

#### Toast Notifications

```dart
showToast(
  context: context,
  message: "Success!",
  type: ToastType.success,
  withHaptics: true,
);
```

#### Haptic Feedback

```dart
// Initialize once in main()
await HapticService.init();

// Use anywhere
HapticService.success();
HapticService.error();
HapticService.light();
```

### Apply Theme

```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  // ... rest of your app
)
```

## Components Reference

### NatiAppBar

| Property        | Type           | Default        | Description          |
| --------------- | -------------- | -------------- | -------------------- |
| title           | String?        | null           | App bar title        |
| titleWidget     | Widget?        | null           | Custom title widget  |
| onBack          | VoidCallback?  | null           | Back button callback |
| actions         | List<Widget>?  | null           | Action widgets       |
| backgroundColor | Color          | kcPrimaryColor | Background color     |
| foregroundColor | Color          | kcWhite        | Text/icon color      |
| showBackArrow   | bool           | true           | Show back button     |
| elevation       | double         | 0              | Shadow elevation     |
| centerTitle     | bool           | true           | Center the title     |
| height          | double         | kToolbarHeight | Custom height        |
| titleTextStyle  | TextStyle?     | null           | Custom title style   |
| iconTheme       | IconThemeData? | null           | Custom icon theme    |

### AppButton

| Property        | Type          | Default        | Description          |
| --------------- | ------------- | -------------- | -------------------- |
| text            | String        | required       | Button text          |
| onPressed       | VoidCallback? | null           | Tap callback         |
| isBusy          | bool          | false          | Show loading spinner |
| disabled        | bool          | false          | Disable button       |
| outline         | bool          | false          | Outline style        |
| backgroundColor | Color?        | kcPrimaryColor | Background color     |
| textColor       | Color?        | auto           | Text color           |
| height          | double        | 56             | Button height        |
| width           | double?       | full width     | Button width         |
| borderRadius    | double        | 12             | Corner radius        |
| icon            | Widget?       | null           | Leading icon         |

### InputField

| Property     | Type                  | Default  | Description         |
| ------------ | --------------------- | -------- | ------------------- |
| controller   | TextEditingController | required | Text controller     |
| hintText     | String                | required | Placeholder text    |
| label        | String?               | null     | Field label         |
| isPassword   | bool                  | false    | Password field      |
| readOnly     | bool                  | false    | Read-only mode      |
| keyboardType | TextInputType         | text     | Keyboard type       |
| validator    | FormFieldValidator?   | null     | Validation function |
| onChanged    | ValueChanged?         | null     | Change callback     |
| prefixIcon   | Widget?               | null     | Leading icon        |
| suffixIcon   | Widget?               | null     | Trailing icon       |
| maxLines     | int?                  | 1        | Max lines           |
| showLabel    | bool                  | true     | Show label          |

## Color Palette

```dart
kcPrimaryColor       // Main brand color
kcPrimaryColorDark   // Dark variant
kcLightGrey          // Light grey
kcMediumGrey         // Medium grey
kcDarkGrey           // Dark grey
kcVeryLightGrey      // Very light grey
kcWhite              // White
kcBlack              // Black
kcRed                // Error/danger
kcGreen              // Success
```

## Customization

### Override Theme Colors

```dart
// In your app's theme
ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: kcPrimaryColor, // Use nati_kit colors
    // ... customize as needed
  ),
)
```

### Extend Components

```dart
class MyCustomButton extends AppButton {
  MyCustomButton({required String text})
      : super(
          text: text,
          backgroundColor: Colors.blue,
          borderRadius: 20,
        );
}
```

## Best Practices

1. **Initialize HapticService** in `main()` before `runApp()`
2. **Use consistent colors** from `AppColors` throughout your app
3. **Apply AppTheme** to MaterialApp for global consistency
4. **Wrap forms** with `Form` widget when using `InputField` validation
5. **Handle loading states** with `AppButton.isBusy` during async operations

## Examples

See the `/example` folder for complete usage examples.

## Contributing

This is a personal toolkit, but suggestions are welcome!

## License

MIT License - feel free to use in your projects!

## Author

**Natnael Alemseged**

- GitHub: [@Natnael-Alemseged](https://github.com/Natnael-Alemseged)

---

Built with ❤️ for the Flutter community
