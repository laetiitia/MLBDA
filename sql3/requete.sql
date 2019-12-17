-- compléter l'entête 
-- ==================

-- NOM    :
-- Prénom :

-- NOM    :
-- Prénom :

-- Groupe :
-- binome :

-- ================================================
-- R1.	Quel est le nom et le prix au kilo des matières ?
prompt 'R1:'

Select m.nom, m.prix_kilo
From T_Matiere m;


-- R2.	Quel est le nom des matières dont le prix au kilo est inférieur à 5 EUR ?
prompt 'R2:'
Select m.nom, m.prix_kilo
From T_Matiere m
Where m.prix_kilo<=5;


-- R3.	Quelles sont les pièces de base en bois ?
prompt 'R3:'
Select p.nom
From T_PieceB p
Where p.mat=((Select REF(m) From T_Matiere m Where m.nom='bois'));  


-- R4.	Quel est le nom des matières dont le libellé contient "fer" ?
prompt 'R4:'
Select nom
From T_Matiere
Where nom like '%fer%';


-- R5.	Donner le nom des pièces de base formant la pièce nommée 'billard'
prompt 'R5:'
Select deref(value(l).p).nom
From T_PieceC c,table(c.liste_p) l
Where c.nom='billard';

Select * from T_PieceC;

-- R6.	Donner le nom de chaque matière avec son nombre de pièces de bases.
prompt 'R6:'


-- R7.	Quelles sont les matières pour lesquelles il existe au moins 3 pièces de base ?
prompt 'R7:'


