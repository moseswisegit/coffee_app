import 'package:flutter/material.dart'; // Importation des widgets Flutter de base
import 'package:moses_coffee_app/colors.dart'; // Importation du fichier contenant les couleurs personnalisées

// Définition d'un widget statique pour un bouton réutilisable
class CommonButton extends StatelessWidget {
  final String title; // Texte affiché sur le bouton
  final VoidCallback onTab; // Fonction à exécuter lorsque le bouton est tapé

  // Constructeur pour initialiser les paramètres `title` et `onTab`
  const CommonButton({super.key, required this.title, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: xprimaryColor, // Couleur de fond du bouton (définie dans `colors.dart`)
      borderRadius: BorderRadius.circular(15), // Coins arrondis avec un rayon de 15
      child: InkWell(
        borderRadius: BorderRadius.circular(15), // Applique les coins arrondis pour l'effet de clic
        onTap: onTab, // Déclenche la fonction fournie lorsque l'utilisateur tape sur le bouton
        child: SizedBox(
          height: 55, // Hauteur fixe du bouton
          width: double.infinity, // Largeur maximale pour s'étendre sur tout l'espace disponible
          child: Center(
            child: Text(
              title, // Affiche le texte fourni dans `title`
              style: const TextStyle(
                fontSize: 16, // Taille de la police
                color: Colors.white, // Couleur du texte
                fontWeight: FontWeight.w600, // Texte en semi-gras
              ),
            ),
          ),
        ),
      ),
    );
  }
}
