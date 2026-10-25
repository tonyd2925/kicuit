# La Maison de Kicuit — mémo projet

Jeu éducatif pour les deux enfants d'Anthony, joué sur **iPad (Safari)**.
En ligne : https://tonyd2925.github.io/kicuit/ (GitHub Pages, branche `main`, racine).

**Organisation du site** : `index.html` = accueil « À quoi on joue ? » (choix entre les outils) ; `kicuit.html` = le jeu (bouton 🏠 en haut à gauche de l'écran titre pour revenir à l'accueil) ; `cube.html` = « Le Cube » : écran « Qui joue ? » ; **Nana** (13 jeux sans lecture, voix fr-FR, sauvegarde `cube-nana-v1` (anciennes sauvegardes de 5 ou 9 jeux converties) : couleurs, ça tourne, jeux « répare » progressifs (`stages` = [côtés, nb de dessins, `watch` = on voit le mélange lentement puis on rembobine / `hide` = mode détective, pile]), « Rembobine » avec pile des tours, « Presque trois » (stage `pair` = 3 tours dont 2 identiques) avant « Trois tours », vérification tour par tour (un mauvais tour est défait seul, les tours justes restent), « Sur ton vrai cube » (copie + contraire, puis papa/maman mélange), aide par paliers (réessaie / indice couleur / bouton qui brille), « le contraire » nommé après chaque réparation, révision du jour ☀️ (3 épreuves des jeux réussis), petite danse (1 danse) puis tour de magie (6 danses), un mouvement par touche) **Solveur** (d'abord un indice : `coachStage()` détecte l'étape de la méthode de Raf avec cubejs et affiche le niveau et sa formule ; « Toute la solution » ensuite ; recopie des 6 faces avec gomme ⌫, Annuler, compteur x/9 par couleur, « Tout effacer » en deux touches ; validation des pièces/parité, solution Kociemba via `vendor/cubejs` (MIT) dans `solver-worker.js`, coups joués un par un sur le cube 3D, nommés par couleur (« Tourne l'orange, vers le haut ») avec voix, reste du cube assombri, doubles coups découpés en 2 quarts de tour) et **Raf** = « Le Cube de Rafael », entraîneur Rubik's Cube en 9 niveaux (cube 3D animé qui montre chaque mouvement, `RC` ; jaune en haut, vert devant ; quiz, formules de mémoire, défis sur le vrai cube, chrono par étapes (`S.splits`, étape la plus lente) ; quiz « Reconnais » sur le cube 3D dès le niveau 4 (`recog`, bonus non bloquant), « Fais avec moi » 🐢/🚶/🐇 (`tempo`), formules en morceaux (`chunks`) ; exercice « De mémoire » avec aide dégressive par étoile (`chunked(f, cell, mode)` : labels → nolabels → flat ; 1er mouvement donné `drill.given` pour les formules sans morceaux ; cases vides de taille fixe) ; tuto caché pendant le chrono du défi (`timer`), révision du jour (`S.rev`), niveau bonus 9 « Croix directe » (objectif < 1 min) ; affichage des mouvements `S.nota` = mots (défaut : `faceIcon` + nom, lettre en petit) / mixte / lettres, via `mvInner()`, `chip()`, `keyCls()`, `scrHTML()` ; jeu « Le code des lettres » au niveau 0 (écran `letters`, `S.letters.a/b`) ; niveau 1 « Marguerite pas à pas » (`DSTEPS`, 6 étapes, écran `daisy` : seules les 4 arêtes blanches sont simulées (`dSim`, `RC.whites()`), `dSearch` = plus court chemin ≤ 6 coups qui ajoute un pétale sans en faire tomber, arête cible surlignée en rose `RC.mark`, progression `S.levels[1].daisy`) ; sauvegarde `cube-rafael-v1`, complétée automatiquement quand on ajoute des niveaux). Zoom bloqué sur `index.html` et `cube.html` (touch-action, gesturestart). Tout nouvel outil = une page à part + une tuile sur l'accueil + son fichier dans `FILES` de `sw.js`.

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
- **Règle du chocolat** : on ne donne **jamais** de chocolat à Wanji. Kicuit l'arrête, l'enfant goûte lui-même et Wanji reçoit une croquette. Cette règle vaut pour tous les futurs ateliers, et s'étend aux fromages bleus (bleu d'Auvergne) dans la fromagerie.

## Principes de conception

1. **Réalisme** : les recettes, ustensiles et procédés doivent être plausibles (pas d'omelette au four).
   Les catastrophes sont exagérées et drôles, mais elles reposent sur une vraie cause que Kicuit explique à Raf.
2. **Pour Nana** : chaque objectif peut être réussi avec les gros boutons (3 choix). Il faut le vérifier par un test des combinaisons.
3. **Rejouabilité** : commandes du jour de Wanji, collections, hasard, et liens entre ateliers (le potager remplit le frigo, la fromagerie remplit le frigo).
4. **Autocollants** : les enfants les adorent, ils sont prioritaires (voir plus bas).

## Progression

- Étoile : +1 par commande de Wanji réussie (le bon plat, cuisson parfaite) et +1 par objectif du jardin réussi.
- Seuils : **Jardin 10** (`JARDIN`), **Corps humain 15** (`CORPS`), **Fromagerie 20** (`FROMAGE`), **Laboratoire 25** (`LABO`), **Garage 30** (`GARAGE`). `roomOpen(k)` décide ; appui long parent de 3 s sur n'importe quelle pièce fermée de la maison (par enfant : `P().open`). Des autocollants restent à gagner au-delà pour donner envie de revenir.
- Les ateliers donnent aussi des étoiles « premières fois » via `firstStar(clé)` (squelette, chaque niveau de circuit et d'engrenage, flotte, aimant, couleurs, lumière, activités du garage `ga_*`) : une seule fois par clé.
- Tous les ateliers sont construits : Cuisine, Jardin, Fromagerie, Corps humain, Laboratoire, Garage.
- Prochaine étape d'interface (en attente, ne pas faire sans accord) : un compteur « Jardin : x/10 ⭐ » sur la maison.

## Cuisine (faite, à faire évoluer)

État actuel : frigo (9 ingrédients + 5e rangée `LIMITED`), saladier (retirer un ingrédient en le touchant), four, **plaque de cuisson avec poêle et casserole** (le micro-ondes a été retiré), Wanji, commandes, carnet de recettes (Raf).

- Les recettes sont définies par `req` (ingrédients obligatoires), `opt` (autorisés en plus) et `app` (four, poêle, casserole). La même pâte donne un plat différent selon l'ustensile (farine, œuf, lait donnent des crêpes à la poêle) ; un ustensile inadapté donne le résultat « mauvais ustensile ».
- Gestes : retourner la crêpe ou plier l'omelette (glisser vers le haut, au-delà de 300 px la crêpe se colle au plafond puis tombe sur Wanji) ; remuer la casserole (jauge ; sans remuer, « ça attache »). Lait sur feu 8 ou plus : ça déborde, taches à nettoyer.
- Nana : feu doux/moyen/vif = 3/5/9 ; sabliers poêle 2/4/10, casserole 5/15/40, four 10/25/60. Chaque recette est réussissable au réglage « moyen ».
- Une commande réussie donne une étoile et, si l'autocollant de la recette est déjà gagné, une pochette double.
- La leçon « un œuf entier ne se met jamais au micro-ondes » est une astuce de Kicuit.

Recettes liées à la fromagerie (faites) : tartiflette (reblochon), gratin au comté, pommes de terre sautées. Le lait de la traite va aussi au frigo. (Cancoillotte et Mont d'Or retirés à la demande d'Anthony.)

## Autocollants (à soigner en priorité)

Fait : pochettes à déchirer (glisser le doigt sur les pointillés, ou 2 touches pour Nana), glisser-déposer vers la case (Nana : n'importe où sur la bonne page), pages avec compteur, autocollant doré par page complète, rareté (brillant, holographique, doré), secrets avec indice pour Raf, doubles sur « Ma page » (déplacer, tourner, agrandir). Données par enfant : `st` (collés), `packs` (à ouvrir), `tray` (à coller), `free` (page libre), `c` (compteurs).

Objectif : un vrai album d'autocollants, celui qu'on a envie de remplir.

- Glisser vers l'album : les écouteurs `pointermove`/`pointerup` sont sur `document`, et `renderTray()` ne redessine pas pendant un glisser (sinon l'autocollant tenu est détruit quand la page change : c'était le bug « parfois ça ne colle pas »). Suppression du plateau par identité (`trayDel`).
- Les anciennes sauvegardes sont nettoyées au chargement (autocollants, fromages et recettes supprimés).

- **Ouverture d'une pochette** (`openPacks` → `setTear` → `tearDone` → `showCard`) : la pochette porte la couleur et l'emoji de sa page (`PACKPG`), jamais celle de la rareté (surprise). On la déchire en glissant le doigt (jauge `--t`) ; à mi-chemin, une lumière s'échappe (blanche, argent, arc-en-ciel ou dorée) et la pochette tremble si c'est rare. La carte sort de dos (Kicuit « ? »), on la touche pour la retourner (retournement auto après ~3 s), tampon « NOUVEAU ! » ou « DOUBLE », rayons, confettis et flash proportionnels à la rareté. Ensuite on fait **glisser** l'autocollant à son emplacement dans l'album.
- **Album par pages thématiques** : Cuisine, Bêtises, Copains (Wanji et Kicuit), Jardin, Fromages, Corps, Ateliers (labo, garage), Secrets, plus « Ma page » libre. Chaque page a un compteur ; une page complète donne un autocollant doré.
- **Rareté** : commun, **brillant** (reflet) et **holographique** (reflet animé arc-en-ciel) pour les exploits.
- **Secrets** : silhouettes « ? » obtenues par des actions cachées (ex. : faire exploser 3 plats, caresser Wanji 20 fois).
- **Doubles** : un autocollant déjà possédé arrive en double et peut être collé librement sur une **page libre** (déplacer, tourner, agrandir) pour créer sa propre scène.
- Style : bordure blanche découpée, légère ombre, son de « décollage » et confettis.
- Pour Nana : autocollants plus grands, pas de texte obligatoire.
- Autocollants de long terme (pour revenir) : 5, 10 (jardin) et 20 étoiles, 10 commandes réussies, jouer 3 puis 7 jours différents (`days`), série de 5 plats parfaits, carnet complet.
- Total : 132 autocollants, dont 13 réservés à Raf (marqués `raf`, invisibles et non comptés pour Nana : Nana en voit 119). Toute nouvelle récompense impossible pour Nana doit être ajoutée à cette liste, sinon sa page ne pourra jamais être complétée.

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

## Fromagerie (faite, 20 étoiles, simplifiée par familles)

Idée centrale, répétée par Kicuit : **un fromage, c'est du lait dont on enlève l'eau ; plus on enlève d'eau, plus il est dur.** Une pastille 💧 % dans la barre des étapes descend à chaque geste, et la dégustation place le fromage sur une échelle du plus mou au plus dur (`famLadder`). Le bouton 📚 ouvre « Les familles de fromages » (remplace la carte de France).

| Famille (`FAM`) | Fromage (`CH`) | Ce qui fait la différence | Cave |
|---|---|---|---|
| Fromage frais | Fromage blanc | on égoutte, c'est tout | aucune |
| Pâte molle | Camembert | gros morceaux, louche, pas de presse, duvet blanc | 21 j |
| Croûte lavée | Munster | on lave la croûte : orange, sent les chaussettes (Wanji se bouche le nez) | 30 j |
| Pâte persillée (bleu) | Bleu d'Auvergne (vache) | on pique : l'air fait pousser le bleu (jamais pour Wanji) | 30 j |
| Pâte pressée | Reblochon | grains moyens, presse | 21 j |
| Pâte dure à trous | Emmental | grains fins, cuisson, presse, **cave chaude** : les bactéries font des bulles | 60 j |
| Pâte dure | Comté | grains fins comme du riz, cuisson vers 54 °C, presse forte | 120 j |

- Retirés : cancoillotte, chèvre, morbier, Mont d'Or, roquefort (et la chèvre et la brebis). Ordre de Raf (`CHORDER`) : blanc, camembert, munster, reblochon, bleu, emmental, comté.
- Chaque étape a une phrase drôle et vraie (« coupe tout petit comme du riz », « ouste l'eau ! », les bulles de gaz qui font les trous). Pas de blagues de prouts (demande d'Anthony). Nana entend aussi l'explication de la famille à la dégustation.
- **Nana** : les 7 fromages, gestes guidés, toujours parfait ; cave de 15 s par jour, **jamais plus de 5 min** (`DAYMS(id)`).
- **Raf** : vrais réglages (°C, gouttes, flore, nombre de passages de harpe, cuisson, cave froide ou chaude) ; un fromage s'ouvre quand le précédent a été fabriqué ; le comté de 4 mois (2 h réelles) est le défi final.
- Parcours : chauffer, présure (+ flore pour Raf), caillé, trancher, cuire (pâtes dures), mouler (louche ou presse), saler, geste signature (égoutter, laver, piquer), cave, dégustation. Défauts dans `FS.q`, note par `fGrade()`.
- Temps de cave réel ; rien ne s'abîme pendant l'absence ; Raf : fromage négligé dans la cave = poilu.
- **Règle Wanji** : jamais de bleu (même traitement que le chocolat). Il adore le comté, se bouche le nez devant le munster.
- Données `P().f` (`F_()`) : `milk`, `cave`, `stock`, `found`, `made`, `objDone`, `obj`. Autocollants : un par fromage (le bleu est `f_bleuauv`, car `f_bleu` = « Pas de bleu pour les chiens »), traite, ça ne caille pas, nez bouché, poilu (Raf), plateau, « Toutes les familles » (`f_carte`), doré.
- Liens : 4e rangée du frigo (`LIMITED` : patates, reblochon, comté ; Nana n'a que les patates), tartiflette, gratin au comté, pommes de terre sautées.

## Corps humain (fait, 15 étoiles, refait en 5 ateliers)

Écran `s-corps` : onglets à gauche (`CTABS`), zone `#cWork` (le squelette utilise `#cBoard`). Données `P().cb` (`C_()`). Minuteurs via `cLater`/`cEvery`, tous coupés par `cStop()` (changement d'onglet ou d'écran, dans `go()`).
1. **Squelette** : glisser les os sur les ombres (Nana 6 pièces, Raf 13 os nommés + quiz).
2. **Le voyage du repas** : choisir un aliment (`FOODS`), mâcher (toucher la bouche ; avaler trop tôt = « Hic ! »), avaler (glisser vers le bas), malaxer l'estomac (frotter), intestin grêle (toucher les nutriments ⚡💪🧈💧 pour les envoyer dans le sang, laisser passer les fibres 🌿), gros intestin (les bactéries amies mangent les fibres), toilettes, puis bilan (énergie, muscles, eau, fibres ; Raf : durées réelles). 3 sucreries de suite = mal au ventre. Plan du corps à gauche qui suit l'organe.
3. **Cœur et souffle** : course après Wanji (marcher, courir, sprinter ; respirer en touchant ; oxygène, battements ; Raf : point de côté si l'oxygène tombe à 0, Nana jamais bloquée), puis prendre son pouls (Raf : compter 10 s × 6 ; Nana : taper en rythme), puis sieste (le cœur ralentit).
4. **Les 5 sens** : ouïe (reconnaître des bruits ; Raf : aigu ou grave), vue (pupille selon la lumière, vision de Wanji en couleurs de chien), goût (sucré, salé, acide, amer ; la carte de la langue est une légende), toucher (boîte mystère), odorat (nez bouché, puis le flair de Wanji).
5. **Docteur Kicuit** : patients (`PATIENTS`) à soigner dans le bon ordre : genou écorché, fièvre, rhume (éternuer dans le coude), dents (mini-jeu de brossage), mains (mini-jeu de 20 s de savon), Wanji (mal au ventre → vétérinaire ; **jamais de médicament humain pour un chien**), épine dans la patte. Nana : 3 outils proposés ; Raf : tous les outils. +1 étoile par patient guéri (Raf : au plus 1 erreur). Les médicaments : « c'est un adulte ou un médecin qui décide ».
- **Nana et les onglets** : toucher un onglet ne change pas de jeu (main posée sur le bord par mégarde) ; un gros bouton vert ✔ apparaît à côté pendant 4 s et c'est lui qui change (`askTab`, `hideAsk`, appelé par `cStop`). Raf : un simple toucher.
- **Aides de Nana** dans le voyage : main 👆 animée (`.hint`), toucher le tuyau pousse aussi la bouchée, toucher l'estomac compte, les bulles de l'intestin s'arrêtent et attendent qu'on les touche (rappel vocal après 7 s), bouton suivant qui pulse (`.cnudge`). La bouche est un visage qui mâche (mâchoire `.jaw`, yeux fermés, joues, salive, miettes).
- **Cœur pour Nana** : `coach(texte)` parle pendant la course (au plus une phrase toutes les 5,5 s) : vitesse choisie, souffle bas (bouton bleu qui pulse), Wanji loin, presque, cœur rapide, sueur ; puis pouls (« pose ta main sur ton cœur ») et sieste commentés.
- **Brossage** : la brosse est placée dans son propre conteneur (`br.parentElement`) ; une dent se nettoie quand elle est à moins de 64 px (Nana) ou 40 px (Raf) du centre de la brosse, selon la distance parcourue.
- Étoiles « premières fois » via `firstStar` (squelette, voyage, course, pouls, chaque sens). Page d'album Corps : 28 autocollants (`c_*`, dont `c_os`, `c_fibres`, `c_cote` réservés à Raf).

## Laboratoire (fait, 25 étoiles)

Écran `s-labo`, 5 onglets (`LTABS`), données `P().l` (`L_()`).
- **Circuit** : Raf : toucher deux bornes = un fil, toucher un fil l'enlève. **Nana** : les fils à brancher (`g` dans `CIRC_LV.nana`, dans l'ordre du + vers le −) sont dessinés en pointillés ; le prochain clignote avec une prise 🔌 et un seul toucher le branche (sur le fil ou sur une de ses bornes) ; pas de retrait ni de court-circuit possible ; l'interrupteur pulse quand c'est son tour ; une fois allumé, des points jaunes montrent le courant qui fait le tour. `evalCircuit()` cherche les chemins de B+ à B− ; un chemin sans lampe = court-circuit (autocollant secret). L'interrupteur doit être dans la boucle. Nana 2 niveaux, Raf 5 (série, LED avec un sens).
- **Flotte ou coule** : Raf prédit avant (`L.pred`), boule de pâte à modeler qui coule / la même en bateau qui flotte (Raf).
- **Aimants** : promener l'aimant ; l'aluminium (canette) n'est pas attiré, les centimes oui.
- **Couleurs** : peinture soustractive cyan/magenta/jaune (`mixRGB`), objectifs `COL_GOALS` ; mode lumière : superposer rouge, vert, bleu pour faire du blanc.
- **Engrenages** : tailles 30/50/70 sur des emplacements, `gearSolve()` (engrènement à ±8 px, blocage si deux roues engrenées tournent dans le même sens). Raf : sens inversé, vitesse (petite roue).

## Garage (fait, 30 étoiles) : atelier de mécanique, la voiture ne roule pas

Refait le 25/10 à la demande d'Anthony (« apprendre le moteur, comment démarrer, les clignotants… pas de voiture qui roule »). Écran `s-garage`, onglets `GTABS` en haut, zone `#gaWork`. Données `P().ga` (`GAD()` : `done`, `lum`) et `P().car` (`CAR_()` : couleur et points de peinture seulement). Minuteurs `gaLater`/`gaEvery`, tout coupé par `gaStop()` (changement d'onglet, `go()`), y compris le bruit du moteur `ENG` (oscillateurs qui suivent le régime). Gestes délégués : `GA.tap`/`GA.down`/`GA.move`/`GA.up` redéfinis par chaque onglet.
1. **Démarrer** (tableau de bord) : ceinture, pied sur le frein, START (test des voyants 1 s, démarreur, ralenti 800 tr/min). Pédale « Vroum » : le régime monte, zone rouge et rupteur (secret `g_rupteur`). Phares, essuie-glaces (pluie au hasard), clignotants avec tic-tac, warning, klaxon (Wanji saute ; 10 fois = secret). Scénarios `pickScen()` : normal, **batterie à plat** (clic-clic → câbles : rouge sur + vide, rouge sur + bonne, noir sur − bonne, noir sur la masse ; Nana guidée, Raf : étincelles si erreur) et **réservoir vide** (pompe SP95 / gazole ; le pistolet gazole ne rentre pas, secret Raf `g_gazole` ; arrêt automatique quand c'est plein).
2. **Moteur** : cylindre animé (`engSVG(θ)`, soupapes, bougie, bielle, vilebrequin). Nana : 4 gros boutons Aspire / Serre / Boum / Souffle dans l'ordre, 2 cycles puis le moteur tourne seul. Raf : remettre Admission / Compression / Combustion / Échappement dans l'ordre, puis déclencher 4 étincelles au bon moment (piston en haut après compression, 330°–392°) (`g_bougie`, Raf).
3. **Capot** : vue de dessus (`HOOD`). Nana : trouver 4 pièces puis remplir le lave-glace. Raf : révision (jauge d'huile entre MIN et MAX, liquide de refroidissement à n'ouvrir que moteur froid, lave-glace, tension 12,6 V).
4. **Lumières** : situations `LUMS` (Nana 5 : gauche, droite, nuit, pluie, panne ; Raf 10 : + croiser la nuit, feux de route, brouillard, feu rouge = frein, marche arrière). Voiture vue de derrière, feux réels allumés. Toutes réussies = `g_lumieres` + étoile.
5. **Pneu** : clou (Raf : éponge savonneuse, des bulles sortent à la fuite), desserrer au sol, cric, enlever, roue de secours, serrer (Raf : en étoile, `g_etoile` du premier coup), baisser, gonfler (Nana jusqu'au vert, Raf 2,2 bar ± avec Vérifier/Dégonfler).
6. **Peinture** : pistolet ou pot entier (`g_peinture`).

## Options (faites)

- **Garde-robe** (🎩 sur la maison) : accessoires pour Kicuit et Wanji, choisis séparément et gagnés avec les étoiles (`ACC` : chapeau de paille 5, nœud papillon 10, lunettes de labo 20, couronne 30). Données `P().acc` ({k, w, seen}). `kicuitSVG()`/`wanjiSVG()` ajoutent l'accessoire (`kcAcc`, `wjAcc` ; dessins de base `kicuitSVG0`/`wanjiSVG0`) ; `refreshMascots()` redessine ceux déjà affichés. Le bouton clignote quand un accessoire est débloqué.
- **Espace parents** (⚙️ sur l'écran « Qui joue ? ») : sauvegarde de toute la progression en fichier JSON (menu de partage de l'iPad, sinon téléchargement), restauration en **maintenant 3 s** puis en choisissant le fichier (aperçu et confirmation), interrupteur des sons d'ambiance (`DB.amb`). Le jeu demande aussi le stockage persistant (`navigator.storage.persist`).
- **Météo du jardin** (`GS.wx`, bouton à gauche de l'objectif, toucher = explication) : tirée au hasard à l'entrée puis toutes les ~70 s. Soleil : pousse +15 %, les plantes boivent plus. Pluie : arrose jusqu'à 70 au maximum (jamais de noyade), abeilles 3 fois plus rares. Vent : le moulin tourne seul et moud 2 fois plus vite, la terre sèche un peu plus, abeilles plus rares (réaliste : les abeilles sortent peu par pluie et grand vent).
- **Ambiance sonore** très discrète : oiseaux ou pluie au jardin, goutte dans la cave à fromage.
- **« Ma page »** de l'album : 4 fonds (crème, plage, espace, forêt), `P().freeBg`.
- Petits effets : léger écrasement de l'objet qui reçoit un `fly()`, nuages qui dérivent (maison, jardin), reflets sur la vitre du four et l'aquarium, carnet de recettes en cahier à spirale.
- **Style « 3D douce »** : volume dessiné dans les SVG (dégradés radiaux, reflets, ombres au sol `g3Shad`), sans filtre recalculé. Tous les dégradés partagés sont dans un seul bloc `<svg id="g3defs">` au début de `#stage` (toujours affiché : un dégradé dans un écran caché ne s'afficherait pas). Préfixes : `k3` Kicuit et cuisine, `w3` Wanji, `c3` Marguerite, `h3` maison et ciel, `g3` jardin, `f3` fromagerie, `b3`/`t3`/`o3` corps, `car3` garage, `a3` avatars. Les tuiles et panneaux ont un reflet en dégradé (bloc CSS « relief doux »). La toque de Kicuit est le groupe `.kc-toque` (retiré par la garde-robe pour le chapeau et la couronne).
- Écartés volontairement : zoom de caméra dans `go()` (casse les minuteurs qui vérifient l'écran), texte machine à écrire et babillage (doublon avec la voix), canvas de particules permanent (batterie), filtres SVG sur toutes les mascottes (lenteur sur iPad).

## Technique

- Le jeu tient dans un seul `kicuit.html` (HTML, CSS et JS vanilla, aucune dépendance), graphismes en SVG inline, sons en WebAudio.
- Bruits réalistes dans le module `SND` (chien, eau, cloche, orage, abeille, cœur, croque, papier, oiseau) : synthèse en couches (bruit filtré, oscillateurs avec enveloppes). `sfx.bark` et les sons de l'ouïe passent par lui.
- Scène fixe de 1180×820, mise à l'échelle par `fit()`, iPad en paysage (message si l'iPad est en portrait).
- **Taps : toujours utiliser `onTap(el, fn)`** (pointerdown/pointerup), jamais `click`. Sur iPad, `click` rate les éléments animés.
- **Zoom bloqué** : Safari ignore `user-scalable=no`. Tout `touchstart` est annulé (sauf `input`, `.blist`, `#tray`, qui doivent défiler), ainsi que le double-tap et le pincement ; les touches du jeu passent par les événements pointer, qui restent actifs. Un zoom résiduel est annulé via `visualViewport` (`unzoom()` puis `scrollTo(0,0)`). `fit()` lit `clientWidth/clientHeight` et non `innerWidth`, faussé quand Safari a zoomé. Ne jamais réintroduire `click`, que ce blocage empêcherait.
- **Autres familles** : le dossier `pc/` est une copie exacte du site pour Perline (mode découverte, clé `anna`) et Calypso (mode défis, clé `rafael`), deux filles sous Android. `famille.js` lit le nom du dossier dans l'adresse et donne `window.FAM` (prénoms, avatars `perlineSVG`/`calypsoSVG`, âges masqués) ; sauvegardes séparées (`kicuit_pc_v1`, `cube-pc-…`). Dans `kicuit.html` la variable s'appelle `KF` (`FAM` y est déjà pris par les familles de fromages). Ne jamais modifier `pc/` à la main : `./famille.sh` (lancé par `bump-version.sh`) le recopie. Adresse : https://tonyd2925.github.io/kicuit/pc/
- Hors ligne : `sw.js`. **À chaque mise à jour : lancer `./bump-version.sh`** (il recopie aussi `pc/`) (incrémente `const C='kicuit-vN'` dans `sw.js` et réécrit `version.js`, affiché sur l'accueil, l'écran « Qui joue ? » du cube et l'écran titre de Kicuit), ajouter une ligne en haut du tableau de `CHANGELOG.md`, committer avec « Version N » au début du message, puis `git push origin main` (les étiquettes git ne passent pas depuis les sessions Claude). Sans incrément, l'iPad garde l'ancienne version.
- Icônes `icon-180.png` / `icon-512.png`, `manifest.webmanifest` (ajout à l'écran d'accueil).
- Avant de pousser : `node --check` sur le script, test des combinaisons de cuisson (chaque recette de Nana réussie au feu moyen avec l'un des 3 temps), partie complète en navigateur headless (tap tactile), parcours des ateliers corps/labo/garage pour les deux enfants.
- Les particules (`burst`, `confetti`) passent au-dessus des fenêtres (z-index 97).
- Tester les touches avec `has_touch=True` : c'est le vrai usage des enfants.
