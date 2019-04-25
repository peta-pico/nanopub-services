Show admin graph:

    select ?a ?b ?c where { graph <http://purl.org/nanopub/admin/graph> { ?a ?b ?c } } limit 1000

Testing queries...:

prefix np: <http://www.nanopub.org/nschema#>
prefix npx: <http://purl.org/nanopub/x/>
prefix npa: <http://purl.org/nanopub/admin/>
prefix dce: <http://purl.org/dc/elements/1.1/>
prefix dct: <http://purl.org/dc/terms/>
prefix pav: <http://purl.org/pav/>
prefix prov: <http://www.w3.org/ns/prov#>

select ?np ?date where {
  graph npa:graph {
    ?np npa:hasHeadGraph ?h ;
      npa:creationDay "20140919"^^xsd:string .
  }
  graph ?h {
    ?np np:hasPublicationInfo ?i .
  }
  graph ?i {
    ?np (dct:created|pav:createdOn|prov:generatedAtTime) ?date .
  }
}
order by desc(?date)
limit 1000

prefix np: <http://www.nanopub.org/nschema#>
prefix npx: <http://purl.org/nanopub/x/>
prefix npa: <http://purl.org/nanopub/admin/>
prefix dce: <http://purl.org/dc/elements/1.1/>
prefix dct: <http://purl.org/dc/terms/>
prefix pav: <http://purl.org/pav/>
prefix prov: <http://www.w3.org/ns/prov#>

select ?np ?date where {
  graph npa:graph {
    ?np npa:hasHeadGraph ?h ;
      npa:creationMonth "201409"^^xsd:string .
  }
  graph ?h {
    ?np np:hasPublicationInfo ?i .
  }
  graph ?i {
    ?np (dct:created|pav:createdOn|prov:generatedAtTime) ?date .
  }
}
limit 1000
