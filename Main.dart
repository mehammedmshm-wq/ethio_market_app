import 'package:flutter/material.dart';

void main() {
  runApp(const EthioMarketingApp());
}

class EthioMarketingApp extends StatelessWidget {
  const EthioMarketingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ethio Marketing, Business & Tourism',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // የ 14ቱ የኢትዮጵያ ክልሎች እና ከተማ አስተዳደሮች ዝርዝር
  final List<Map<String, String>> regions = const [
    {'name': 'አዲስ አበባ', 'desc': 'የአፍሪካ ዲፕሎማሲ ማዕከል እና የብዝሃ-ባህል መኖሪያ'},
    {'name': 'ድሬዳዋ', 'desc': 'ታሪካዊቷ የንግድና የባህል ከተማ'},
    {'name': 'ኦሮሚያ', 'desc': 'የገዳ ሲስተም፣ ሰፊ ለም መሬት እና የቡና መፍለቂያ'},
    {'name': 'አማራ', 'desc': 'የፋሲለደስ ግንብ፣ ላሊበላ እና ታሪካዊ ቅርሶች'},
    {'name': 'ትግራይ', 'desc': 'የአክሱም ሐውልቶች እና ጥንታዊ ድንቅ ስራዎች'},
    {'name': 'ሶማሌ', 'desc': 'ሰፊ በረሃዎች፣ ግመሎች እና ባህላዊ የእጅ ስራዎች'},
    {'name': 'አፋር', 'desc': 'የሉሲ መገኛ፣ የኤርታ አሌ እሳተ ገሞራ እና ጨው ንግድ'},
    {'name': 'ደቡብ ኢትዮጵያ', 'desc': 'በርካታ ብሔር ብሔረሰቦች እና ልዩ ባህላዊ መገለጫዎች'},
    {'name': 'ማዕከላዊ ኢትዮጵያ', 'desc': 'የጉራጌ፣ ሀዲያ፣ ሲዳማ እና አጎራባች ህዝቦች መስተንግዶ'},
    {'name': 'ሲዳማ', 'desc': 'የእንሰት ምርት፣ የጫምባ ባህል እና የለም መሬት'},
    {'name': 'ደቡብ ምዕራብ ኢትዮጵያ', 'desc': 'የካፋ የቡና መገኛ እና የበለጸገ የደን ሀብት'},
    {'name': 'ጋምቤላ', 'desc': 'ለስላሳ ሜዳዎች፣ ባሮ ወንዝ እና ልዩ ባህላዊ ዳንሶች'},
    {'name': 'ቤንሻንጉል ጉሙዝ', 'desc': 'የሰላም እና የባህል ብዝሃነት መገኛ'},
    {'name': 'ሐረር', 'desc': 'ታሪካዊቷ ጁጉል ግንብ፣ የድብ መመገቢያ እና የሀሪ ባህል'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ethio Marketing & Tourism',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: Colors.teal[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: regions.length,
          itemBuilder: (context, index) {
            final region = regions[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal[100],
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.teal[900], fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  region['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text(
                  region['desc']!,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.teal),
                onTap: () {
                  // ተጠቃሚው የመረጠውን ክልል ስም ይዞ ወደ ገበያ ቦታ ገጽ ይሸጋገራል
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MarketplaceScreen(regionName: region['name']!),
                    ),
                  );
                },

                  // እዚህጋር ተጠቃሚው ክልሉን ሲነካ ወደዚያ ክልል ምርቶች (class MarketplaceScreen extends StatelessWidget {
  final String regionName;
  const MarketplaceScreen({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('የገበያ ማዕከል - $regionName',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.teal[800],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'የ $regionName ምርቶች እና አገልግሎቶች (በ USD \$)',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: const [
                  Card(
                    child: ListTile(
                      title: Text('ባህላዊ አልባሳት እና ሸማ'),
                      subtitle: Text('ዋጋ: \$45.00 USD'),
                      trailing: Icon(Icons.shopping_cart, color: Colors.teal),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('የእጅ ስራ ቅርጫት እና ጌጣጌጥ'),
                      subtitle: Text('ዋጋ: \$20.00 USD'),
                      trailing: Icon(Icons.shopping_cart, color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
class PaymentScreen extends StatelessWidget {
  final String productName;
  final String productPrice;

  const PaymentScreen({super.key, required this.productName, required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('የክፍያ ማዕከል (Checkout)',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.teal[800],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'የተመረጠው እቃ: $productName',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'የክፍያ መጠን: $productPrice',
              style: const TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            const Text(
              'የክፍያ አማራጭ ይምረጡ:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone_android, color: Colors.orange),
                title: const Text('በቴሌብር (Telebirr) ይክፈሉ'),
                subtitle: const Text('ለሀገር ውስጥ ገዢዎች'),
                onTap: () {
                  // የቴሌብር ክፍያ ማስተላለፊያ
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.credit_card, color: Colors.blue),
                title: const Text('በአለም አቀፍ ካርድ (Credit/Debit Card)'),
                subtitle: const Text('ለዲያስፖራ እና ዓለም አቀፍ ገዢዎች (USD)'),
                onTap: () {
                  // የካርድ ክፍያ ማስተላለፊያ
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

) የሚወስድ ኮድ ይገባል
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
