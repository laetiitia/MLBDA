-- compléter l'entête 
-- ==================

-- NOM    :
-- Prénom :

-- NOM    :
-- Prénom :

-- Groupe :
-- binome :

-- ================================================

-- stockage des données : définition des relations
-- ====================

--Creation des tables
CREATE TABLE T_Matiere OF Matiere;
@compile

CREATE TABLE T_PieceB OF Piece_base;
@compile

CREATE TABLE T_PieceC OF Piece_compo
NESTED TABLE liste_p store as tab1;
@compile



-- instanciation des objets
-- ========================
INSERT INTO T_Matiere values(Matiere('bois',10,2));

INSERT INTO T_Matiere values(Matiere('fer',5,3));

INSERT INTO T_Matiere values(Matiere('ferrite',6,10));



Insert into T_PieceB values(P_Cylindre('canne',((Select REF(m) From T_Matiere m
       	    	     					Where m.nom='bois')),2,30));

Insert into T_PieceB values(P_Para('plateau',((Select REF(m) From T_Matiere m
       	    	     					Where m.nom='bois')),1,100,80));

Insert into T_PieceB values(P_Sphere('pied',((Select REF(m) From T_Matiere m
       	    	     					Where m.nom='bois')),30));

Insert into T_PieceB values(P_Sphere('boule',((Select REF(m) From T_Matiere m
       	    	     					Where m.nom='fer')),30));

Insert into T_PieceB values(P_Cylindre('clou',((Select REF(m) From T_Matiere m
       	    	     					Where m.nom='fer')),1,20));

Insert into T_PieceB values(P_Cylindre('aimant',((Select REF(m) From T_Matiere m
       	    	     					Where m.nom='ferrite')),2,5));


---Create or replace procedure insere_pieces_de_base as m2 ref Matiere;
---begin
---select ref(m) into m2 from T_Matiere m where m.nom='bois';
---insert into T_PieceB values(P_Cylindre('canne',m2,2,30));
---insert into T_PieceB values(P_Para('plateau',m2,1,100,80));
---insert into T_PieceB values(P_Sphere('pied',m2,30));
---end;
---@compile

---begin insere_pieces_de_base; end;
---@compile

Select * from T_PieceB;

Insert into T_PieceC values(Piece_compo('table',100,L_piece(
				Piece_quantite(1,(Select REF(b) From T_PieceB b
       	    	     					Where b.nom='plateau')),
				Piece_quantite(4,(Select REF(b) From T_PieceB b
       	    	     					Where b.nom='pied')),
				Piece_quantite(12,(Select REF(b) From T_PieceB b
       	    	     					Where b.nom='clou')))));

Insert into T_PieceC values(Piece_compo('billard',10,L_piece(
				Piece_quantite(1,(Select REF(b) From T_PieceB b
       	    	     					Where b.nom='table')),
				Piece_quantite(3,(Select REF(b) From T_PieceB b
       	    	     					Where b.nom='boule')),
				Piece_quantite(2,(Select REF(b) From T_PieceB b
       	    	     					Where b.nom='canne')))));

Select * from T_PieceC;

