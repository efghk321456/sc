PREFIX rev: <http://purl.org/stuff/rev#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX bsbm: <http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

SELECT ?p ?mbox_sha1sum ?country ?r ?product ?title
WHERE {
 <http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/instances/dataFromRatingSite/Review${1:review.nr:percent}> rev:reviewer ?p .
 ?p foaf:name ?name .
 ?p foaf:mbox_sha1sum ?mbox_sha1sum .
 ?p bsbm:country ?country .
 ?r rev:reviewer ?p .
 ?r bsbm:reviewFor ?product .
 ?r dc:title ?title .
}