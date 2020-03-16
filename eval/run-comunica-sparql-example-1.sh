#!/bin/bash

# This comunica-sparql example works:

comunica-sparql http://ldf.nanopubs.lod.labs.vu.nl/np "
prefix np: <http://www.nanopub.org/nschema#>
prefix npx: <http://purl.org/nanopub/x/>
prefix npa: <http://purl.org/nanopub/admin/>
prefix dct: <http://purl.org/dc/terms/>
prefix dce: <http://purl.org/dc/elements/1.1/>
prefix pav: <http://purl.org/pav/>
#prefix pav1: <http://swan.mindinformatics.org/ontologies/1.2/pav/>
#prefix pav2: <http://purl.org/pav/2.0/>
prefix foaf: <http://xmlns.com/foaf/0.1/>

select ?user ?intronp ?date ?pubkey where {
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
  }
  filter not exists {
    graph npa:graph {
      ?retraction npa:hasHeadGraph ?rh .
      ?retraction npa:hasValidSignatureForPublicKey ?pubkey .
    }
    graph ?rh {
      ?retraction np:hasAssertion ?ra .
    }
    graph ?ra {
      ?somebody npx:retracts ?intronp .
    }
  }
  filter not exists {
    graph npa:graph {
      ?superseding npa:hasHeadGraph ?sh .
      ?superseding npa:hasValidSignatureForPublicKey ?pubkey .
    }
    graph ?sh {
      ?superseding np:hasPublicationInfo ?si .
    }
    graph ?si {
      ?superseding npx:supersedes ?intronp .
    }
  }
}
order by ?user desc(?date)
"
