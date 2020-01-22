# react-native-countdown-picker

A wrapper on top of [ActionSheetPicker-3.0](https://github.com/skywinder/ActionSheetPicker-3.0) for displaying countdown timer in an actionsheet

### Installation

```bash
npm i --save react-native-countdown-picker
or
yarn add react-native-countdown-picker
```
### For React-Native versions >= 0.60

Just run `pod install --project-directory=./ios` and you're done with installation.

### For Older React-Native versions

#### Add pod dependency

You need CocoaPods to install `ActionSheetPicker-3.0`.
To integrate ActionSheetPicker-3.0 into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'ActionSheetPicker-3.0'
```

Then, run the following command:

```bash
$ pod install
```


#### Add it to your iOS project


1. Open your project in XCode, right click on `Libraries` and click `Add
   Files to "Your Project Name"` [(Screenshot)](http://url.brentvatne.ca/jQp8) then [(Screenshot)](http://url.brentvatne.ca/1gqUD).
3. Add `libCJCountDownPicker.a` to `Build Phases -> Link Binary With Libraries`
   [(Screenshot)](http://url.brentvatne.ca/17Xfe).
4. Whenever you want to use it within React code now you can: `var CountDownPicker = require('NativeModules').CountDownPicker;`


## Example (for RN versions >= 0.60)
```javascript
import  { Image, NativeModules, TouchableHighlight, View } from 'react-native'
const { CJCountDownPicker } = NativeModules;

var ExampleApp = React.createClass({
  showPicker: function() {
    CJCountDownPicker.showCountDownPickerWithOptions({
      title: 'show', //optional
      countDownDuration: '' //optional intial time
    }, (cancelled, duration) => {
        if(cancelled) {
          AlertIOS.alert('Error', 'select a time');
        }
        //duration is in seconds.
    });
  },
  render: function() {
    return (
      <TouchableHighlight
            onPress={this.showPicker}
            underlayColor="#f7f7f7">
          <View style={styles.container}>
          <Image source={require('image!announcement')} style={styles.image} />
          </View>
      </TouchableHighlight>
    );
  }
});
```
