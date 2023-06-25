import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart' ;

///here we are create this class for converting specch to text
class SpeechAPI{
  /// created an instance of SpeechToText() comes with package (text_to_speech)
  static final _speech=SpeechToText();
/// here we are recording method to record the specch
  static Future<bool>toggleRecording({
    /// this method is for final result
    required Function(String text) onResult,
    /// we create this method to change the listing state
    required ValueChanged<bool>onlistening,
  })async{
    /// we are checking if our app listening we stop listening after 5 sec
    if(_speech.isListening){
      _speech.stop();
      return true;
    }
/// this line return true if the _speech object is currently listening or not
    final isAvailable=await  _speech.initialize(
      onStatus: (status){
        onlistening(_speech.isListening);
      },

        /// for error handling
        onError: (e){
      print("Error===$e");

    });
    /// if it is in listening state we listen and convert it to text
    if(isAvailable){
      _speech.listen(
        onResult: (value)=>onResult(value.recognizedWords));
    }
    return isAvailable;
  }

}