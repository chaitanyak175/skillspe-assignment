import 'package:flutter/material.dart';

const Color spThemeColor = Color(0xFF7E56DA);
const Color spGrey = Color(0xFF3F3F3F);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyActivityScreen(),
    );
  }
}

class MyActivityScreen extends StatefulWidget {
  @override
  _MyActivityScreenState createState() => _MyActivityScreenState();
}

class _MyActivityScreenState extends State<MyActivityScreen> {
  bool isLiveEventsSelected = true;
  bool isTotalReturnsSelected = true;

  void _toggleButton(bool isSelected) {
    setState(() {
      isLiveEventsSelected = isSelected;
    });
  }

  void _toggleTotalButton(bool isSelected) {
    setState(() {
      isTotalReturnsSelected = isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Activity'),
        leading: Icon(Icons.arrow_back),
        actions: [
          Icon(Icons.share),
          SizedBox(width: 16),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 360, // Combined width
              height: 183, // Combined height
              child: Row(
                children: [
                  _buildInfoCard(
                    'Total Returns',
                    '₹2000.34',
                    spThemeColor,
                    isTotalReturnsSelected,
                    () {
                      _toggleTotalButton(true);
                    },
                    context,
                  ),
                  _buildInfoCard(
                    'Total Invested',
                    '₹2000.34',
                    Colors.white,
                    !isTotalReturnsSelected,
                    () {
                      _toggleTotalButton(false);
                    },
                    context,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey, fontSize: 10),
                children: [
                  TextSpan(
                    text: 'Quick Tip: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: spGrey,
                    ),
                  ),
                  TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet consectetur. Lorem graa volutpat dui sollicitudin sociis feugiat diam to dui sollicitudin.',
                      style: TextStyle(fontWeight: FontWeight.w300))
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildToggleButton('Live Events', isLiveEventsSelected, () {
                      _toggleButton(true);
                    }),
                    _buildToggleButton('Closed Events', !isLiveEventsSelected,
                        () {
                      _toggleButton(false);
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Challenge Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Average',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      '| Total Returns',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          _buildChallengeCard(),
                          SizedBox(height: 12), // Space between cards
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String amount, Color bgColor,
      bool isSelected, VoidCallback onTap, BuildContext context,
      {Color textColor = Colors.white}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: isSelected ? bgColor : Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey, // Border color
              width: 1, // Border width
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoCardTitle(title, textColor, isSelected),
              SizedBox(height: 24),
              _buildInfoCardAmount(amount, textColor, isSelected),
              SizedBox(height: 24),
              _buildInfoCardDate('June 30 - Today', textColor, isSelected),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCardTitle(String title, Color textColor, bool isSelected) {
    return Text(
      title,
      style: TextStyle(
        color: isSelected ? textColor : Colors.black,
        fontSize: 16,
      ),
    );
  }

  Widget _buildInfoCardAmount(String amount, Color textColor, bool isSelected) {
    return Text(
      amount,
      style: TextStyle(
        color: isSelected ? textColor : Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInfoCardDate(String date, Color textColor, bool isSelected) {
    return Text(
      date,
      style: TextStyle(
        color: (isSelected ? textColor : Colors.black).withOpacity(0.6),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 279,
          padding: EdgeInsets.only(
            top: 18.0, // padding for the top
            bottom: 16.0, // padding for the bottom
            left: 19.0, // padding for the left
            right: 16.0, // padding for the right
          ),
          decoration: BoxDecoration(
            color: isSelected ? spThemeColor : Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: isSelected ? Colors.white : spThemeColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChallengeCard() {
    return Container(
      width: 304, // Width of the challenge card
      height: 69, // Height of the challenge card
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: spThemeColor,
            child: Text(
              '😎',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lorem ipsum dolor amet, consectetur...',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 1),
                Text(
                  'Qty: 20 | Invest: ₹20',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '₹2.78',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                '+ ₹200',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
