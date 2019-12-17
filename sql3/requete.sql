-- compl�ter l'ent�te 
-- ==================

-- NOM    :
-- Pr�nom :

-- NOM    :
-- Pr�nom :

-- Groupe :
-- binome :

-- ================================================
-- R1.	Quel est le nom et le prix au kilo des mati�res ?
prompt 'R1:'

Select m.nom, m.prix_kilo
From T_Matiere m;


-- R2.	Quel est le nom des mati�res dont le prix au kilo est inf�rieur � 5 EUR ?
prompt 'R2:'
Select m.nom, m.prix_kilo
From T_Matiere m
Where m.prix_kilo<=5;


-- R3.	Quelles sont les pi�ces de base en bois ?
prompt 'R3:'
Select p.nom
From T_PieceB p
Where p.mat=((Select REF(m) From T_Matiere m Where m.nom='bois'));  


-- R4.	Quel est le nom des mati�res dont le libell� contient "fer" ?
prompt 'R4:'
Select nom
From T_Matiere
Where nom like '%fer%';


-- R5.	Donner le nom des pi�ces de base formant la pi�ce nomm�e 'billard'
prompt 'R5:'
Select deref(value(l).p).nom
From T_PieceC c,table(c.liste_p) l
Where c.nom='billard';

Select * from T_PieceC;

-- R6.	Donner le nom de chaque mati�re avec son nombre de pi�ces de bases.
prompt 'R6:'


-- R7.	Quelles sont les mati�res pour lesquelles il existe au moins 3 pi�ces de base ?
prompt 'R7:'


