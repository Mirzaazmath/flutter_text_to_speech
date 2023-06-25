# flutter_textto_speech

A new Flutter project.

## Getting Started



# Screenshot 1

<img src="https://github.com/Mirzaazmath/flutter_text_to_speech/blob/main/assets/Screenshot1.png" height="400">

# Screenshot 2

<img src="https://github.com/Mirzaazmath/flutter_text_to_speech/blob/main/assets/Screenshot2.png" height="400">

# Screenshot 3

<img src="https://github.com/Mirzaazmath/flutter_text_to_speech/blob/main/assets/Screenshot3.png" height="400">

# Screenshot 4

<img src="https://github.com/Mirzaazmath/flutter_text_to_speech/blob/main/assets/Screenshot4.png" height="400">


# Features
* Text to Speech
* Speak back
* Gooogle Translator
* Clipborad copy
* Url Lancher


# Dependencies

* speech_to_text: ^6.1.1
* 
  avatar_glow: ^2.0.2
  
  clipboard: ^0.1.3
  
  url_launcher: ^6.1.11
  
  fluttertoast: ^8.2.2
  
  translator: ^0.1.7
  
  flutter_tts: ^3.7.0

# Setup

# Android

Androidmanifestfile 

 <queries>
        <!-- If your app opens https URLs -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="https" />
        </intent>
        <!-- If your app makes calls -->
        <intent>
            <action android:name="android.intent.action.DIAL" />
            <data android:scheme="tel" />
        </intent>
        <!-- If your app emails -->
        <intent>
            <action android:name="android.intent.action.SEND" />
            <data android:mimeType="*/*" />
        </intent>
    </queries>

    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.BLUETOOTH"/>
    <uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT"/>
     <queries>
        <intent>
            <action android:name="android.speech.RecognitionService"/>
        </intent>
      </queries>


# IOS
<array>
      <string>https</string>
      <string>http</string>
    </array>


    <key>NSSpeechRecognitionUsageDescription</key>
	<string>Speech Reorganization is Required</string>
	<key>NSMicrophoneUsageDescription</key>
    	<string>Microphone is needed to record</string>



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
