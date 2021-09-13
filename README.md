# dark_light_button

A Flutter package containing ready to use widgets for switching between dark and light theme.

[![pub package](https://img.shields.io/pub/v/dark_light_button.svg)](https://pub.dev/packages/dark_light_button)
# Installation
To install this package, add `dark_light_button` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

# Usage
You need to use `DarlightButton` widget, and you are DONE!
```dart
  DarlightButton(    
      onChange: (ThemeMode theme) {
              // change your theme here
      },
  ),
```

You can change the widget type by using `type` property of `DarlightButton`, which takes a `Darlights` enum as argument.
there are currently 3 type of darlight buttons to use and more darlight types will be added soon. 
```dart
  DarlightButton(    
      type: Darlights.DarlightThree
      onChange: (ThemeMode theme) {
              // change your theme here
      },
  ),
```
## Optional arguments

`height` as double which indicates the height of widget<br>
`animationDuration` as `Duration` to control duration of animation<br>
`options` which is class extending `DarlightOption`. this property is named after each button name<br>
for example, for `Darlights.DarlightThree` you must provide  `DarlightThreeOption`<br>
each options contain widget-specific properties like background color,etc

## Examples
```dart
  DarlightButton(
    type: Darlights.DarlightThree,
    onChange: (ThemeMode theme) {

    },
  )
```

![darlight_one](https://user-images.githubusercontent.com/86798241/133134096-b2b2ada5-ee79-4361-9e89-05f661d589fc.gif)

<hr>

```dart
  DarlightButton(
    type: Darlights.DarlightTwo,
    onChange: (ThemeMode theme) {

    },
  )
```
![darlight_two](https://user-images.githubusercontent.com/86798241/133134185-787e8595-c165-49ee-b42a-41ce47ac3328.gif)

<hr>

```dart
  DarlightButton(
    type: Darlights.DarlightThree,
    onChange: (ThemeMode theme) {

    },
  )
```

![darlight_three](https://user-images.githubusercontent.com/86798241/133134224-5e5a9867-dedc-40a0-9185-28911c4b5b89.gif)




