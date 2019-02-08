Nanopub Services
================

(under construction)

Count nanopubs (with admin graph):

    select (count(?n) as ?count) where {?n <http://purl.org/nanopub/admin/hasHeadGraph> ?h}

Count nanopubs (without admin graph):

    select (count(?n) as ?count) where {?n a <http://www.nanopub.org/nschema#Nanopublication>}

Show admin graph:

    select ?a ?b ?c where { graph <http://purl.org/nanopub/admin/graph> { ?a ?b ?c } } limit 1000

Fix for latest version of Virtuoso:

    docker exec -ti eb1c904891b0 bash -c 'echo "GRANT SPARQL_UPDATE to \"SPARQL\";" | isql-v -U dba -P dba'
