# 1. Educational Resource Identification:
## CQ1- Which resources are of a specific learning resource type (e.g., Tutorial, Book, Case Study, Lecture)?
```sparql
SELECT ?resource ?title
WHERE {
    ?resource rdf:type ec:EducationalResource .
    ?resource modalia:hasLearningType modalia:Tutorial .
    ?resource dcterms:title ?title . 
}
ORDER BY ?title
```

## CQ2- Which resources are targeted at a given target group (e.g., BachelorStudent, PhDStudent)?
```sparql
SELECT ?resource ?title
WHERE {
    ?resource rdf:type ec:EducationalResource .
    ?resource modalia:hasTargetGroup modalia:PhDStudent .
    ?resource dcterms:title ?title . 
}
ORDER BY ?title
```

## CQ3- Which resources are associated with a media type (Video, Text, Code)?
```sparql
SELECT ?resource ?title
WHERE {
    ?resource rdf:type ec:EducationalResource .
    ?resource modalia:hasMediaType schema:VideoObject .
    ?resource dcterms:title ?title . 
}
ORDER BY ?title
```

## CQ4- Which resources require a minimum proficiency level of ‘competent’ or above?
```sparql
SELECT ?resource ?title
WHERE {
    ?resource rdf:type ec:EducationalResource .
    ?resource modalia:requiresProficiencyLevel modalia:Competent .
    ?resource dcterms:title ?title .
}
ORDER BY ?title
```

# 2. RDM and Skill Relationships
## CQ5- Which resources teach a specific skill (e.g., RDM skill)?
```sparql
SELECT ?resource ?title
WHERE {
    ?resource rdf:type ec:EducationalResource .
    ?Skill modalia:requiresKnowledge ?Kt .
    ?resource modalia:covers ?Kt .
    ?resource dcterms:title ?title .
}
ORDER BY ?title
```

## CQ6- Given a job and its required skills, which OERs teach or support those skills?
```sparql
SELECT DISTINCT ?resource ?title
WHERE {
    ?resource rdf:type ec:EducationalResource .
    ?skill ec:essentialFor ?job .
    ?skill ec:requiresKnowledge ?Kt .
    ?resource modalia:covers ?Kt .
    ?resource dcterms:title ?title .
}
ORDER BY ?title
```

## CQ7- Which RDM topics are covered by resources in the KG?
```sparql
SELECT DISTINCT ?topic ?topicLabel
WHERE {
  ?resource modalia:covers ?topic .
  ?topic a modalia:RDMTopic ;
         skos:prefLabel ?topicLabel .
}
ORDER BY ?topicLabel
```

# 3. Learning Paths and Objectives
## CQ8- Which educational resources are part of a given learning path?
```sparql
SELECT  ?ordr ?resource ?title
{   
     ?stp modalia:belongsToLearningPath ?lp .
     ?stp modalia:hasEducationalResource ?resource .
     ?stp modalia:hasOrder ?ordr .
     ?resource dcterms:title ?title .
}
order by ?ordr
```

# 4. User
## CQ9- Which resources has a user bookmarked, viewed, or liked?
```sparql
SELECT DISTINCT ?resource ?interactionType
WHERE {
  VALUES ?interactionType {
    modalia:userBookmsrks
    modalia:userViews
    modalia:userLikes
  }

  daliakg:user123 ?interactionType ?resource .
}
ORDER BY ?interactionType ?resource
```

# 5. Domain-specific Questions
## CQ10- Which OERs address the documentation of a given kind of data (e.g., BioAssay data or (S)Tensor data)?
```sparql
SELECT DISTINCT ?resource ?title
WHERE {
  ?resource rdf:type ec:EducationalResource .
  ?resource modalia:coversManagementOfDataKind daliakg:BioAssayData .
  ?resource dcterms:title ?title .
}
ORDER BY ?title
```
