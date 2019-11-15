[![Version](https://img.shields.io/cocoapods/v/Rudder-Facebook.svg?style=flat)](https://cocoapods.org/pods/Rudder-Facebook)
[![Platform](https://img.shields.io/cocoapods/p/Rudder-Facebook.svg?style=flat)](https://cocoapods.org/pods/Rudder-Facebook)

# What is Rudder?

**Short answer:** 
Rudder is an open-source Segment alternative written in Go, built for the enterprise. .

**Long answer:** 
Rudder is a platform for collecting, storing and routing customer event data to dozens of tools. Rudder is open-source, can run in your cloud environment (AWS, GCP, Azure or even your data-centre) and provides a powerful transformation framework to process your event data on the fly.

Released under [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)

## Getting Started with Facebook App Events Integration of Android SDK
1. Add [Facebook App Events](https://developers.facebook.com/docs/app-events/) as a destination in the [Dashboard](https://app.rudderlabs.com/) and define ```apiKey``` with your Facebook Application ID.

2. Follow [these](https://developers.facebook.com/docs/app-events/getting-started-app-events-ios/) instructions and setup your facebook app events application.  

3. Rudder-Facebook is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'Rudder-Facebook'
```

## Initialize ```RudderClient```
Put this code in your ```AppDelegate.m``` file under the method ```didFinishLaunchingWithOptions```
```
RudderConfigBuilder *builder = [[RudderConfigBuilder alloc] init];
[builder withEndPointUrl:YOUR_DATA_PLANE_URL];
[builder withFactory:[RudderFacebookFactory instance]];
[RudderClient getInstance:YOUR_WRITE_KEY config:[builder build]];
```

## Send Events
Follow the steps from [Rudder iOS SDK](https://github.com/rudderlabs/rudder-sdk-ios)

# Coming Soon
1. Native platform SDK integration support
2. More documentation
3. More destination support
