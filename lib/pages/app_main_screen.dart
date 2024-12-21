import 'package:flutter/material.dart'; // Importation des widgets de base de Flutter
import 'package:moses_coffee_app/colors.dart'; // Importation des couleurs personnalisées de l'application
import 'package:moses_coffee_app/models/icon_model.dart'; // Importation du modèle des icônes (si nécessaire)

class CoffeeAppMainScreen extends StatefulWidget {
  const CoffeeAppMainScreen(
      {super.key}); // Constructeur de la classe StatefulWidget

  @override
  State<CoffeeAppMainScreen> createState() =>
      _CoffeeAppMainScreenState(); // Crée l'état de ce widget
}

class _CoffeeAppMainScreenState extends State<CoffeeAppMainScreen> {
  int indexMenu = 0; // Indice de l'élément du menu actuellement sélectionné

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu[indexMenu]['destination']
          as Widget, // Affiche la destination du menu basé sur l'index sélectionné
      backgroundColor:
          xbackgroundColor, // Définit la couleur de fond de l'écran
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal:
                30), // Ajoute une marge horizontale pour le menu de navigation
        child: Row(
          // ignore: always_specify_types
          children: [
            // Utilisation de List.generate pour créer les items du menu à partir de la liste 'menu'
            ...List.generate(menu.length, (index) {
              Map<String, dynamic> items = menu[
                  index]; // Récupère l'élément du menu actuel sous forme de Map
              bool isActive = indexMenu ==
                  index; // Vérifie si l'élément du menu est sélectionné

              return Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      indexMenu =
                          index; // Change l'index du menu lorsque l'utilisateur clique sur un item
                    });
                  },
                  child: SizedBox(
                    height: 70, // Définit la hauteur de chaque élément du menu
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // Adapte la taille de la colonne au contenu
                      // ignore: always_specify_types
                      children: [
                        const SizedBox(
                            height:
                                20), // Ajoute un espace vide en haut de chaque élément
                        Icon(
                          items[
                              'icon'], // Affiche l'icône associée à cet item de menu
                          color: isActive
                              ? xprimaryColor
                              : xsecondaryColor, // Change la couleur de l'icône selon l'état actif
                          size: 25, // Taille de l'icône
                        ),
                        if (isActive)
                          const SizedBox(
                              height:
                                  7), // Ajoute un espace entre l'icône et le container si l'item est actif
                        if (isActive)
                          Container(
                            height:
                                5, // Hauteur de la barre indiquant l'élément actif
                            width: 5, // Largeur de la barre
                            decoration: BoxDecoration(
                              color: xprimaryColor, // Couleur de la barre
                              borderRadius: BorderRadius.circular(
                                  20), // Bord arrondi de la barre
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
