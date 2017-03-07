{//BUT: Jouer au jeu de nim avec une ia.
//ENTREE: de multiple ENTIERS pour le nombre d'allumettes choisies par le joueur, une chaine de caractères pour le nom du joueur.
//SORTIE: L' ENTIER du nombre d'allumettes restant a chaque tour, Une chaine de caractère determinant le perdant.
programme jeu_de_nim_ia

CONS

	nom2='IA' // Le nom du joueur 2, l'ia.

//BUT:Enregistrer le nom du joueur.
//ENTREE: Une chaine de caractères.
//SORTIE: La meme chaine de caractère.
PROCEDURE pseudo12(var nom1:CHAINE)
DEBUT
	REPETER
		ECRIRE 'JOUEUR 1 ENTREZ VOTRE NOM'
		LIRE nom1
	JUSQUA (LONGUEUR(nom1)>0) ET (LONGUEUR(nom1)<10)
FINPROCEDURE

//BUT:Choisir un joueur qui jouera en premier au hasard.
//ENTREE:Une chaine de caractère du nom du joueur et du joueur 2 (l'ia).
//SORTIE:Une des deux chaines de caractères précédente.
FONCTION premier(var joueur:CHAINE nom1:CHAINE):CHAINE
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
PROCEDURE tourjoueur(nom1:CHAINE var choix:ENTIER var joueur:CHAINE var allumette:ENTIER var allumax:ENTIER)
var
	i:ENTIER
DEBUT
	
	SI joueur=nom1 ALORS
		ECRIRE joueur &' combien d''allumettes souhaitez-vous enlever ?'
		SI allumette-3<0 ALORS //s'il reste moins de 3 allumettes on affiche le nombre d'allumettes possible à enlever(allumax).
			allumax<-allumette
			ECRIRE 'Choisissez un nombre entre 1 et '& allumax & '.'
			ECRIRE 'Il reste '& allumette &' allumettes.'
			REPETER
				LIRE choix
			JUSQUA (choix < allumax + 1) ET (choix > 0)
		SINON //s'il reste plus de 3 allumettes le joueur courant peux en retirer entre 1 et 3.
			ECRIRE 'Choisissez un nombre entre 1 et 3.'
			ECRIRE 'Il reste '& allumette &' allumettes.'
			REPETER
				LIRE choix)
			JUSQUA (choix < 4) ET (choix > 0)

		allumette<-allumette-choix //on soustait le choix du joueur à allumette.
		ECRIRE 'il reste '& allumette &' allumettes.

	//-------------------------TOUR IA------------------------------
	SINON
		SI ((allumette-1) MODULO 4 = 0) ALORS
			REPETER
				choix<-random(3)+1//si le nombre est un multiple de (4)+1 l'ordinateur choisis au hasard.
			JUSQUA ((allumette-choix) >=0)
		SINON
			REPETER
				choix<-random(3)+1
			JUSQUA ((allumette-1-choix) MODULO 4 =0) ET ((allumette-choix) >=0) //sinon l'ordinateur coince le joueur avec la technique au dessus
		FINSI

		allumette<-allumette-choix//on soustrait le choix du joueur à allumette.
		ECRIRE joueur &' va enlever '& choix & ' allumettes.'
	
	FINSI
//--------------------------FIN TOUR IA-------------------------------
	SI allumette>0 ALORS
		SI joueur= nom1 ALORS 
			joueur<-nom2
		SINON SI joueur=nom2 ALORS//on change le tour de joueur
			joueur<-nom1
		FINSI
	FINSI
FINPROCEDURE

//-------------------------------DEBUT PROGRAMME-----------------------------

var
	allumette,allumax,choix:ENTIER
	nom1,joueur:CHAINE

DEBUT

	allumette<-21
	
	ECRIRE 'JEU DE NIM'

	pseudo12(nom1)//le joueur entre son pseudo.
	joueur<-premier(joueur,nom1)//on choisi qui commence à jouer.
	ECRIRE 'le premier joueur sera : ' & joueur


