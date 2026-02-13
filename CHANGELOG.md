# Changelog

All notable changes to the Nati Kit package will be documented in this file.

## [1.0.1] - 2026-02-13

### Fixed

- Improved package metadata with repository links.
- Removed unused/broken boilerplate test file.

## [1.0.0] - 2026-02-13

### Added

- Initial release of Nati Kit 🎉
- **NatiAppBar**: Customizable app bar component
  - Flexible height, colors, and styling
  - Custom title widgets and actions
  - Built-in back button handling
- **AppButton**: All-purpose button component
  - Solid and outline styles
  - Loading states with spinner
  - Disabled state handling
  - Icon support
  - Custom colors and sizing
- **InputField**: Robust form input component
  - Password visibility toggle
  - Validation support
  - Custom formatters
  - Prefix/suffix icons
  - Flexible styling options
- **Toast System**: Rich notification system
  - Success, Error, Warning, Info types
  - Haptic feedback integration
  - Customizable duration and position
- **HapticService**: Centralized haptic feedback
  - Success, warning, error patterns
  - Light, medium, heavy impacts
  - Fallback support for unsupported devices
- **AppTheme**: Material 3 theme system
  - Consistent styling across components
  - Customizable color scheme
- **AppColors**: Standardized color palette
  - Primary, secondary, and utility colors
  - Consistent naming with `kc` prefix

### Dependencies

- flutter_vibrate: ^1.4.0
- delightful_toast: ^1.1.0

### Notes

- Requires Flutter SDK >=3.24.0
- Supports Material 3
- Production-ready components
- Comprehensive documentation included
