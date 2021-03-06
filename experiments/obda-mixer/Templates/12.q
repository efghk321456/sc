PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rev: <http://purl.org/stuff/rev#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX bsbm: <http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/>
PREFIX bsbm-export: <http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/export/>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

SELECT ?offer ?productURI ?productlabel ?vendorURI ?vendorname ?offerURL ?price ?deliveryDays ?validTo
WHERE {
 ?offer bsbm:offerId ?id .
 FILTER ( ?id <= ${1:offer.nr:none})
 ?offer bsbm:product ?productURI .
 ?productURI rdfs:label ?productlabel .
 ?offer bsbm:vendor ?vendorURI .
 ?vendorURI rdfs:label ?vendorname .
 ?vendorURI foaf:homepage ?vendorhomepage .
 ?offer bsbm:offerWebpage ?offerURL .
 ?offer bsbm:price ?price .
 ?offer bsbm:deliveryDays ?deliveryDays .
 ?offer bsbm:validTo ?validTo
}
