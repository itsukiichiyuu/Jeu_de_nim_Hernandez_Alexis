{programme jeu_de_nim

TYPE 
	choix = ENREGISTREMENT
		reste: ENTIER // le reste des allumettes dans chaque colonne.
	FIN ENREGISTREMENT

	tabcolonne = TABLEAU [1..4] DE choix

//BUT:Enregistrer le nom des joueurs.
//ENTREE: deux chaines de caractères.
//SORTIE: deux variable remplies par les chaines de caractères.
PROCEDURE pseudo12(var nom1:CHAINE var nom2:CHAINE)
DEBUT
	REPETER
		ECRIRE('JOUEUR 1 ENTREZ VOTRE NOM')
		LIRE(nom1)
	JUSQUA (LONGUEUR(nom1)>0) ET (LONGUEUR(nom1)<15)

	REPETER
		ECRIRE("JOUEUR 2 ENTREZ VOTRE NOM")
		LIRE(nom2)
	JUSQUA (LONGUEUR(nom2)>0) ET (LONGUEUR(nom2)<15)
FINPROCEDURE

//BUT:Choisir un joueur qui jouera en premier au hasard.
//ENTREE:Une chaine de caractère du nom du joueur et du joueur 2 .
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

//BUT: afficher les allumettes restantes en bas de l'écran.
//ENTREE: le nombre d'allumettes par ligne.
//SORTIE: l'affichage des allumettes.
PROCEDURE affichage(colonne:tabcolonne allumette:ENTIER)
var
	i,j:ENTIER
DEBUT
	POUR i<-1 A 4 FAIRE
		POUR j<-1 A colonne[i].reste FAIRE
			ALLER A(15+j,15+i)
			ECRIRE("| ")
		FINPOUR

		ALLER A(13,15+i)
		ECRIRE(i)
	FINPOUR
	ALLER A(20,15)
	ECRIRE("il reste "& allumette &" allumettes.")
	ALLER A(1,1)
FINPROCEDURE

//BUT: Réaliser le tour de jeux du joueur courant.
//ENTREE: la chaine de caractère du joueur actuel et de l'ia,l'entier du nombre d'allumettes restantes par colonne. 
//SORTIE: L'ENTIER d'allumettes restantes dans chaque colonnes, l'ENTIER saisie par l'utilisateur.
PROCEDURE tourjoueur(var colonne: tabcolonne nom1:CHAINE nom2: CHAINE var nombre:ENTIER var joueur:CHAINE var allumette:ENTIER var allumax:ENTIER)
var
	i:ENTIER
DEBUT

	affichage(colonne,allumette)
	ECRIRE(joueur &" quelle colonne choisissez-vous ?")
	REPETER
		LIRE(i)
	JUSQUA (colonne[i].reste<>0) ET (i<5) ET (i>0) 

	ECRIRE(joueur & " combien d''allumettes souhaitez-vous enlever ?")

	SI colonne[i].reste-3<0 ALORS //s'il reste moins de 3 allumettes on affiche le nombre d'allumettes possible à enlever(allumax).
		allumax<-colonne[i].reste
		ECRIRE("Choisissez un nombre entre 1 et "& allumax &".")
		ECRIRE("Il reste "& colonne[i].reste &" allumettes dans cette colonne.")
		REPETER
			LIRE(nombre)
		JUSQUA (nombre <= allumax) ET (nombre > 0)

	SINON //s'il reste plus de 3 allumettes le joueur courant peux en retirer entre 1 et 3.
		ECRIRE("Choisissez un nombre entre 1 et 3.")
		ECRIRE("Il reste "& colonne[i].reste &" allumettes dans cette colonne.")
		REPETER
			LIRE(nombre)
		JUSQUA (nombre <= 3) ET (nombre > 0)
	FINSI

	colonne[i].reste<-colonne[i].reste-nombre
	allumette<-allumette-nombre//on soustrait le choix du joueur à allumette.
	SI allumette>0 ALORS
	//changement de joueur.
		SI joueur= nom1 ALORS 
			joueur<-nom2
		SINON SI joueur=nom2 ALORS
			joueur<-nom1
		FINSI
	FINSI
FINPROCEDURE

//-------------------------------DEBUT PROGRAMME-----------------------------
var
	allumette,allumax,nombre:ENTIER
	nom1,nom2,joueur:CHAINE
	colonne:tabcolonne
DEBUT
	allumette<-16//on initialise le nombre total d'allumettes.

	//on initialise les allumettes dans les colonnes.
	colonne[1].reste<-1
	colonne[2].reste<-3
	colonne[3].reste<-5
	colonne[4].reste<-7

	ECRIRE("JEU DE NIM")

	pseudo12(nom1,nom2)
	joueur<-premier(joueur,nom1,nom2)//on lance la procedure qui choisis le joueur commencant aléatoirement.
	ECRIRE("le premier joueur sera : " & joueur)
//--------------------------------BOUCLE DE JEU------------------------------
	REPETER
		tourjoueur(colonne,nom1,nom2,nombre,joueur,allumette,allumax)
	JUSQUA allumette =0
//----------------------------FIN DE BOUCLE DE JEU---------------------------
	ECRIRE(joueur &" a perdu.")
FIN.
//------------------------------- FIN PROGRAMME------------------------------
}

