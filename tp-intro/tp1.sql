-- MABD TP1 SQL avec la base MONDIAL


-- -------------------- binome -------------------------
-- NOM
-- Prenom

-- NOM
-- Prenom
-- -----------------------------------------------------

-- pour se connecter à oracle:
-- sqlplus E1234567/E1234567@oracle
-- remplacer E12345657 par la lettre E suivie de votre numéro de login

set sqlbl on
set linesize 150

prompt schema de la table Country
desc Country

prompt schema de la table City
desc City

prompt schema de la table IsMember
desc IsMember

prompt schema de la table City
desc City

-- pour afficher un nuplet entier sur une seule ligne
column name format A15
column capital format A15
column province format A20

-- Requete 0

select * from Country where name = 'France';

-- Requete 10
prompt

select o.name, count(*), SUM(c.population)
from Organization o, Country c, isMember i
where i.country=c.code and i.organization=o.abbreviation
Group by o.name;





-- Requete 11
prompt 

select o.name, count(*), SUM(c.population)
from Organization o, Country c, isMember i
where i.country=c.code and i.organization=o.abbreviation
Group by o.name
having count(*)>100;

-- Requete 12
prompt

select c.name, m.name
from Country c, Mountain m, geo_mountain g, encompasses e
where e.continent= 'America' and e.country=c.code and g.country=c.code and g.mountain=m.name and m.height >= All (Select m.height From Mountain m, geo_mountain g, Country c2
      		   	     	 		     	 		      			    	     	    	    Where c2.code=c.code and g.country=c2.code and g.mountain=m.name);


-- Requete 17
prompt

select SUM(v.population)/SUM(v.area)
from Country v, Country p, Borders b
where (p.name='Algeria' or p.name='Libya') AND ( (b.country1=v.code and b.country2=p.code) OR (b.country2=v.code and b.country1=p.code));

-- Requete 18
prompt

--select distinct g.desert
--from geo_desert g
--where g.country IN (select v.code
  --    		   from Country v, Country p, Borders b
--		   where (p.name='Algeria' or p.name='Libya') AND ( (b.country1=v.code and b.country2=p.code) OR (b.country2=v.code and b.country1=p.code)));

--select SUM(d.area)
--from desert d
--where d.desert IN (select distinct g.desert
  --    	     	from geo_desert g
--		where g.country IN (select v.code
  --    		   from Country v, Country p, Borders b
--		   where (p.name='Algeria' or p.name='Libya') AND ( (b.country1=v.code and b.country2=p.code) OR (b.country2=v.code and b.country1=p.code))));


select SUM(v.population)/(SUM(v.area) - SUM(distinct pr.area))
from Country v, Country p, Borders b,geo_desert g, Province pr
where (p.name='Algeria' or p.name='Libya') AND ( (b.country1=v.code and b.country2=p.code) OR (b.country2=v.code and b.country1=p.code)) and g.country=v.code and g.province=pr.name;
