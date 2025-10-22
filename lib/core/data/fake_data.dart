import 'dart:math';
import 'package:couch_social_app/features/profile/domain/entities/app_user.dart';
import 'package:couch_social_app/features/wall/domain/entities/app_post.dart';

class FakeData {
  static const String loggedUserId = '1';
  final Random _random = Random();

  Future<AppUser> user() async {
    await Future.delayed(const Duration(seconds: 1));

    // Randomly throw an exception (50% chance)
    if (_random.nextDouble() < 0.5) {
      throw Exception('Simulated random error');
    }

    return AppUser(
      id: '1',
      firstName: 'Tomas',
      lastName: 'Baran',
      imageUrl: 'https://nexume.vercel.app/profile_img.png',
      gender: 'male',
    );
  }

  Future<List<AppUser>> friends() async {
    await Future.delayed(const Duration(seconds: 2));

    // Random names with gender indicators
    final List<Map<String, String>> nameData = [
      {'firstName': 'Emma', 'lastName': 'Johnson', 'gender': 'female'},
      {'firstName': 'Liam', 'lastName': 'Smith', 'gender': 'male'},
      {'firstName': 'Sophia', 'lastName': 'Williams', 'gender': 'female'},
      {'firstName': 'Noah', 'lastName': 'Brown', 'gender': 'male'},
      {'firstName': 'Olivia', 'lastName': 'Jones', 'gender': 'female'},
      {'firstName': 'William', 'lastName': 'Garcia', 'gender': 'male'},
      {'firstName': 'Ava', 'lastName': 'Miller', 'gender': 'female'},
      {'firstName': 'James', 'lastName': 'Davis', 'gender': 'male'},
      {'firstName': 'Isabella', 'lastName': 'Rodriguez', 'gender': 'female'},
    ];

    return nameData.asMap().entries.map((entry) {
      final index = entry.key;
      final data = entry.value;
      final id = (index + 2).toString(); // IDs 2-10

      // Select appropriate profile image based on gender
      final imageUrl = data['gender'] == 'female'
          ? 'https://randomuser.me/api/portraits/women/${(index % 50) + 1}.jpg'
          : 'https://randomuser.me/api/portraits/men/${(index % 50) + 1}.jpg';

      return AppUser(
        id: id,
        firstName: data['firstName']!,
        lastName: data['lastName']!,
        imageUrl: imageUrl,
        gender: data['gender']!,
      );
    }).toList();
  }

