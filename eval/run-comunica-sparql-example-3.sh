#!/bin/bash

# This comunica-sparql example completes in about 18 seconds whereas we get a
# time-out after 60 seconds when sent to Virtuoso directly:

comunica-sparql http://ldf.nanopubs.lod.labs.vu.nl/np "
prefix np: <http://www.nanopub.org/nschema#>
prefix npa: <http://purl.org/nanopub/admin/>
prefix dct: <http://purl.org/dc/terms/>

select ?np ?date where {
  graph npa:graph {
    ?np npa:hasHeadGraph ?h .
    ?np npa:creationYear <http://purl.org/nanopub/admin/date/2019> .
    ?np dct:created ?date .
  }
  graph ?h {
    ?np ?graphpred ?g .
  }
  graph ?g {
    ?subj <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?obj .
  }
} limit 10
"
