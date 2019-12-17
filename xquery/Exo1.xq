(:<name>
  {for $n in //people/person
    where $n/@id= "person0"
    return $n/name/text()
}
</name>
:)

(:
for $r in //open_auctions/auction[position()<4]
return <result id="{$r/@id}">
   "{$r/initial}"
</result>
:)
(:
for $r in //open_auctions/auction[position()<4]
return <result id="{$r/@id}">
         <first>"{$r/bidder[1]/increase/text()}"</first>
         <last>"{$r/bidder[last()]/increase/text()}"</last>
       </result>
:)
(:
for $r in //closed_auctions/auction/price
  where $r>480
  return $r
:)
(:
for $r in //regions/africa/item
  return $r/name
:)
(:
for $r in //regions/africa/item,$a in //closed_auctions/auction
  where $a/itemref/@item=$r/@id
  return <res>
  {$r/name}
  {$a/price}
  
</res>
:)

for $p in //people/person
return if(exists($p/homepage) )then 0 else 1  

