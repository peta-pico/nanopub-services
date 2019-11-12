# Features for next version

## Retractions

Get retraction info for nanopubs:

prefix np: <http://www.nanopub.org/nschema#>
prefix npa: <http://purl.org/nanopub/admin/>
prefix npx: <http://purl.org/nanopub/x/>
prefix xsd: <http://www.w3.org/2001/XMLSchema#>

select ?np ?retraction where {
  graph npa:graph {
    ?np npa:hasHeadGraph ?h .
    ?np npa:creationDay ?__day_iri .
    ?np npa:creationMonth ?__month_iri .
    ?np npa:creationYear ?__year_iri .
    ?np npa:hasValidSignatureForPublicKey ?_pubkey_xsd_string .
  }
  optional {
    graph npa:graph {
      ?retraction npa:hasHeadGraph ?rh .
      ?retraction npa:hasValidSignatureForPublicKey ?_pubkey_xsd_string .
    }
    graph ?rh {
      ?retraction np:hasAssertion ?ra .
    }
    graph ?ra {
      ?_somebody npx:retracts ?np .
    }
  }
}

Get only nanopubs that haven't been retracted:

prefix np: <http://www.nanopub.org/nschema#>
prefix npa: <http://purl.org/nanopub/admin/>
prefix npx: <http://purl.org/nanopub/x/>
prefix xsd: <http://www.w3.org/2001/XMLSchema#>

select ?np where {
  graph npa:graph {
    ?np npa:hasHeadGraph ?h .
    ?np npa:creationDay ?__day_iri .
    ?np npa:creationMonth ?__month_iri .
    ?np npa:creationYear ?__year_iri .
    ?np npa:hasValidSignatureForPublicKey ?_pubkey_xsd_string .
  }
  filter not exists {
    graph npa:graph {
      ?retraction npa:hasHeadGraph ?rh .
      ?retraction npa:hasValidSignatureForPublicKey ?_pubkey_xsd_string .
    }
    graph ?rh {
      ?retraction np:hasAssertion ?ra .
    }
    graph ?ra {
      ?_somebody npx:retracts ?np .
    }
  }
}


## General references

Whenever a nanopublication contains a potential trusty URI (or potential trusty URI plus suffix) then this reference should be added to the admin graph:

    <*NPURI1*> npa:refersToNanopub <*NPURI2*>


## Nanopub-to-nanopub references

Whenever a nanopublication contains a triple like this

    <*THISNP*> <*SOMEPREDICATE*> <*TRUSTYURI*>

we add this triple also to the admin graph.


## Something-to-nanopub references

...


## Full date

Add full date to admin graph.
