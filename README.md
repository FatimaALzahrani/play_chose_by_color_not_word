# Play Color Not Word
## لعبة لاختيار اللون الصحيح وليس الكلمة لاختبار التركيز :)

https://user-images.githubusercontent.com/107775566/224488580-038c682a-ccf4-41fb-8f5e-fbf7be01b144.mp4
## المحتويات
* [شرح_لبعض_الخصائص_والدواله_المستخدمه](#شرح_لبعض_الخصائص_والدواله_المستخدمه)
* [اضافة_صوره](#اضافة_صوره)
* [الانتقال_بين_الصفحات](#الانتقال_بين_الصفحات)
* [الفرق_بين_StatefulWidget_و_StatelessWidget](#الفرق_بين_StatefulWidget_و_StatelessWidget)
* [الخلفيات](#الخلفيات)
## شرح_لبعض_الخصائص_والدواله_المستخدمه
### لاعادة ترتيب المصفوفه بشكل عشوائي نستخدم الداله shuffle
     
     ArrayName.shuffle();
### لاختيار رقم عشوائي يمثل عددصحيح بين الصفر والرقم المحدد بين الاقواس نستخدم الداله Random() مع nextInt() وهنا يكون اخر رقم  

     
     int num=Random().nextInt(2);
### لاضافة مسافة بين العناصر نستخدم SizedBox

     SizedBox(height: 16),
### لاختيار لون محدد باستخدام نظام RGB نستخدم  Color.fromARGB 
     
     Color.fromARGB(255, 255, 255, 255),
 
## اضافة_صوره
اولا ننشىء ملف assets اذا لم يكن موجود , ومن ثم اضافه الصور بداخله سواء بمجلد او بدون , ومن ثم نذهب لملف pubspec.yaml ونضيف الكود الاتي مع الانتباه للمسافات , او اذا كان موجود فقط نضيف السطر الثاني لاستدعاء صورنا , اذا كانت الصور بداخل مجلد نسوي زي السطر الثاني وهنا كان اسم المجلد color واذا لا نسوي زي السطر الثالث 

      assets:
         - assets/color/
         - assets/
        
### فيديو توضيحي اكثر
https://user-images.githubusercontent.com/107775566/224487801-06507413-7296-4289-aff0-d281bba59476.mp4

## الانتقال_بين_الصفحات
### انتقل إلى الصفحة الثانية باستخدام Navigator.push()
للذهاب إلى صفحة جديدة نستخدم Navigator.push (). تضيف push () صفحة جديدة إلى مجموعة الصفحات التي لدينا. ثم نستخدم MaterialPageRoute وهو أمر مفيد لأنه ينتقل إلى الصفحة الجديدة باستخدام الرسوم المتحركة الخاصة بمنصة معينة ونسند له الاتجاه المطلوب الذهاب له.
في QuizScreen نقوم بتحديث onPressed () ونضيف الأمر البرمجي الخاص بالنقل إلى صفحة جديدة Navigator.push():

      onPressed: () {
      Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => ResultScreen()),
      );
      }
### العودة إلى الصفحة الأولى باستخدامNavigator.pop()
كيف تغلق صفحة النتائج ونعود لصفحة الأسئلة؟ عن طريق استخدام Navigator.pop (). تزيل pop () الصفحة الحالية من مجموعة الصفحات المعروضة.
لتنفيذ العودة إلى الصفحة السابقة نقوم بتحديث onPressed () الموجود في ResultScreen ونقوم بإضافة:

      onPressed: () {
       Navigator.pop(context);
      }
 ### نقل البيانات بين الصفحات
لنقل البيانات بين الصفحة نقوم بإضافة Constructors خاص بالصفحة الثانية ResultScreen ونقوم بإضافة parameter بنوع البيانات المراد نقلها في حالتنا سوف ننقل قيم من نوع int والتي تمثل جميع الاسئله التي تم حلها والتي تم حلها بشكل صحصح والتي حلها بشكل خاطئ فنقوم بكتابة

       ResultScreen({required this.Yes,required this.No,required this.All});
       final int Yes;
       final int No;
       final int All;
وبعدها نقوم باستدعاء ResultScreen ونسند لها القيمة الخاصة بالمتغيرات all, no , yes.

       Navigator.push(
       context,
       MaterialPageRoute(
       builder: (context) =>
       ResultScreen(Yes: yes, No: no, All: all),
        ),
        );
## الفرق_بين_StatefulWidget_و_StatelessWidget
عناصر الواجهات في Flutter تكون إما StatefulWidget أو StatelessWidget، إذا كان من الممكن تغيير حالته State أو المعلومات التي يعرضها عندما يتفاعل معها المستخدم، على سبيل المثال فهي StatefulWidget.
### * تعريف StatlessWidget
هي عناصر واجهة لها حالة واحدة فقط ولا تقبل تغير الحالة أي بمعنى أنه عندما يتم استدعاء هذا العنصر فإن شكله لن يتغير حتى لو تغيرت بعض القيم التي بداخله، ويمكن إنشاء عناصر واجهة StatelessWidget خاصة بنا عن طريق إضافة extends StatelessWidget عند تعريفclass.

    
     class MyApp extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
        return MaterialApp(
        home: QuizScreen(),
        );
       }
       }
### * تعريف StatefulWidget
عناصر StatefulWidget هي عناصر واجهة تقبل إعادة البناء، يمكنه تغيير مظهره استجابةً للأحداث التي يتم إطلاقها بواسطة تفاعلات المستخدم أو عندما يتلقى البيانات، يمكننا تحويل أي StatlessWidget إلى StatefulWidget عن طريق استخدام extends وإضافة StatefulWidget.

    
     class QuizScreen extends StatefulWidget {
     QuizScreen();
     @override
      State<QuizScreen> createState() => _QuizScreenState();
      }
     class _QuizScreenState extends State<QuizScreen> {
       //...
أو يمكننا استخدام الاختصار الموجود في Android Studio "Convert to StatefulWidget"
![image](https://user-images.githubusercontent.com/107775566/224485492-7984baf2-ddbc-43ef-9ea6-57262fbedd62.png)

### متابعة الحالة State
عند تحويل Widget إلى StatefulWidget باستخدام الأداة المساعدة في Android Studio سوف يتم إنشاء class بنفس الاسم لكن مضاف عليه كلمة State وهو Widget الذي سيتم بنائه كلما تغيرت الحالات التي فيه وفي مثالنا تم إنشاء QuizScreenState_.

    
    class _QuizScreenState extends State<QuizScreen> {
    @override
    Widget build(BuildContext context) {
    return Scaffold();
    }
    }
#### إضافة قيمة لتتبع حالتها
يمكننا إضافة القيم التي يتم تتبع حالتها عن طريق إضافتها بداخل QuizScreenState_.
    
     class _QuizScreenState extends State<QuizScreen> {
     int all =0; //قيمة يتم تتبع حالتها تمثل جميع الاسئله التي تم حلها
     int yes =0; // قيمة يتم تتبع حالتها تمثل الاسئله التي تم حلها بشكل صحيح
     int no =0; // قيمة يتم تتبع حالتها تمثل الاسئله التي تم حلها بشكل خاطئ
      @override
      Widget build(BuildContext context) {
        return Scaffold();
      }
      }
#### إضافة الزر الخاص بتغيير قيم all , yes ,no
وبداخل onPressed نضيف الأمر الخاص بزيادة ١ لقيمة all عند حل اي سؤال ونضع شرط اذا كانت الاجابه صحيحه يزيد قيمة المتغير yes واذا كانت خاطئة يزيد قيمة المتغير no , عن طريق كتابة:

    
     class _QuizScreenState extends State<QuizScreen> {
      int all = 0;
      int yes = 0;
      int no = 0;
      @override
     Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           all++;
           if(color[num]==colo[i]) {
           Fluttertoast.showToast(msg: "إجابة صحيحه , أحسنت",backgroundColor: Colors.green,);
           yes++;
           }else{
           Fluttertoast.showToast(msg: "إجابة خاطئه , حاول مره أخرى",backgroundColor: Colors.redAccent,);
           no++;                      
          },
          child: Text("Counter in $counter "),
          ),
         ),
        );
       }
      }
