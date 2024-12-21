import 'package:flutter/material.dart'; // Importation des widgets de base de Flutter
import 'package:moses_coffee_app/Widgets/common_button.dart'; // Importation d'un bouton personnalisé
import 'package:moses_coffee_app/pages/app_main_screen.dart'; // Importation de la page principale de l'application

// Définition d'un widget statique pour l'écran d'accueil (Splash Screen)
class SplashScreen extends StatelessWidget {
  const SplashScreen(
      {super.key}); // Constructeur pour la clé unique de ce widget

  @override
  Widget build(BuildContext context) {
    // Récupération des dimensions de l'écran pour un design responsive
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black, // Couleur d'arrière-plan de l'écran
      body: SizedBox(
        height: size.height, // Définit la hauteur pour couvrir tout l'écran
        width: size.width, // Définit la largeur pour couvrir tout l'écran
        child: Stack(
          // Permet de superposer des widgets (exemple : image de fond + contenu)
          children: [
            // Widget pour afficher une image de fond
            SizedBox(
              child: Center(
                child: Image.asset(
                  "assets/coffee-shop/bg.png", // Chemin de l'image locale
                  height: size.height /
                      1.3, // Hauteur de l'image proportionnelle à l'écran
                  fit: BoxFit.cover, // Ajuste l'image pour remplir le conteneur
                ),
              ),
            ),
            // Widget pour positionner précisément le contenu (texte et bouton)
            Positioned(
              bottom:
                  45, // Distance entre le bas du widget et le bas de l'écran
              right:
                  0, // Définit la position droite (ici, alignée à gauche et droite pour centrer)
              left: 0, // Définit la position gauche
              child: Container(
                // Conteneur pour envelopper le texte et le bouton
                padding: const EdgeInsets.symmetric(
                    horizontal: 30), // Ajoute une marge horizontale
                child: Column(
                  // Organise les widgets enfants en colonne (verticalement)
                  mainAxisSize: MainAxisSize.min, // Hauteur réduite au contenu
                  children: [
                    // Widget Text : titre principal
                    const Text(
                      "Tombez amoureux du café dans une félicité exquise !", // Texte affiché
                      textAlign:
                          TextAlign.center, // Centre le texte horizontalement
                      style: TextStyle(
                        fontSize: 35, // Taille de la police du texte
                        color: Colors.white, // Couleur du texte
                        fontWeight:
                            FontWeight.w600, // Poids (épaisseur) du texte
                        height: 1.3, // Hauteur de ligne
                      ),
                    ),
                    const SizedBox(
                      // Ajout d'un espace vide entre le titre principal et le sous-titre
                      height: 10, // Hauteur de l'espace
                    ),
                    // Widget Text : sous-titre ou description
                    Text(
                      "Bienvenue dans notre chaleureux coin café, où chaque tasse est un véritable délice.", // Texte affiché
                      textAlign:
                          TextAlign.center, // Centre le texte horizontalement
                      style: TextStyle(
                        fontSize: 15, // Taille de la police du texte
                        color: Colors.grey[600], // Couleur gris doux
                        fontWeight:
                            FontWeight.w500, // Poids (épaisseur) moyen du texte
                        height: 1.3, // Hauteur de ligne
                      ),
                    ),
                    const SizedBox(
                      // Ajout d'un espace vide entre la description et le bouton
                      height: 30, // Hauteur de l'espace
                    ),
                    // Bouton personnalisé
                    CommonButton(
                      title: "Lancez-vous", // Texte affiché sur le bouton
                      onTab: () {
                        // Navigation vers l'écran principal au clic
                        Navigator.push(
                          context, // Contexte actuel
                          MaterialPageRoute(
                            builder: (_) =>
                                const CoffeeAppMainScreen(), // Définit la route vers l'écran principal
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
