PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX schema: <https://schema.org/>
PREFIX bf: <http://id.loc.gov/ontologies/bibframe/>
PREFIX mo: <https://purl.org/ontology/modalia#> 
PREFIX ec: <https://github.com/tibonto/educor#> 

CONSTRUCT {
  ?resource a schema:LearningResource ;
            schema:name ?title ;
            schema:description ?description ;
            schema:inLanguage ?language ;
            schema:keywords ?keywords ;
            schema:license ?license ;
            schema:url ?url ;
            schema:author ?author ;
            schema:dateCreated ?dateCreated ;
            schema:timeRequired ?timeRequired ;
            schema:identifier ?identifier ;
            schema:learningResourceType ?attachment ;
            schema:audience ?targetGroup ;
			schema:isAccessibleForFree ?free ;
			schema:educationalLevel ?proficiencyLevel ;
			schema:provider ?providerName .
            #--bf:contribution ?contribution .

  #?contribution a bf:Contribution ;
    #            bf:role ?role ;
     #           bf:agent ?agent .  

  ?topic a schema:Thing ;
         schema:name ?topicName ;
         schema:isPartOf ?knowledgeDomain ;
         schema:subjectOf ?resource .
}
WHERE {
    #BIND(:E5 AS ?resource)
    ?resource a ec:EducationalResource ;
    dc:title ?title  ;
	schema:url ?url .

	optional{  ?resource  dc:description ?description .}
	#optional{  ?resource schema:author/rdf:rest*/rdf:first ?author}
	optional{  ?resource schema:author/rdf:rest*/rdf:first ?item.
				?item schema:givenName ?gn.
				?item schema:familyName ?fn
				bind(concat(?gn,' ',?fn) as ?author)}
	optional { ?resource dcterms:language ?language . }
	optional{?resource dcterms:license ?license }
	optional{?resource dcterms:created ?dateCreated .}
	optional{?resource schema:timeRequired ?timeRequired }
	optional{?resource schema:identifier ?identifier }
	optional{?resource  mo:hasAttachment ?attachment }
	optional{?resource mo:hasTargetGroup ?targetGroup }
	optional{?resource mo:accessibleForFree ?free .}
	optional{?resource schema:keywords ?keywords }
	optional{?resource mo:requiresProficiencyLevel ?proficiencyLevel }
    optional{   ?resource mo:hasProvider ?provider .
                ?provider foaf:name ?providerName ;
                mo:hasProviderType ?providerType .} .
    optional{ ?topic mo:hasLearningResource ?resource ;
         dc:title ?topicName ;
         mo:hasKnowledgeDomain ?knowledgeDomain .
    }
	filter(?resource=mo:E6)
}


## schema:title is title of Job
## proficiencyLevel => educationalLevel
## AttachmentType 
## https://atomgraph.github.io/SPARQL-Playground/
## http://localhost:8890/sparql