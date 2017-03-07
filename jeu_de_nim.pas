{programme jeu_de_nim

//BUT:Enregistrer le nom des joueur.
//ENTREE: Deux chaines de caractères.
//SORTIE: Deux chaines de caractères remplies.
PROCEDURE pseudo12(var nom1:CHAINE var nom2:CHAINE)
DEBUT
	REPETER
		ECRIRE("JOUEUR 1 ENTREZ VOTRE NOM")
		LIRE(nom1)
	JUSQUA (LONGUEUR(nom1)>0) ET (LONGUEUR(nom1)<10)

	REPETER
		ECRIRE('JOUEUR 2 ENTREZ VOTRE NOM')
		LIRE(nom2)
	JUSQUA (LONGUEUR(nom2)>0) ET (LONGUEUR(nom2)<10)
FINPROCEDURE

//BUT:Choisir un joueur qui jouera en premier au hasard.
//ENTREE:Une chaine de caractère du nom du joueur et du joueur 2.
//SORTIE:Une des deux chaines de caractères précédente.
FONCTION premier(var joueur:CHAINE nom1:CHAINE nom2:CHAINE):CHAINE
var
	i:ENTIER
DEBUT
	i<-random(2)+1
	SI i=1 ALORS
		joueur<-nom1
	SINON
	joueur<-nom2
	FINSI
	premier<-joueur
FINFONCTION

//BUT: Réaliser le tour de jeux du joueur courant.
//ENTREE: la chaine de caractère du joueur actuel et de l'ia,l'entier du nombre d'allumettes restantes. 
//SORTIE: L'ENTIER d'allumettes restantes, l'ENTIER saisie par l'utilisateur.
PROCEDURE tourjoueur(nom1:CHAINE nom2: CHAINE var choix:ENTIER var joueur:CHAINE var allumette:ENTIER var allumax:ENTIER)
var
	i:ENTIER
DEBUT
	ECRIRE(joueur & " combien d''allumettes souhaitez-vous enlever ?")
	SI allumette-3<0 ALORS //s'il reste moins de 3 allumettes on affiche le nombre d'allumettes possible à enlever(allumax).
		allumax<-allumette
		ECRIRE("Choisissez un nombre entre 1 et "& allumax &".")
		ECRIRE("Il reste "& allumette & " allumettes.")
		REPETER
			LIRE(choix)
		JUSQUA (choix < allumax + 1) ET (choix > 0)
	SINON //s'il reste plus de 3 allumettes le joueur courant peux en retirer entre 1 et 3.
		ECRIRE("Choisissez un nombre entre 1 et 3.")
		ECRIRE("Il reste "& allumette &" allumettes.")
		REPETER
			LIRE(choix)
		JUSQUA (choix < 4) ET (choix > 0)
	FINSI

	allumette<-allumette-choix //on soustait le choix du joueur à allumette.

	SI allumette>0 ALORS //on change le tour de joueur
		SI joueur= nom1 ALORS 
			joueur<-nom2
		SINON SI joueur=nom2 ALORS
			joueur<-nom1
		FINSI
	FINSI
FINPROCEDURE
//-------------------------------DEBUT PROGRAMME-----------------------------
var
	allumette,allumax,choix:ENTIER
	nom1,nom2,joueur:CHAINE
DEBUT
	allumette<-21
	
	ECRIRE("JEU DE NIM")

	pseudo12(nom1,nom2)//les joueurs rentrent leurs pseudo
	joueur<-premier(joueur,nom1,nom2)//on choisi qui commence à jouer.
	ECRIRE("le premier joueur sera : "& joueur)
//--------------------------------BOUCLE DE JEU------------------------------
	REPETER
		tourjoueur(nom1,nom2,choix,joueur,allumette,allumax) //tour de jeu
	JUSQUA allumette =0 // quand il n'y a plus d'allumette le jeu est finit.
//----------------------------FIN DE BOUCLE DE JEU---------------------------
	ECRIRE(joueur& " a perdu.")
FIN.
//------------------------------- FIN PROGRAMME------------------------------
}

