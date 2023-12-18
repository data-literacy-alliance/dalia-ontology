PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX schema: <http://schema.org/>
PREFIX bf: <http://id.loc.gov/ontologies/bibframe/>
PREFIX mo: <https://purl.org/ontology/modalia#> 

CONSTRUCT {
  ?resource a schema:LearningResource ;
            schema:name ?title ;
            schema:description ?description ;
            schema:inLanguage ?language ;
            #schema:hasQuality ?quality ;
            #schema:requiresProficiencyLevel ?requiresProficiencyLevel ;
            #schema:givesProficiencyLevel ?givesProficiencyLevel ;
            schema:keywords ?keywords ;
            schema:license ?license ;
            schema:url ?url ;
            schema:author ?author ;
            schema:dateCreated ?dateCreated ;
            schema:timeRequired ?timeRequired ;
            schema:identifier ?identifier ;
            schema:learningResourceType ?attachment ;
            schema:hasTarget ?targetGroup ;
			schema:isAccessibleForFree ?free ;
			schema:provider ?providerName .
            #--bf:contribution ?contribution .

  #?contribution a bf:Contribution ;
    #            bf:role ?role ;
     #           bf:agent ?agent .  

  ?topic a schema:Thing ;
         schema:name ?topicName ;
         schema:isPartOf ?knowledgeDomain ;
         schema:about ?resource .
}

WHERE {
    BIND(:E5 AS ?resource)
    #?resource a :EducationalResource ;
    dc:title ?title  ;
	schema:url ?url .

	optional{  ?resource  dc:description ?description .}
	optional { ?resource dcterms:language ?language . }
	optional{?resource dcterms:license ?license }
	optional{?resource schema:dateCreated ?dateCreated .}
	optional{?resource schema:timeRequired ?timeRequired }
	optional{?resource schema:identifier ?identifier }
	optional{?resource  :hasAttachment ?attachment }
	optional{?resource :hasTargetGroup ?targetGroup }
	optional{?resource :accessibleForFree ?free .}
	optional{?resource schema:keywords ?keywords }
	optional{?resource   schema:author ?author }
            optional{   ?resource :hasProvider ?provider .
  ?provider schema:name ?providerName ;
                :hasProviderType ?providerType .
} .
 optional{ ?topic :hasLearningResource ?resource ;
         dc:title ?topicName ;
         :hasKnowledgeDomain ?knowledgeDomain .
}
}

## Still Author