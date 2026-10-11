# La Maison de Kicuit — mémo projet

Jeu éducatif pour les deux enfants d'Anthony, joué sur **iPad (Safari)**.
En ligne : https://tonyd2925.github.io/kicuit/ (GitHub Pages, branche `main`, racine).

## Les joueurs

| Clé interne (sauvegarde) | Nom affiché | Âge | Mode |
|---|---|---|---|
| `anna` | **Nana** | 5 ans | Découverte : peu de texte, voix de Kicuit, gros boutons, jamais punitif |
| `rafael` | **Raf** | 10 ans | Défis : chiffres réels (°C, minutes), explications du « pourquoi », carnets |

- Ne jamais renommer les clés `anna` / `rafael` : les sauvegardes `localStorage` (`kicuit_v1`) en dépendent.
- Les textes passent par `T(texteNana, texteRaf)`.
- Chaque enfant a ses propres étoiles, autocollants et déblocages.

## Personnages

- **Kicuit** : petit robot cuisinier (toque), guide du jeu. Il parle avec la synthèse vocale fr-FR, et toucher sa bulle répète la phrase.
- **Wanji** : pomsky (gris et blanc, yeux bleus). C'est le goûteur et le « client » des commandes du jour.
- **Règle du chocolat** : on ne donne **jamais** de chocolat à Wanji. Kicuit l'arrête, l'enfant goûte lui-même et Wanji reçoit une croquette. Cette règle vaut pour tous les futurs ateliers.

## Principes de conception