program jeu_de_nim;

uses crt;

//BUT:Enregistrer le nom des joueur.
//ENTREE: Deux chaines de caractères.
//SORTIE: Deux chaines de caractères remplies.
PROCEDURE pseudo12(var nom1:string; var nom2:string);
BEGIN
	REPEAT
	BEGIN
		writeln('JOUEUR 1 ENTREZ VOTRE NOM');
		readln(nom1);
	END;
	UNTIL (length(nom1)>0) AND (length(nom1)<10);

	REPEAT
	BEGIN
		writeln('JOUEUR 2 ENTREZ VOTRE NOM');
		readln(nom2);
	END;
	UNTIL (length(nom2)>0) AND (length(nom2)<10);
END;

//BUT:Choisir un joueur qui jouera en premier au hasard.
//ENTREE:Une chaine de caractère du nom du joueur et du joueur 2.
//SORTIE:Une des deux chaines de caractères précédente.
FUNCTION premier(var joueur:string; nom1:string; nom2:string):string;
var
	i:integer;
BEGIN
	i:=random(2)+1;
	if i=1 then
		joueur:=nom1
	ELSE
	joueur:=nom2;

	premier:=joueur;
END;

//BUT: Réaliser le tour de jeux du joueur courant.
//ENTREE: la chaine de caractère du joueur actuel et de l'ia,l'entier du nombre d'allumettes restantes. 
//SORTIE: L'ENTIER d'allumettes restantes, l'ENTIER saisie par l'utilisateur.
PROCEDURE tourjoueur(nom1:string; nom2: string; var choix:integer;var joueur:string; var allumette:integer; var allumax:integer);
var
	i:integer;
BEGIN
	clrscr;
	writeln(joueur,' combien d''allumettes souhaitez-vous enlever ?');
	IF allumette-3<0 then //s'il reste moins de 3 allumettes on affiche le nombre d'allumettes possible à enlever(allumax).
	BEGIN
		allumax:=allumette;
		writeln('Choisissez un nombre entre 1 et ',allumax,'.');
		writeln('Il reste ',allumette,' allumettes.');
		REPEAT
			readln(choix);
		UNTIL (choix < allumax + 1) AND (choix > 0);
	END
	ELSE //s'il reste plus de 3 allumettes le joueur courant peux en retirer entre 1 et 3.
	BEGIN
		writeln('Choisissez un nombre entre 1 et 3.');
		writeln('Il reste ',allumette,' allumettes.');
		REPEAT
			readln(choix);
		UNTIL (choix < 4) AND (choix > 0);
	END;
	allumette:=allumette-choix; //on soustait le choix du joueur à allumette.

	IF allumette>0 then //on change le tour de joueur
	BEGIN
		IF joueur= nom1 then 
			joueur:=nom2
		ELSE IF joueur=nom2 then
			joueur:=nom1;
	END;
END;
//-------------------------------DEBUT PROGRAMME-----------------------------
var
	allumette,allumax,choix:integer;
	nom1,nom2,joueur:string;
BEGIN
	randomize;
	allumette:=21;
	clrscr;

	writeln('JEU DE NIM');

	pseudo12(nom1,nom2);//les joueurs rentrent leurs pseudo
	joueur:=premier(joueur,nom1,nom2);//on choisi qui commence à jouer.
	writeln('le premier joueur sera : ',joueur);
	delay(2000);
//--------------------------------BOUCLE DE JEU------------------------------
	REPEAT
	BEGIN
		tourjoueur(nom1,nom2,choix,joueur,allumette,allumax); //tour de jeu
	END;
	UNTIL allumette =0; // quand il n'y a plus d'allumette le jeu est finit.
//----------------------------FIN DE BOUCLE DE JEU---------------------------
	writeln(joueur,' a perdu.');
	readln;
END.
//------------------------------- FIN PROGRAMME------------------------------