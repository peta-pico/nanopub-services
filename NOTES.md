# Features for next version

## Retractions

From retracted nanopublication (triple already in admin graph):

    <*NPURI*> npa:hasValidSignatureForPublicKey "*PUBLICKEY*"

From retraction nanopublication (triple needs to be added):

    <*NPURI*> npa:wasRetractedWithPublicKey "*PUBLICKEY*"


## General references

Whenever a nanopublication contains a potential trusty URI (or potential trusty URI plus suffix) then this reference should be added to the admin graph:

    <*NPURI1*> npa:refersToNanopub <*NPURI2*>


## Nanopub-to-nanopub references

Whenever a nanopublication contains a triple like this

    <*THISNP*> <*SOMEPREDICATE*> <*TRUSTYURI*>

we add this triple also to the admin graph.


## Something-to-nanopub references

...