  Future<List<AppPost>> posts() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      AppPost(
        id: '1',
        content:
            'Just had an amazing day exploring the city! The weather was perfect for a long walk through the downtown area. I discovered this incredible little coffee shop tucked away in a quiet alley. The barista was so friendly and made the most delicious cappuccino I\'ve ever had. The atmosphere was cozy with vintage furniture and soft jazz playing in the background. I ended up spending three hours there, reading a book and people-watching. Sometimes the best moments in life are the unexpected ones that happen when you least expect them. I\'m definitely going back there tomorrow!',
        authorId: '3',
        createdAt: DateTime(2025, 10, 21, 14, 30),
      ),
      AppPost(
        id: '2',
        content:
            'Working on this new project has been such an incredible journey! I\'ve learned so much about modern development practices and the latest technologies. The team collaboration has been amazing - everyone brings such unique perspectives and skills to the table. We\'ve been working late nights and early mornings, but the passion everyone has for creating something meaningful makes it all worthwhile. The challenges we\'ve faced have only made us stronger as a team. I can\'t wait to see what we\'ll accomplish next!',
        authorId: '7',
        createdAt: DateTime(2025, 10, 20, 9, 15),
      ),
      AppPost(
        id: '3',
        content:
            'Just finished reading this incredible book that completely changed me!',
        authorId: '5',
        createdAt: DateTime(2025, 10, 3, 16, 45),
      ),
      AppPost(
        id: '4',
        content:
            'Today I tried cooking a new recipe for the first time and it turned out absolutely delicious! I\'ve been wanting to learn more about Mediterranean cuisine, so I decided to make homemade pasta with fresh herbs and vegetables from the local farmers market. The process was more time-consuming than I expected, but the end result was worth every minute. The flavors were so rich and authentic, it felt like I was dining in a restaurant in Italy. My family couldn\'t stop complimenting the dish, and I\'m already planning to try more recipes from this cuisine!',
        authorId: '2',
        createdAt: DateTime(2025, 9, 28, 19, 20),
      ),
      AppPost(
        id: '5',
        content:
            'Just got back from an incredible hiking trip in the mountains! The trail was challenging but the views were absolutely breathtaking. We started early in the morning and reached the summit just as the sun was rising, painting the sky in the most beautiful shades of orange and pink. The fresh mountain air was so invigorating, and I felt completely reconnected with nature. We spotted some amazing wildlife along the way, including a family of deer and several species of birds I\'d never seen before. These moments remind me why I love spending time outdoors so much!',
        authorId: '8',
        createdAt: DateTime(2025, 9, 25, 6, 45),
      ),
      AppPost(
        id: '6',
        content:
            'Attended an amazing concert last night and I\'m still buzzing with excitement! The artist\'s performance was absolutely electrifying, and the energy in the venue was incredible. The way they connected with the audience and shared their stories between songs made the whole experience so personal and intimate. The lighting and sound production were top-notch, creating this magical atmosphere that had everyone dancing and singing along. I\'ve been to many concerts, but this one will definitely be remembered as one of the best. Music truly has the power to bring people together!',
        authorId: '4',
        createdAt: DateTime(2025, 9, 22, 23, 30),
      ),
      AppPost(
        id: '7',
        content:
            'Started learning a new language this week and I\'m already falling in love with the process! There\'s something so rewarding about being able to understand and communicate in a different tongue. I\'ve been practicing daily with various apps and online resources, and I\'m amazed at how quickly I\'m picking up the basics. The cultural insights that come with learning a language are fascinating too - it\'s like opening a window to a whole new world. I can\'t wait to have my first real conversation with a native speaker!',
        authorId: '6',
        createdAt: DateTime(2025, 9, 18, 10, 15),
      ),
      AppPost(
        id: '8',
        content:
            'Had the most relaxing weekend at the beach with my closest friends! We rented a cozy beach house and spent three days just enjoying each other\'s company. The weather was perfect for swimming, beach volleyball, and long walks along the shore at sunset. We cooked amazing meals together, played board games, and had deep conversations that lasted well into the night. These are the moments that create the strongest bonds and memories that will last a lifetime. Sometimes you just need to slow down and appreciate the simple pleasures in life!',
        authorId: '9',
        createdAt: DateTime(2025, 9, 15, 17, 45),
      ),
      AppPost(
        id: '9',
        content:
            'Just completed my first marathon and I\'m still processing the incredible experience! The training was intense and challenging, but crossing that finish line was one of the most rewarding moments of my life. The support from fellow runners and spectators along the route was overwhelming - strangers cheering for each other created this amazing sense of community. My legs are sore and I\'m exhausted, but I feel so proud of what I accomplished. This journey taught me that with dedication and perseverance, we can achieve things we never thought possible!',
        authorId: '10',
        createdAt: DateTime(2025, 9, 12, 11, 20),
      ),
      AppPost(
        id: '10',
        content:
            'Discovered this incredible new podcast that has completely changed my morning routine! The host has such a unique perspective on personal development and interviews the most fascinating guests from various fields. I\'ve been listening during my commute and it\'s made the drive so much more enjoyable and educational. The episodes are well-researched and thought-provoking, often leaving me with new ideas to ponder throughout the day. I\'ve already recommended it to several friends and they\'re loving it too. Sometimes the best discoveries come from the most unexpected places!',
        authorId: '2',
        createdAt: DateTime(2025, 9, 8, 8, 30),
      ),
      AppPost(
        id: '11',
        content:
            'Volunteered at the local animal shelter this weekend and it was such a heartwarming experience! Spending time with all those adorable dogs and cats who are waiting for their forever homes reminded me of the importance of giving back to the community. The staff there are so dedicated and caring, working tirelessly to ensure every animal gets the love and attention they deserve. I played with the animals, helped with feeding, and even assisted in some basic grooming. The gratitude in their eyes was so touching. I\'m definitely going to make this a regular commitment!',
        authorId: '4',
        createdAt: DateTime(2025, 9, 5, 14, 15),
      ),
      AppPost(
        id: '12',
        content:
            'Just finished renovating my home office and I\'m absolutely in love with the new space! I spent weeks planning the design, choosing the perfect furniture, and creating an environment that truly inspires productivity and creativity. The natural lighting is amazing, and I\'ve added plants that bring life and energy to the room. Having a dedicated workspace has already improved my focus and work efficiency significantly. The investment in creating a space that reflects my personality and work style was completely worth it. A well-designed environment really does make a difference!',
        authorId: '6',
        createdAt: DateTime(2025, 9, 1, 16, 45),
      ),
      AppPost(
        id: '13',
        content:
            'Attended an incredible photography workshop today and learned so many new techniques! The instructor was a professional photographer with years of experience, and their teaching style was both informative and inspiring. We covered everything from composition and lighting to post-processing and storytelling through images. The hands-on practice with different cameras and equipment was invaluable. I\'ve been passionate about photography for years, but this workshop opened my eyes to possibilities I never considered before. Can\'t wait to apply these new skills to my next photo adventure!',
        authorId: '8',
        createdAt: DateTime(2025, 8, 28, 13, 20),
      ),
      AppPost(
        id: '14',
        content:
            'Had the most amazing dinner at this new restaurant that just opened downtown! The chef is incredibly talented and has created a menu that perfectly blends traditional flavors with modern culinary techniques. Every dish was a work of art, beautifully presented and bursting with flavor. The service was impeccable, and the atmosphere was elegant yet comfortable. We tried the tasting menu and each course was better than the last. The wine pairings were spot-on too. This place is definitely going to become one of my favorites for special occasions!',
        authorId: '3',
        createdAt: DateTime(2025, 8, 25, 20, 30),
      ),
      AppPost(
        id: '15',
        content:
            'Started a new fitness routine this month and I\'m already feeling stronger and more energetic! I\'ve been combining strength training with yoga and cardio, and the variety keeps me motivated and engaged. The progress I\'ve made in just a few weeks is incredible - I can lift heavier weights, hold poses longer, and my endurance has improved significantly. The best part is how much better I feel mentally too. Regular exercise has always been important to me, but this new approach has reignited my passion for fitness. Health truly is wealth!',
        authorId: '7',
        createdAt: DateTime(2025, 8, 22, 7, 15),
      ),
      AppPost(
        id: '16',
        content:
            'Just returned from an incredible solo travel adventure and I feel so refreshed and inspired! I visited three different countries over two weeks, immersing myself in different cultures, trying new foods, and meeting amazing people along the way. Traveling alone was initially intimidating, but it turned out to be one of the most liberating and empowering experiences of my life. I had complete freedom to explore at my own pace and follow my curiosity wherever it led. The memories and stories I collected will last a lifetime, and I\'m already planning my next adventure!',
        authorId: '5',
        createdAt: DateTime(2025, 8, 18, 15, 45),
      ),
      AppPost(
        id: '17',
        content:
            'Completed my first pottery class today and I\'m absolutely hooked! There\'s something so therapeutic about working with clay and creating something beautiful with your hands. The instructor was patient and encouraging, helping me understand the techniques while allowing me to express my creativity. My first piece isn\'t perfect, but I\'m proud of what I created and excited to continue learning. The meditative quality of pottery is exactly what I needed to unwind and focus on the present moment. I can\'t wait for next week\'s class!',
        authorId: '9',
        createdAt: DateTime(2025, 8, 15, 18, 20),
      ),
      AppPost(
        id: '18',
        content:
            'Just finished organizing a charity fundraiser and I\'m overwhelmed by the community\'s generosity! We raised over \$15,000 for a local children\'s hospital, far exceeding our initial goal. The event brought together people from all walks of life, united by the common goal of helping those in need. The stories shared by families who have benefited from the hospital\'s services were incredibly moving and reminded everyone why we were there. Seeing the impact we can make when we work together is truly inspiring. I\'m already thinking about next year\'s event!',
        authorId: '2',
        createdAt: DateTime(2025, 8, 12, 19, 30),
      ),
      AppPost(
        id: '19',
        content:
            'Discovered this amazing local farmers market that has completely changed how I think about food! The quality and variety of fresh, locally grown produce is incredible, and meeting the farmers who grow the food adds such a personal connection to what I eat. I\'ve been experimenting with vegetables and fruits I\'ve never tried before, and the flavors are so much more intense than anything from the grocery store. The market has become my Saturday morning ritual, and I love supporting local agriculture while eating healthier. Fresh, local food really does taste better!',
        authorId: '10',
        createdAt: DateTime(2025, 8, 8, 9, 45),
      ),
      AppPost(
        id: '20',
        content:
            'Just had the most incredible stargazing experience at a dark sky preserve! We drove two hours to get away from city lights and the view of the night sky was absolutely breathtaking. I could see the Milky Way clearly, along with countless stars, planets, and even a few shooting stars. The silence and peace of being surrounded by nature under such a vast, star-filled sky was incredibly humbling and awe-inspiring. It reminded me of how small we are in the grand scheme of things, yet how connected we are to the universe. These moments of wonder are what make life truly magical!',
        authorId: '4',
        createdAt: DateTime(2025, 8, 5, 22, 15),
      ),
    ];
  }
}
