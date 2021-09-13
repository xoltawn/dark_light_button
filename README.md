# dark_light_button

A Flutter package containing ready to use widgets for switching between dark and light theme.

## Installation
To install this package, add `dark_light_button` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

## Usage
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
#optional arguments:
`height` as double which indicates the height of widget,
`animationDuration` as `Duration` to control duration of animation
`options` which is class extending `DarlightOption`. this property is named after each button name,
for example, for `Darlights.DarlightThree` you must provide  `DarlightThreeOption`.
each options contain widget-specific properties like background color,etc

<h3 align="center">A passionate flutter developer from Iran</h3>

<h3 align="left">Connect with me:</h3>
<p align="left">
<a href="https://twitter.com/xoltawn" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/twitter.svg" alt="xoltawn" height="30" width="40" /></a>
<a href="https://medium.com/xoltawn" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/medium.svg" alt="xoltawn" height="30" width="40" /></a>
</p>

MIT License

Copyright (c) [2021] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