حتى نقوم بتغيير السؤال نقوم باعاده ترتيب المصفوفتين حقت colors اللي عشان السؤال ولونه وحقت color اللي عشان الصور اللي بالخيارات فنقوم باستدعا داله تغيير الحالة setState والتي ستقوم بالتحديث في كل مره يتم الضغط مباشرة

       
        setState(() {
        colors.shuffle();
        color.shuffle();
        num=Random().nextInt(2);
        numm=Random().nextInt(2);
        });
### النتيجة النهائية

    
     class HomeScreen extends StatefulWidget {
     HomeScreen({Key? key}) : super(key: key);
    @override
    _HomeScreenState createState() => _HomeScreenState();
     }
    class _HomeScreenState extends State<HomeScreen> {
    int all = 0;
    int yes = 0;
    int no = 0;
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           all++;
           if(color[num]==colo[i]) {
           Fluttertoast.showToast(msg: "إجابة صحيحه , أحسنت",backgroundColor: Colors.green,);
           yes++;
           }else{
           Fluttertoast.showToast(msg: "إجابة خاطئه , حاول مره أخرى",backgroundColor: Colors.redAccent,);
           no++;                
           setState(() {
          colors.shuffle();
          color.shuffle();
          num=Random().nextInt(2);
          numm=Random().nextInt(2);
          });
          },
         ),
       ),
      );
     }
    }