//--------------------------------BOUCLE DE JEU------------------------------

	REPETER
		tourjoueur(nom1,choix,joueur,allumette,allumax)// le tour de jeu.
	JUSQUA allumette =0 // quand il n'y a plus d'allumette le jeu est finit.

//----------------------------FIN DE BOUCLE DE JEU---------------------------

	ECRIRE joueur &' a perdu.'

FIN.

//------------------------------- FIN PROGRAMME------------------------------
}

//BUT: Jouer au jeu de nim avec une ia.
//ENTREE: de multiple ENTIERS pour le nombre d'allumettes choisies par le joueur, une chaine de caractères pour le nom du joueur.
//SORTIE: L' ENTIER du nombre d'allumettes restant a chaque tour, Une chaine de caractère determinant le perdant.
program jeu_de_nim_ia;

uses crt;

CONST

	nom2='IA'; // Le nom du joueur 2, l'ia.

//BUT:Enregistrer le nom du joueur.
//ENTREE: Une chaine de caractères.
//SORTIE: La meme chaine de caractère.
PROCEDURE pseudo12(var nom1:string);
BEGIN
	REPEAT
	BEGIN
		writeln('JOUEUR 1 ENTREZ VOTRE NOM');
		readln(nom1);
	END;
	UNTIL (length(nom1)>0) AND (length(nom1)<10);
END;

//BUT:Choisir un joueur qui jouera en premier au hasard.
//ENTREE:Une chaine de caractère du nom du joueur et du joueur 2 (l'ia).
//SORTIE:Une des deux chaines de caractères précédente.
FUNCTION premier(var joueur:string; nom1:string):string;
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
PROCEDURE tourjoueur(nom1:string; var choix:integer;var joueur:string; var allumette:integer; var allumax:integer);
var
	i:integer;
BEGIN
	clrscr;
	if joueur=nom1 then
	BEGIN
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
		allumette:=allumette-choix;//on soustait le choix du joueur à allumette.
		writeln('il reste ',allumette,' allumettes.');
		delay(1000);
	END
	//-------------------------TOUR IA------------------------------
	ELSE
	BEGIN
		if ((allumette-1) mod 4 = 0) then
		BEGIN
			REPEAT
			BEGIN
				choix:=random(3)+1;//si le nombre est un multiple de (4)+1 l'ordinateur choisis au hasard.
			END;
			UNTIL ((allumette-choix) >=0);
		END
		ELSE
		BEGIN
			REPEAT
			BEGIN
				choix:=random(3)+1;
			END;
			UNTIL ((allumette-1-choix) mod 4 =0) AND ((allumette-choix) >=0);//sinon l'ordinateur coince le joueur avec la technique au dessus
		END;
		allumette:=allumette-choix;//on soustait le choix du joueur à allumette.
		writeln(joueur,' va enlever ', choix,' allumettes.');
		delay(1500);
	END;
//--------------------------FIN TOUR IA-------------------------------
	IF allumette>0 then
	BEGIN
		IF joueur= nom1 then 
			joueur:=nom2
		ELSE IF joueur=nom2 then//on change le tour de joueur
			joueur:=nom1;
	END;
END;

//-------------------------------DEBUT PROGRAMME-----------------------------

var
	allumette,allumax,choix:integer;
	nom1,joueur:string;

BEGIN

	randomize;
	allumette:=21;
	clrscr;

	writeln('JEU DE NIM');

	pseudo12(nom1);//le joueur entre son pseudo.
	joueur:=premier(joueur,nom1);//on choisi qui commence à jouer.
	writeln('le premier joueur sera : ',joueur);
	delay(2000);

//--------------------------------BOUCLE DE JEU------------------------------

	REPEAT
	BEGIN
		tourjoueur(nom1,choix,joueur,allumette,allumax);// le tour de jeu.
	END;
	UNTIL allumette =0;// quand il n'y a plus d'allumette le jeu est finit.

//----------------------------FIN DE BOUCLE DE JEU---------------------------

	writeln(joueur,' a perdu.');
	readln;

END.

//------------------------------- FIN PROGRAMME------------------------------