program jeu_de_nim;

uses crt;

TYPE 
	choix = RECORD
		reste: integer; // le reste des allumettes dans chaque colonne.
	END;

	tabcolonne = array [1..4] of choix;

//BUT:Enregistrer le nom des joueurs.
//ENTREE: deux chaines de caractères.
//SORTIE: deux variable remplies par les chaines de caractères.
PROCEDURE pseudo12(var nom1:string; var nom2:string);
BEGIN
	REPEAT
	BEGIN
		writeln('JOUEUR 1 ENTREZ VOTRE NOM');
		readln(nom1);
	END;
	UNTIL (length(nom1)>0) AND (length(nom1)<15);

	REPEAT
	BEGIN
		writeln('JOUEUR 2 ENTREZ VOTRE NOM');
		readln(nom2);
	END;
	UNTIL (length(nom2)>0) AND (length(nom2)<15);
END;

//BUT:Choisir un joueur qui jouera en premier au hasard.
//ENTREE:Une chaine de caractère du nom du joueur et du joueur 2 .
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

//BUT: afficher les allumettes restantes en bas de l'écran.
//ENTREE: le nombre d'allumettes par ligne.
//SORTIE: l'affichage des allumettes.
PROCEDURE affichage(colonne:tabcolonne; allumette:integer);
var
	i,j:integer;
BEGIN
	FOR i:=1 to 4 do
	BEGIN
		FOR j:=1 to colonne[i].reste do
		BEGIN
			gotoxy(15+j,15+i);
			write('| ');
		END;
		gotoxy(13,15+i);
		write(i);
	END;
	gotoxy(20,15);
	writeln('il reste ',allumette,' allumettes.');
	gotoxy(1,1);
END;

//BUT: Réaliser le tour de jeux du joueur courant.
//ENTREE: la chaine de caractère du joueur actuel et de l'ia,l'entier du nombre d'allumettes restantes par colonne. 
//SORTIE: L'ENTIER d'allumettes restantes dans chaque colonnes, l'ENTIER saisie par l'utilisateur.
PROCEDURE tourjoueur(var colonne: tabcolonne; nom1:string; nom2: string; var nombre:integer;var joueur:string; var allumette:integer; var allumax:integer);
var
	i:integer;
BEGIN
	clrscr;
	affichage(colonne,allumette);
	writeln(joueur,' quelle colonne choisissez-vous ?');
	REPEAT
	BEGIN
		readln(i);
	END;
	UNTIL (colonne[i].reste<>0) and (i<5) and (i>0) ;

	writeln(joueur,' combien d''allumettes souhaitez-vous enlever ?');

	IF colonne[i].reste-3<0 then //s'il reste moins de 3 allumettes on affiche le nombre d'allumettes possible à enlever(allumax).
	BEGIN
		allumax:=colonne[i].reste;
		writeln('Choisissez un nombre entre 1 et ',allumax,'.');
		writeln('Il reste ',colonne[i].reste,' allumettes dans cette colonne.');
		REPEAT
			readln(nombre);
		UNTIL (nombre <= allumax) AND (nombre > 0);
	END
	ELSE //s'il reste plus de 3 allumettes le joueur courant peux en retirer entre 1 et 3.
	BEGIN
		writeln('Choisissez un nombre entre 1 et 3.');
		writeln('Il reste ',colonne[i].reste,' allumettes dans cette colonne.');
		REPEAT
			readln(nombre);
		UNTIL (nombre <= 3) AND (nombre > 0);
	END;
	colonne[i].reste:=colonne[i].reste-nombre;
	allumette:=allumette-nombre;//on soustait le choix du joueur à allumette.
	IF allumette>0 then
	BEGIN //changement de joueur.
		IF joueur= nom1 then 
			joueur:=nom2
		ELSE IF joueur=nom2 then
			joueur:=nom1;
	END;
END;
//-------------------------------DEBUT PROGRAMME-----------------------------
var
	allumette,allumax,nombre:integer;
	nom1,nom2,joueur:string;
	colonne:tabcolonne;
BEGIN
	randomize;
	allumette:=16;//on initialise le nombre total d'allumettes.
	clrscr;

	//on initialise les allumettes dans les colonnes.
	colonne[1].reste:=1;
	colonne[2].reste:=3;
	colonne[3].reste:=5;
	colonne[4].reste:=7;

	writeln('JEU DE NIM');

	pseudo12(nom1,nom2);
	joueur:=premier(joueur,nom1,nom2);//on lance la procedure qui choisis le joueur commencant aléatoirement.
	writeln('le premier joueur sera : ',joueur);
	delay(2000);
//--------------------------------BOUCLE DE JEU------------------------------
	REPEAT
	BEGIN
		tourjoueur(colonne,nom1,nom2,nombre,joueur,allumette,allumax);
	END;
	UNTIL allumette =0;
//----------------------------FIN DE BOUCLE DE JEU---------------------------
	writeln(joueur,' a perdu.');
	readln;
END.
//------------------------------- FIN PROGRAMME------------------------------