## الخلفيات
### خلفية الاسئلة
<img width="960" alt="2023-03-11" src="https://user-images.githubusercontent.com/107775566/224488186-540dca69-002d-405d-bef7-f65ca5fa006b.png">
#### dependencies نقوم بوضع المكتبةالتاليه تحت ال  pubspec.yaml في ملف
    parallax_rain: ^1.1.0
##### ونركز على ان تكون المسافات صحيحه اذا طلع خطأ فاهي السبب لازم نتاكد منها Pupget ومن ثم نضغط في الاعلى على

#### بنستدعي المكتبه , باننا نكب التالي اعلى الصفحة .dart في الصفحة اللي ابغا اغير خلفيتها بتكون بامتداد 
    import 'package:parallax_rain/parallax_rain.dart';
#### بنكتب الكود الاتي , widget واللي بترجع لنا build بداخل داله ال
    home: Scaffold(
    // In body we have a AnimatedBackgound,
    // behavior RandomParticleBehaviour.
    body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 210, 222, 221)
          ],
        )),
    child: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: ParallaxRain(
    dropColors: [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.brown,
    Colors.blueGrey
    ],
 ##### بعد القوس نقدر نكمل كودنا بالاشياء اللي نبغا تكون بداخل الصفحة ونقدر نغير الالوان بعد
 ###### بكذا بتكون اول خلفيه جاهزه :)
 
 ### خلفية النتائج
<img width="960" alt="2023-03-11 (1)" src="https://user-images.githubusercontent.com/107775566/224488314-fa316370-55a4-4225-acfd-99bf2e954e1a.png">
#### dependencies نقوم بوضع المكتبةالتاليه تحت ال  pubspec.yaml في ملف
    animated_background: ^2.0.0
##### ونركز على ان تكون المسافات صحيحه اذا طلع خطأ فاهي السبب لازم نتاكد منها Pupget ومن ثم نضغط في الاعلى على

#### بنستدعي المكتبه , باننا نكب التالي اعلى الصفحة .dart في الصفحة اللي ابغا اغير خلفيتها بتكون بامتداد 
    import 'package:animated_background/animated_background.dart';
#### الشروط
1) StatelessWidget وليس StatefulWidget يكون يرث من كلاس 
2) مثلا , SingleTickerProviderStateMixin مع build نجعل الكلاس الذي يحتوي داله
 
        class _ResultScreenState extends State<ResultScreen>
         with SingleTickerProviderStateMixin {
#### وبعد الكود السابق مباشره , بنكتب الكود الاتي build قبل داله ال
  
    ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
    );
#### بنكتب الكود الاتي , widget واللي بترجع لنا build بداخل داله ال
  
      body: AnimatedBackground(
      behaviour:RandomParticleBehaviour(options: particles),
      vsync: this,
##### بعد القوس نقدر نكمل كودنا بالاشياء اللي نبغا تكون بداخل الصفحة ونقدر نغير الالوان بعد
###### بكذا بتكون ثاني خلفيه جاهزه :)
