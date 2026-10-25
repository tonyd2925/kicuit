/* La même maison pour plusieurs familles : le dossier du site choisit les prénoms, les avatars et la sauvegarde.
   Racine : Nana (anna, découverte) et Raf (rafael, défis). Dossier pc/ : Perline (découverte) et Calypso (défis). */
window.FAM=(function(){
  var F={'':{id:'',a:'Nana',r:'Raf',rf:'Rafael',ages:1},
         pc:{id:'pc',a:'Perline',r:'Calypso',rf:'Calypso',ages:0,girl:1}};
  var m=location.pathname.match(/\/(pc)\/[^\/]*$/);
  return F[m?m[1]:''];
})();
