# Features for next version

## Full date

Add full date to npa:graph:

    <*THISNP*> dct:created "*DATETIME*"^^xsd:dateTime .

If no creation date is provided:

    <*THISNP*> dct:created "" .


## Nanopub-to-nanopub references

Whenever a nanopublication contains a triple like this

    <*THISNP*> <*SOMEPREDICATE*> <*TRUSTYURI*>

we add this triple also to the graph npa:networkGraph.


## General references

Whenever a nanopublication otherwise contains a potential trusty URI (or potential trusty URI plus suffix) then this reference should be added to the graph npa:networkGraph:

    <*THISNP*> npa:refersToNanopub <*OTHERNP*>

Except if it is the nanopub's own artifact code. Then this reference should be added to the graph npa:graph:

    <*THISNP*> npa:hasSubIri <*SUBURI*>

