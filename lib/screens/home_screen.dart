import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_textto_speech/speech_api/speech_api.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';
import '../utils/launcher_utils.dart';
import '../utils/toast_utils.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// displaytext is  to display the text  to user at first and we change it whenever we listen to new value
  String displaytext="Press the button and Start speaking";
  /// this bool is help us to checking this listening state and display orb gig
  bool islistening=false;
  /// this bool help us to display loading  while translating
  bool istranlating=false;
/// creating the instance of FlutterTts
  /// this helps us to use speaker to speak the text
  /// this comes with package(FlutterTts)
  FlutterTts fluttertts=FlutterTts();
  /// creating the instance of GoogleTranslator this helps us to translate the text
  /// this come with package (GoogleTranslator)
  GoogleTranslator translator=GoogleTranslator();
  /// this string act as translateion code in which language we want to translate our text
  /// we set it as English as initial
  String code="en-US";
  /// list of List Of languages  that we are going to translate our text
 final  List<String> _languages = ["English",
      "Russian",
    "French",
    "Chinese",
    "Hindi",
   "Germam",
   "Italain",
   "Spanish",
   "Japanese"

  ];
 /// selectedlanguage to translate our text
 String selectedlanguage="English";

///list of List Of languageCodes  that we are going to translate our text
 final  List<String> _languagesCode = [
    'en',
    'ru',
    'fr',
    'zh-cn',
    'hi',
    'de',
    'it',
    'es',
    'ja'
  ];
 /// This Method is used to translate the text
  Future translate() async {
    /// Create a String varaible to store our translate text
   String translatedText = "";
   /// we are using istranlating bool because it is an async method
   /// this bool helps us to display loader while we translating
    setState(() {
      istranlating = true;
    });
/// this where all translation happend
   /// Translation from package (translator)
   /// .translator method take to parameters first the text and second language code
   /// translate("Hello World", to: "en");
      Translation translation = await translator.translate(displaytext, to: code);
      translatedText = translation.text;

    setState(() {
      /// here we are changing the displaytext with translatedText
      displaytext = translatedText;
      istranlating = false;
     print(displaytext);
    });
  }

  /// The method helps our app to speck back
  Future speak(String languageCode, String text) async {
    ///this for language with want our app to speak
    await fluttertts.setLanguage(languageCode);
    ///this for pitch frequency
    await fluttertts.setPitch(1);
    ///this for sound of speacker
    await fluttertts.setVolume(1);
    ///this for speaker speaking speed
    await fluttertts.setSpeechRate(0.4);
    /// this helps to speak
    await fluttertts.speak(text);
    /// Note : All value should be 0.0 to 1
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /// backgroundColor == black
      backgroundColor: Colors.black,

      /// App bar Section
      appBar: AppBar(
        /// When this IconButton press we call speak ,method
        leading: IconButton(
          icon:const  Icon(Icons.campaign),
          onPressed: (){
            /// checking if  the text is empty or not
          if (displaytext.isNotEmpty) {
            /// Calling speak method with languae code and text
           speak(code, displaytext);
          }
        },

        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title:  Text(selectedlanguage),
        actions: [

          /// this IconButton is used to copy the text
          IconButton(onPressed: ()async{
            /// to copy the text we usen
            await FlutterClipboard.copy(displaytext).then((value){

              showToast();

            });

          }, icon:const  Icon(Icons.content_copy)),

          PopupMenuButton<String>(
            icon:const  Icon(Icons.translate),
          initialValue: _languages[0],
          onSelected: (value) {
          final   index=int.parse(value);

          setState(() {
          selectedlanguage = _languages[index];
          code=_languagesCode[index];
          translate();
          });
          },
          itemBuilder: (context)=>[
            for(int i=0;i<_languages.length;i++)...[
               PopupMenuItem<String>(
              value: i.toString(),
              child: Text(_languages[i].toString()),
            ),]


    ]

    )



        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.all(20).copyWith(bottom: 150),
        child: istranlating? const Center(
          child: CircularProgressIndicator(),
        ):
        Text(displaytext,style:const  TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w400),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75,
        animate: islistening,

        glowColor: Theme.of(context).primaryColor,
        child:islistening?Image.asset("assets/orb.gif"):
        Container(
          decoration:const BoxDecoration(
            shape: BoxShape.circle,

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:  Alignment.bottomRight,
              colors: [
                Color(0xff5464e0),
                Color(0xff3501d6),


              ]
            )

          ),
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.mic),
            onPressed: toggleRecording

          ),
        ),
      ),

    );
  }

  Future toggleRecording()=>
       SpeechAPI.toggleRecording(

    onlistening: (islistening){
      selectedlanguage=_languages[0];
      code=_languagesCode[0];
      setState(()=> this.islistening=islistening);
      },
      onResult: (text){

    setState(() {
      displaytext=text;
    });

    if (!islistening) {

      Future.delayed(Duration(seconds: 1), () {
        Utils.scanText(text);
      });
    }


  });
}