1. **Réalisme** : les recettes, ustensiles et procédés doivent être plausibles (pas d'omelette au four).
   Les catastrophes sont exagérées et drôles, mais elles reposent sur une vraie cause que Kicuit explique à Raf.
2. **Pour Nana** : chaque objectif peut être réussi avec les gros boutons (3 choix). Il faut le vérifier par un test des combinaisons.
3. **Rejouabilité** : commandes du jour de Wanji, collections, hasard, et liens entre ateliers (le potager remplit le frigo, la fromagerie remplit le frigo).
4. **Autocollants** : les enfants les adorent, ils sont prioritaires (voir plus bas).

## Progression

- Étoile : +1 par commande de Wanji réussie (le bon plat, cuisson parfaite).
- **Jardin : 5 étoiles** (décidé). Seuils des autres ateliers : à fixer quand ils seront construits.
- Ordre de construction : ~~Cuisine~~ → **Jardin** → **Fromagerie** → Garage / Laboratoire / Corps humain.
- Prochaine étape d'interface (en attente, ne pas faire sans accord) : un compteur « Jardin : x/5 ⭐ » sur la maison.

## Cuisine (faite, à faire évoluer)

État actuel : frigo (9 ingrédients), saladier (retirer un ingrédient en le touchant), four, micro-ondes, Wanji, commandes, carnet de recettes (Raf).

### Prochaine mise à jour : remplacer le micro-ondes par une plaque de cuisson

Le micro-ondes est jugé peu utile. On le remplace par une **plaque de cuisson** avec deux ustensiles :

- **Poêle** : omelette, crêpes, œuf au plat.
  Geste : **retourner** (glisser vers le haut). Trop fort, la crêpe se colle au plafond.
- **Casserole** : chocolat chaud, soupe de tomates, confiture de fraises, et plus tard la cancoillotte (fromagerie).
  Geste : **remuer** (mouvement circulaire). Sans remuer, ça attache et ça brûle. Feu trop vif : le lait déborde.
- Réglages : Nana a 3 flammes (doux, moyen, vif) et 3 sabliers. Raf règle la puissance de 1 à 9 et un temps.
- **La recette dépend de la pâte ET de l'ustensile** : la même pâte (farine, œuf, lait) donne des crêpes à la poêle, ou un clafoutis ou flan au four.
- Garder la leçon « un œuf entier ne se met jamais au micro-ondes » sous forme d'astuce de Kicuit.

Le four reste pour : gâteau (nature, chocolat, fraises), pizza, cookies, gratin de tomates, quiche au fromage, œuf cocotte.
Plus tard, avec la fromagerie : tartiflette (reblochon), croûte au Mont d'Or, gratin au comté.

## Autocollants (à soigner en priorité)

Objectif : un vrai album d'autocollants, celui qu'on a envie de remplir.

- **Ouverture d'une pochette** : un autocollant gagné arrive dans une pochette. On la déchire du doigt, puis on fait **glisser** l'autocollant à son emplacement dans l'album.
- **Album par pages thématiques** : Cuisine, Catastrophes, Wanji et Kicuit, Jardin, Fromagerie, Secrets. Chaque page a un compteur ; une page complète donne un autocollant doré.
- **Rareté** : commun, **brillant** (reflet) et **holographique** (reflet animé arc-en-ciel) pour les exploits.
- **Secrets** : silhouettes « ? » obtenues par des actions cachées (ex. : faire exploser 3 plats, caresser Wanji 20 fois).
- **Doubles** : un autocollant déjà possédé arrive en double et peut être collé librement sur une **page libre** (déplacer, tourner, agrandir) pour créer sa propre scène.
- Style : bordure blanche découpée, légère ombre, son de « décollage » et confettis.
- Pour Nana : autocollants plus grands, pas de texte obligatoire.
- Cible : environ 60 autocollants sur tout le jeu (environ 12 par atelier).

## Jardin (prochain atelier, 5 étoiles)

- Parcelles, graines (carottes, fraises, blé, radis, tomates, fleurs), arrosoir, croissance accélérée.
- Obstacles : mauvaises herbes, trop d'engrais, pucerons. Les **abeilles aident** la pollinisation, on ne les chasse pas.
- Les récoltes vont au frigo (le blé passe au moulin pour devenir de la farine). Les fleurs servent à faire des bouquets.
- Plus tard : une vache qui fournit le lait de la fromagerie.

## Fromagerie (après le jardin)

Parcours commun, avec des réglages selon le fromage :

1. Choisir le lait (vache, chèvre, brebis).
2. Chauffer, puis ajouter la présure et les ferments.
3. Couper le caillé.
4. Cuire le caillé (pâtes cuites seulement).
5. Mouler (louche ou presse).
6. Saler (frotter ou saumure).
7. Cave d'affinage (accélérée, conservée entre les parties).
8. Dégustation (Wanji, Kicuit) et carnet des fromages.

| Famille | Exemple | Geste spécial |
|---|---|---|
| Pâte fraîche | Fromage blanc | Égouttage en faisselle |
| Fondu | Cancoillotte | Faire fondre le metton en remuant |
| Croûte fleurie | Camembert | 5 louches par moule, duvet blanc en cave |
| Croûte lavée | Mont d'Or, munster | Sangle d'épicéa, frotter la croûte (Wanji se bouche le nez) |
| Pâte pressée | Morbier, reblochon | Tracer la raie noire du morbier |
| Pâte pressée cuite | Comté, emmental | Cuire le caillé, presser, retourner et frotter la meule ; les trous viennent des bulles de gaz |
| Persillée | Roquefort (brebis) | Piquer à l'aiguille pour faire pousser le bleu |

- Nana : fromage blanc, cancoillotte, camembert, avec des étapes guidées.
- Raf : tous les fromages, avec réglages ; le comté est le défi final.
- Catastrophes : lait trop chaud (rien ne caille), mauvais grains, cancoillotte qui attache, fromage oublié et poilu, bleu non piqué, fromage sans sel.

## Ateliers suivants (rappel du plan d'origine)

- **Garage** : châssis, carrosserie, moteur, roues, peinture au pistolet. Nana ou Raf part au volant, et un mauvais assemblage donne des pannes comiques.
- **Laboratoire** : circuit électrique, flotte ou coule (Raf prédit avant de lancer), aimants, couleurs (peinture en cyan, magenta, jaune, mais lumière en rouge, vert, bleu), engrenages en niveaux.
- **Corps humain** : puzzle du squelette (Nana : 6 pièces, Raf : 15 à 20 os nommés), cœur et poumons animés, boutons Courir et Dormir. Module court.

## Technique

- Un seul `index.html` (HTML, CSS et JS vanilla, aucune dépendance), graphismes en SVG inline, sons en WebAudio.
- Scène fixe de 1180×820, mise à l'échelle par `fit()`, iPad en paysage (message si l'iPad est en portrait).
- **Taps : toujours utiliser `onTap(el, fn)`** (pointerdown/pointerup), jamais `click`. Sur iPad, `click` rate les éléments animés.
- Hors ligne : `sw.js`. **Incrémenter `const C='kicuit-vN'` à chaque mise à jour**, sinon l'iPad garde l'ancienne version.
- Icônes `icon-180.png` / `icon-512.png`, `manifest.webmanifest` (ajout à l'écran d'accueil).
- Avant de pousser : `node --check` sur le script, test des combinaisons de cuisson, partie complète en navigateur headless (tap tactile).
- Tester les touches avec `has_touch=True` : c'est le vrai usage des enfants.
