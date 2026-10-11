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
  **Il doit parler peu** : phrases courtes. `say(texte, voix)` : par défaut Nana entend le texte et Raf le lit en silence ; `false` = bulle seule ; une chaîne = phrase courte dite aux deux. Pas de voix sur les ingrédients, les réglages ni la cuisson. Voix pour Raf seulement pour les alertes (chocolat), le résultat en un mot et quand on touche Kicuit.
- **Wanji** : le vrai chien de la famille, un pomsky au poil brun taupe et crème, calotte brune avec une liste blanche sur le front, masque brun autour des yeux bleu clair, truffe brun foncé, collier noir avec médaille argentée. C'est le goûteur et le « client » des commandes du jour.
- **Règle du chocolat** : on ne donne **jamais** de chocolat à Wanji. Kicuit l'arrête, l'enfant goûte lui-même et Wanji reçoit une croquette. Cette règle vaut pour tous les futurs ateliers, et s'étend aux fromages bleus (roquefort) dans la fromagerie.

## Principes de conception

1. **Réalisme** : les recettes, ustensiles et procédés doivent être plausibles (pas d'omelette au four).
   Les catastrophes sont exagérées et drôles, mais elles reposent sur une vraie cause que Kicuit explique à Raf.
2. **Pour Nana** : chaque objectif peut être réussi avec les gros boutons (3 choix). Il faut le vérifier par un test des combinaisons.
3. **Rejouabilité** : commandes du jour de Wanji, collections, hasard, et liens entre ateliers (le potager remplit le frigo, la fromagerie remplit le frigo).
4. **Autocollants** : les enfants les adorent, ils sont prioritaires (voir plus bas).

## Progression

- Étoile : +1 par commande de Wanji réussie (le bon plat, cuisson parfaite) et +1 par objectif du jardin réussi.
- **Jardin : 10 étoiles** (constante `JARDIN`), **Fromagerie : 20 étoiles** (`FROMAGE`), avec appui long parent de 3 s sur chacun. Des autocollants restent à gagner au-delà pour donner envie de revenir. Seuils des autres ateliers : à fixer quand ils seront construits.
- Ordre de construction : ~~Cuisine~~ → ~~Jardin~~ → ~~Fromagerie~~ → Garage / Laboratoire / Corps humain.
- Prochaine étape d'interface (en attente, ne pas faire sans accord) : un compteur « Jardin : x/10 ⭐ » sur la maison.

## Cuisine (faite, à faire évoluer)

État actuel : frigo (9 ingrédients), saladier (retirer un ingrédient en le touchant), four, **plaque de cuisson avec poêle et casserole** (le micro-ondes a été retiré), Wanji, commandes, carnet de recettes (Raf).

- Les recettes sont définies par `req` (ingrédients obligatoires), `opt` (autorisés en plus) et `app` (four, poêle, casserole). La même pâte donne un plat différent selon l'ustensile (farine, œuf, lait donnent des crêpes à la poêle) ; un ustensile inadapté donne le résultat « mauvais ustensile ».
- Gestes : retourner la crêpe ou plier l'omelette (glisser vers le haut, au-delà de 300 px la crêpe se colle au plafond puis tombe sur Wanji) ; remuer la casserole (jauge ; sans remuer, « ça attache »). Lait sur feu 8 ou plus : ça déborde, taches à nettoyer.
- Nana : feu doux/moyen/vif = 3/5/9 ; sabliers poêle 2/4/10, casserole 5/15/40, four 10/25/60. Chaque recette est réussissable au réglage « moyen ».
- Une commande réussie donne une étoile et, si l'autocollant de la recette est déjà gagné, une pochette double.
- La leçon « un œuf entier ne se met jamais au micro-ondes » est une astuce de Kicuit.

Plus tard, avec la fromagerie : tartiflette (reblochon), croûte au Mont d'Or, gratin au comté, cancoillotte à la casserole.

## Autocollants (à soigner en priorité)

Fait : pochettes à déchirer (2 touches), glisser-déposer vers la case (Nana : n'importe où sur la bonne page), pages avec compteur, autocollant doré par page complète, rareté (brillant, holographique, doré), secrets avec indice pour Raf, doubles sur « Ma page » (déplacer, tourner, agrandir). Données par enfant : `st` (collés), `packs` (à ouvrir), `tray` (à coller), `free` (page libre), `c` (compteurs).

Objectif : un vrai album d'autocollants, celui qu'on a envie de remplir.

- **Ouverture d'une pochette** : un autocollant gagné arrive dans une pochette. On la déchire du doigt, puis on fait **glisser** l'autocollant à son emplacement dans l'album.
- **Album par pages thématiques** : Cuisine, Catastrophes, Wanji et Kicuit, Jardin, Fromagerie, Secrets. Chaque page a un compteur ; une page complète donne un autocollant doré.
- **Rareté** : commun, **brillant** (reflet) et **holographique** (reflet animé arc-en-ciel) pour les exploits.
- **Secrets** : silhouettes « ? » obtenues par des actions cachées (ex. : faire exploser 3 plats, caresser Wanji 20 fois).
- **Doubles** : un autocollant déjà possédé arrive en double et peut être collé librement sur une **page libre** (déplacer, tourner, agrandir) pour créer sa propre scène.
- Style : bordure blanche découpée, légère ombre, son de « décollage » et confettis.
- Pour Nana : autocollants plus grands, pas de texte obligatoire.
- Autocollants de long terme (pour revenir) : 5, 10 (jardin) et 20 étoiles, 10 commandes réussies, jouer 3 puis 7 jours différents (`days`), série de 5 plats parfaits, carnet complet.
- Cible : environ 60 autocollants sur tout le jeu (environ 12 par atelier). Actuellement 81 (cuisine, jardin, fromagerie), dont certains réservés à Raf.

## Jardin (fait, 10 étoiles)

- Ouverture : 10 étoiles (`JARDIN`) ou **appui long de 3 s sur le jardin de la maison** (mode parent, par enfant : `g.open`).
- 6 parcelles. Outils en bas : 6 graines (carotte, radis, fraise, tomate, blé, fleurs), arrosoir, engrais, main, coccinelles.
- Le temps ne passe que quand on est dans le jardin (`gTick` toutes les 250 ms). Cycle complet : environ 50 s pour Nana, 80 s pour Raf.
- Eau : la plante ne pousse qu'entre 1 et 100. Raf voit une jauge ; il peut noyer (au-dessus de 100) ou laisser mourir de soif (plante à arracher). Nana : jamais de mort, eau plafonnée, bulle 💧 quand ça a soif.
- Engrais : une dose accélère. Raf : deux doses brûlent les feuilles (pause). Nana : la 2e dose est refusée gentiment.
- Mauvaises herbes et pucerons apparaissent au hasard et ralentissent la pousse. Main : écraser, désherber, arracher, récolter. Coccinelles : mangent les pucerons.
- Fraises et tomates restent en fleur tant qu'une **abeille** n'est pas venue butiner. Toucher l'abeille la fait fuir (leçon : ne pas chasser les abeilles).
- Panier : carottes et radis à donner à Wanji (il adore les carottes, le radis le fait grimacer) ; blé au **moulin** pour faire de la farine ; 3 fleurs ou plus pour un **bouquet** posé à la fenêtre de la cuisine.
- Fraises, tomates et farine vont au frigo (pastille 🌱 sur l'ingrédient). Un plat parfait avec une récolte du jardin donne « Du jardin à l'assiette ».
- **Objectifs du jardin** (carte en haut de l'écran, un à la fois, toucher la carte le relit) : listes `OBJ_NANA` (simples : récolter 2 carottes, arroser 5 fois, faire un bouquet…) et `OBJ_RAF` (6 fraises, 4 cultures différentes en même temps, 3 récoltes sans soif, bouquet de 4 couleurs, plat réussi avec une récolte…). Progression par événements `gEv(type, données)`. Un objectif réussi donne une étoile.
- **Cadeaux du jardin** selon le nombre d'objectifs réussis (`UNLOCKS`) : 1 épouvantail, 3 ruche (abeilles plus fréquentes), 5 graines de tournesol, 7 tuyau (arrose toutes les parcelles d'un coup).
- Page d'autocollants Jardin : 19 autocollants (dont tournesol, premier objectif, 10 objectifs), 30 récoltes et des secrets.
- La vache Marguerite est dans la fromagerie (pas au jardin).

## Fromagerie (faite)

**Ouverture : 20 étoiles** (+ appui long parent de 3 s, comme le jardin). Petite ferme avec **la vache Marguerite** (dans la fromagerie, pas au jardin). Chèvre et brebis arrivent plus tard comme cadeaux d'objectifs (lait de chèvre pour la bûche, lait de brebis pour le roquefort).

- **Traite** : mini-jeu, tirer les pis à tour de rôle, le seau se remplit. Le lait va aussi au frigo de la cuisine (pastille 🌱).

Parcours, un geste par étape :

1. Chauffer le lait (thermomètre, environ 32 °C ; trop chaud = ferments morts, rien ne caille).
2. Présure et ferments au compte-gouttes ; Raf choisit la flore : blanche (camembert), bleue (roquefort), rouge (croûte lavée).
3. Caillage : on attend, puis on enfonce le doigt ; caillé qui se casse net = prêt.
4. Tranchage à la harpe (glisser le doigt) : peu de passages = gros morceaux (pâte molle), beaucoup = grains de riz (comté).
5. Cuisson du caillé, pâtes cuites seulement : remuer jusqu'à environ 54 °C.
6. Moulage : 5 louches (camembert) ou levier de presse (comté).
7. Salage : frotter du doigt ou bain de saumure.
8. Geste signature du fromage.
9. Cave d'affinage : étagères, retourner et frotter.
10. Dégustation (Kicuit, Wanji), puis carnet et frigo.

| Fromage | Région | Geste signature | Cave (temps du fromage) |
|---|---|---|---|
| Fromage blanc | partout | Égoutter en faisselle | aucune |
| Cancoillotte | Franche-Comté | Fondre le metton en remuant, feu doux | aucune |
| Camembert | Normandie | 5 louches, duvet blanc | 3 semaines |
| Chèvre (bûche) | Centre | Rouler la bûche | 2 semaines |
| Reblochon | Savoie | Presser à la main | 3 semaines |
| Morbier | Franche-Comté | Tracer la raie noire | 2 mois |
| Mont d'Or | Franche-Comté | Sangle d'épicéa, frotter la croûte (Wanji se bouche le nez) | 3 semaines |
| Munster | Alsace | Laver la croûte (orange) | 1 mois |
| Roquefort | Aveyron (brebis) | Piquer à l'aiguille | 3 mois |
| Emmental | Savoie | Cave chaude : bulles de gaz = trous | 2 mois |
| Comté | Franche-Comté | Grains fins, cuisson, presse, retourner et frotter la meule | 4 mois minimum |

- **Carte de France** : chaque fromage réussi s'allume sur sa région (carnet de Raf ; carte complète = autocollant doré).
- **Temps de cave réel** (validé) : l'affinage continue quand on ne joue pas, 1 jour de fromage = 1 minute réelle (camembert ≈ 21 min, comté de 4 mois ≈ 2 h). **Rien ne s'abîme pendant l'absence** : les soins ne sont demandés que quand l'enfant est dans la cave. Raf : fromage négligé pendant qu'il joue = moisissure poilue ; trop affiné = très fort et coulant (Wanji se cache). Nana : cave plus rapide (camembert ≈ 5 min), gestes toujours réussis.
- **Nana** : fromage blanc, cancoillotte, camembert ; étapes guidées une par une, 3 gros boutons.
- **Raf** : les 11 fromages, débloqués progressivement ; vrais réglages (°C, grains, durée de cave) ; le comté est le défi final.
- **Catastrophes** : lait trop chaud (rien ne caille), mauvais grains (comté mou), cancoillotte qui attache, bleu non piqué (roquefort blanc), fromage poilu, fromage sans sel.
- **Règle de sécurité Wanji** : jamais de roquefort ni de bleu (la moisissure peut rendre un chien malade), même traitement que le chocolat (Kicuit l'arrête, croquette). Les autres fromages : petit morceau autorisé ; il adore le comté, se bouche le nez devant le munster.
- **Liens** : fromages au frigo → tartiflette (reblochon), gratin au comté, pommes de terre sautées. Plus tard : Mont d'Or chaud, cancoillotte en cuisine. Nouvelle culture au jardin : **pomme de terre**.
- **Objectifs de la fromagerie** (comme le jardin, +1 étoile chacun), ex. « Prépare un plateau de 3 fromages », « Affine un comté de 4 mois ».
- **Autocollants** : page Fromages de 19 (un par fromage, première traite, ça ne caille pas, Wanji se bouche le nez, « Pas de bleu pour les chiens », fromage poilu, plateau, comté de 4 mois holographique, carte de France, doré).

Implémentation :
- Écran `s-fromage`. Données par enfant `P().f` (`F_()`) : `milk`, `cave` (avec horodatage `start`), `stock` (fromages au frigo), `found` (réussis parfaitement, carte), `made`, `objDone`, `obj`.
- Recettes de fromage dans `CH` (lait, °C, gouttes, flore, passages de harpe, cuisson, moulage, sel, geste, jours de cave). Étapes calculées par `fSteps()`. Défauts notés dans `FS.q`, note finale par `fGrade()` (parfait / bon / raté). Nana : toujours parfait.
- Ordre de déblocage pour Raf (`CHORDER`) : un fromage s'ouvre quand le précédent a été fabriqué. Chèvre au 2e objectif, brebis au 4e (`UNLOCKS_F`).
- Temps de cave : `DAYMS()` = 60 s par jour pour Raf, 15 s pour Nana. Soins (`care`) seulement quand la cave est ouverte ; oublié plus de 25 s = poilu (Raf).
- Les rafraîchissements différés passent par `renderChooserSafe()` pour ne jamais interrompre une fabrication en cours.
- Autocollants hors de portée de Nana marqués `raf` (fromages réservés, tartiflette, gratin au comté) : ni affichés ni comptés pour elle (`VIS()`).
- Liens faits : pomme de terre au jardin (outil « Patates », après l'ouverture de la fromagerie), 4e rangée du frigo (`LIMITED` : patates, reblochon, comté ; stock limité, consommé à la cuisson ; Nana n'a que les patates), recettes tartiflette, gratin au comté (four) et pommes de terre sautées (poêle).

## Ateliers suivants (rappel du plan d'origine)

- **Garage** : châssis, carrosserie, moteur, roues, peinture au pistolet. Nana ou Raf part au volant, et un mauvais assemblage donne des pannes comiques.
- **Laboratoire** : circuit électrique, flotte ou coule (Raf prédit avant de lancer), aimants, couleurs (peinture en cyan, magenta, jaune, mais lumière en rouge, vert, bleu), engrenages en niveaux.
- **Corps humain** : puzzle du squelette (Nana : 6 pièces, Raf : 15 à 20 os nommés), cœur et poumons animés, boutons Courir et Dormir. Module court.

## Technique

- Un seul `index.html` (HTML, CSS et JS vanilla, aucune dépendance), graphismes en SVG inline, sons en WebAudio.
- Scène fixe de 1180×820, mise à l'échelle par `fit()`, iPad en paysage (message si l'iPad est en portrait).
- **Taps : toujours utiliser `onTap(el, fn)`** (pointerdown/pointerup), jamais `click`. Sur iPad, `click` rate les éléments animés.
- **Zoom bloqué** : Safari ignore `user-scalable=no`. Tout `touchstart` est annulé (sauf `input`, `.blist`, `#tray`, qui doivent défiler), ainsi que le double-tap et le pincement ; les touches du jeu passent par les événements pointer, qui restent actifs. Un zoom résiduel est annulé via `visualViewport` (`unzoom()` puis `scrollTo(0,0)`). `fit()` lit `clientWidth/clientHeight` et non `innerWidth`, faussé quand Safari a zoomé. Ne jamais réintroduire `click`, que ce blocage empêcherait.
- Hors ligne : `sw.js`. **Incrémenter `const C='kicuit-vN'` à chaque mise à jour**, sinon l'iPad garde l'ancienne version.
- Icônes `icon-180.png` / `icon-512.png`, `manifest.webmanifest` (ajout à l'écran d'accueil).
- Avant de pousser : `node --check` sur le script, test des combinaisons de cuisson, partie complète en navigateur headless (tap tactile).
- Tester les touches avec `has_touch=True` : c'est le vrai usage des enfants.
