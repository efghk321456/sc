PREFIX bsbm-inst: <http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/instances/>
PREFIX bsbm: <http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT ?product ?label
WHERE {
 ?product rdfs:label ?label .
 ?product a bsbm:Product .
 ?product bsbm:productFeature bsbm-inst:ProductFeature${1:productfeatureproduct.nr:percent} .
 ?product bsbm:productPropertyNumeric1 ?p1 .
 # FILTER ( ?p1 > {1:product.propertynum1:none} )
 ?product bsbm:productPropertyNumeric3 ?p3 .
 # FILTER ( ?p3 < {1:product.propertynum3:none} )
 OPTIONAL {
 ?product bsbm:productFeature bsbm-inst:ProductFeature${2:productfeatureproduct.nr:percent} .
 ?product rdfs:label ?testVar }
 FILTER (!bound(?testVar))
}

## Filters eliminated, to avoid empty query results