# dark_light_button

A Flutter package containing ready to use widgets for switching between dark and light theme.

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
```
DarlightButton(
  type: Darlights.DarlightThree,
  onChange: (ThemeMode theme) {
              
  },
)
```

![Alt text](./darlight_one.gif?raw=true "Title")
<hr>

```
DarlightButton(
  type: Darlights.DarlightTwo,
  onChange: (ThemeMode theme) {
              
  },
)
```
![Alt text](./darlight_two.gif?raw=true "Title")

<hr>

```
DarlightButton(
  type: Darlights.DarlightThree,
  onChange: (ThemeMode theme) {
              
  },
)
```

![Alt text](./darlight_three.gif?raw=true "Title")



