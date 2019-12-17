(:Question7:)
(:
<bib>
{for $b in //book
where $b/@year > 1991 and $b/publisher = "Addison-Wesley"
order by $b/title ascending
return 
<book year = "{$b/@year}">
  {$b/title}
</book>
}
</bib>:)

(:Question8:)
<book>
{for $b in //book
where $b/*=
return $b
  
}
</book>