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

CREATE TYPE BODY P_Cube AS overriding member function volume return number is
	  BEGIN
		return cote*cote*cote;
	  END;
END;
@compile

CREATE TYPE BODY P_Sphere AS overriding member function volume return number is
	  BEGIN
		return rayon*rayon*rayon*3.14159*4/3;
	  END;
END;
@compile


CREATE TYPE BODY P_Cylindre AS overriding member function volume return number is
	  BEGIN
		return diametre/2*diametre/2*hauteur*3.14159;
	  END;
END;
@compile

CREATE TYPE BODY P_Para AS overriding member function volume return number is
	  BEGIN
		return hauteur*largeur*profondeur ;
	  END;
END;
@compile


create type body Piece_Base as
  overriding member function volume return Number is
  begin
    return 1;
  end;
  overriding member function nb_piece_base return Number is
  begin
    return 1;
  end;
  overriding member function masse return Number is
  m Number;
  begin
    select deref(self.mat).masse_vol into m from dual;
    return m * volume();
  end;
  overriding member function prix return Number is
  p Number;
  begin
    select deref(self.mat).prix into p from dual;
    return p * self.masse();
  end;
end;
@compile;

CREATE TYPE BODY Piece_Base AS
overriding member function volume return number is
BEGIN
return;
END;
overriding member function masse return number is
	  m Matiere;
	  BEGIN
	  	Select DEREF(mat) into m FROM dual;
		return volume()*m.masse_vol;
	  END;
overriding member function prix return number is
	  m Matiere;
			
	  BEGIN
		Select DEREF(mat) into m FROM dual;
		return m.prix_kilo*masse();
	  END;
overriding member function nb_piece_base return number is
					
	  BEGIN
		return 1;			
	  END;
overriding member function compose_de return varchar2 is
	  BEGIN
		return nom;
	  END;
END;
@compile



CREATE TYPE BODY Piece_Compo AS

--methode nb_piece_base
	  overriding member function nb_piece_base return number is
	  BEGIN
		Select SUM(value(l).quantite*value(l).p.nb_piece_base()) into val
		From TABLE(liste_p) l
		return val;
	  END;

--methode masse
	  overriding member function masse return number is
	  BEGIN
		Select SUM(value(c).p.masse()*value(c).quantite) into v
		From TABLE(liste_p) c
		return v;
	  END;
	  
--methode prix
	  overriding member function prix return number is
	  BEGIN
		Select SUM(value(c).p.prix()*value(c).quantite) into v
		From TABLE(liste_p) c
		return v;
	  END;

--methode compose_de
	  overriding member function compose_de return T_noms is
	  liste T_noms;
	  BEGIN
		Select value(l) BULK COLLECT into liste
		From TABLE(liste_p) c,TABLE(value(c).p.compose_de()) l;
		return liste;
	  END;
		
END;
