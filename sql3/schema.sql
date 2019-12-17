-- compléter l'entête 
-- ==================

-- NOM    :
-- Prénom :

-- NOM    :
-- Prénom :

-- Groupe :
-- binome :

-- ================================================

set sqlbl on


-- nettoyer le compte
@vider

-- Définition des types de données

prompt essai
--CAO

CREATE TYPE Matiere as Object(
nom VARCHAR2(20),
prix_kilo NUMBER,
masse_vol NUMBER
);
@compile


CREATE TYPE T_noms as table of VARCHAR2(20);
@compile

CREATE TYPE Piece as Object(
nom VARCHAR2(20),
--contenu_dans L_Pc,
member function masse return number,
member function prix return number,
member function nb_piece_base return number,
member function compose_de return T_noms
)not instantiable not final;
@compile

CREATE TYPE Piece_base UNDER Piece(
mat ref Matiere,
member function volume return number,
overriding member function masse return number,
overriding member function prix return number,
overriding member function nb_piece_base return number
--overriding member function compose_de return T_noms
)not instantiable not final;
@compile

CREATE TYPE P_Cube under Piece_base(
cote NUMBER,
overriding member function volume return number);
@compile

CREATE TYPE P_Sphere under Piece_base(
rayon NUMBER,
overriding member function volume return number);
@compile

CREATE TYPE P_Cylindre under Piece_base(
diametre NUMBER,
hauteur NUMBER,
overriding member function volume return number);
@compile

CREATE TYPE P_Para under Piece_base(
hauteur NUMBER,
largeur NUMBER,
profondeur NUMBER,
overriding member function volume return number);
@compile

CREATE TYPE Piece_quantite as OBJECT (
quantite NUMBER,
p ref Piece);
@compile

CREATE TYPE L_Piece as TABLE OF Piece_quantite;
@compile



CREATE TYPE Piece_compo UNDER Piece(
cout_assemble NUMBER,
liste_p L_Piece,
overriding member function masse return number,
overriding member function prix return number,
overriding member function nb_piece_base return number,
overriding member function compose_de return T_noms);
@compile

CREATE TYPE Piece_composite_quantite as OBJECT (
piece ref Piece_compo,
quantite Number);
@compile

CREATE TYPE L_Pc as table of Piece_composite_quantite;
@compile

ALTER TYPE Piece
ADD ATTRIBUTE contenu_dans L_Pc CASCADE;
@compile

-- liste de tous les types créés
@liste



