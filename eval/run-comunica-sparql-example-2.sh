#!/bin/bash

# This comunica-sparql example doesn't work:

comunica-sparql http://ldf.nanopubs.lod.labs.vu.nl/np "
prefix np: <http://www.nanopub.org/nschema#>
prefix npx: <http://purl.org/nanopub/x/>
prefix npa: <http://purl.org/nanopub/admin/>
prefix dct: <http://purl.org/dc/terms/>
prefix foaf: <http://xmlns.com/foaf/0.1/>

select ?user ?name ?intronp ?date ?pubkey where {
  graph npa:graph {
    ?intronp npa:hasHeadGraph ?h .
    ?intronp npa:hasValidSignatureForPublicKey ?pubkey .
    ?intronp dct:created ?date .
  }
  graph ?h {
    ?intronp np:hasAssertion ?a .
  }
  graph ?a {
    ?keydeclaration npx:declaredBy ?user .
    optional {
      ?user foaf:name ?name .
    }
  }
}
"
