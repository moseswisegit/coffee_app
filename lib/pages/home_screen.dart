import 'package:flutter/material.dart';
import 'package:moses_coffee_app/colors.dart';
import 'package:moses_coffee_app/models/coffee_model.dart';
import 'package:moses_coffee_app/pages/coffee_detail_screen.dart';

// Écran principal de l'application de café
class CoffeeAppHomeScreen extends StatefulWidget {
  const CoffeeAppHomeScreen({super.key});

  @override
  State<CoffeeAppHomeScreen> createState() => _CoffeeAppHomeScreenState();
}

class _CoffeeAppHomeScreenState extends State<CoffeeAppHomeScreen> {
  // Index de la catégorie de café sélectionnée
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        // Section du fond avec un dégradé
        Stack(
          children: [
            Container(
              height: 280,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 17, 17, 17),
                    Color.fromARGB(255, 49, 49, 49),
                  ],
                ),
              ),
            ),
            headerParts(), // Appel à la méthode pour afficher l'en-tête
          ],
        ),
        const SizedBox(height: 35),
        categorySelection(), // Appel à la méthode pour afficher la sélection de catégories
        const SizedBox(height: 20),

        // Grille affichant les produits de café
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Nombre de colonnes
            mainAxisExtent: 270, // Hauteur de chaque item
            crossAxisSpacing: 15, // Espacement entre les éléments
            mainAxisSpacing: 20, // Espacement entre les lignes
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listOfCoffee.length, // Nombre d'éléments (cafés)
          itemBuilder: (context, index) {
            final coffee =
                listOfCoffee[index]; // Récupère l'objet café à afficher
            return GestureDetector(
              onTap: () {
                // Navigation vers l'écran de détails du café
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CoffeeDetailScreen(coffee: coffee),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Hero(
                            tag: coffee
                                .image, // Utilisation de Hero pour l'animation
                            child: Image.asset(
                              coffee.image, // Image du café
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Affichage de l'évaluation du café
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(25),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/coffee-shop/ic_star_filled.png",
                                  height: 12,
                                  width: 12,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${coffee.rate}", // Affichage de la note du café
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      coffee.name, // Nom du café
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      coffee.type, // Type de café
                      style: TextStyle(
                        color: xsecondaryColor,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${coffee.price}", // Prix du café
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        // Icône pour ajouter à la commande
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: xprimaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Méthode pour afficher l'en-tête avec la localisation et la barre de recherche
  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          const SizedBox(height: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Abidjan,Cocody", // Titre de la localisation
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: xsecondaryColor,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Rue 230, ", // Localisation actuelle
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: xsecondaryColor, // Icône pour dérouler les options
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 25),

          // Barre de recherche et bouton de filtrage
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff2a2a2a),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/coffee-shop/ic_search.png",
                        color: Colors.white,
                        height: 35,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            isDense: true,
                            border: InputBorder.none,
                            hintText: "Search coffee", // Texte de recherche
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: xsecondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                height: 60,
                width: 55,
                decoration: BoxDecoration(
                  color: xprimaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.tune,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),

          // Bannière publicitaire
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/coffee-shop/banner.png",
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  // Méthode pour afficher la sélection des catégories
  SizedBox categorySelection() {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: coffeeCategories.length, // Nombre de catégories
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // Mise à jour de l'index sélectionné
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 25 : 10,
                right: index == coffeeCategories.length - 1 ? 25 : 10,
              ),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? xprimaryColor
                    : xsecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                coffeeCategories[index], // Affichage du nom de la catégorie
                style: TextStyle(
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 16,
                    color:
                        selectedIndex == index ? Colors.white : Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
