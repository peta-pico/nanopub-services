Show admin graph:

    select ?a ?b ?c where { graph <http://purl.org/nanopub/admin/graph> { ?a ?b ?c } } limit 1000

Fix for latest version of Virtuoso:

    $ docker pull tenforce/virtuoso:latest
    $ IMG=$(docker run -d tenforce/virtuoso)
    $ docker exec -ti $IMG bash -c 'echo "GRANT SPARQL_UPDATE to \"SPARQL\";" | isql-v -U dba -P dba'
    $ docker commit $IMG tkuhn/virtuoso
    $ docker push tkuhn/virtuoso:latest

    $ docker exec -it $IMG bash
    $ docker commit -c 'CMD ["bash", "echo \"GRANT SPARQL_UPDATE to \\\"SPARQL\\\";\" | isql-v -U dba -P dba"]' $IMG tkuhn/virtuoso

    $ ( head -n -1 /virtuoso.sh ; echo 'virtuoso-t +wait && ( echo "GRANT SPARQL_UPDATE to \"SPARQL\";" | isql-v -U dba -P dba )' ; echo "kill \"\$(ps aux | grep '[v]irtuoso-t' | awk '{print $2}')\"" ; tail -1 /virtuoso.sh ) > ./virtuoso.new.sh
    $ mv ./virtuoso.new.sh ./virtuoso.sh

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
