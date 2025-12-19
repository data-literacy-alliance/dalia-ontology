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

# 2. RDM and Skill Relationships
## CQ4- Which resources teach a specific skill (e.g., RDM skill)?
## CQ5- Which resources require a minimum proficiency level of ‘competent’ or above?
## CQ6- Given a job and its required skills, which OERs teach or support those skills?
## CQ7- Which RDM topics are covered by resources in the ontology?

# 3. Learning Paths and Objectives
## CQ8- Which educational resources are part of a given learning path?


# 4. User
## CQ9- Which resources has a user bookmarked, viewed, or liked?

# 5. Domain-specific Questions
## CQ10- Which OERs address the documentation of a given kind of data (e.g., BioAssay data or (S)Tensor data)?
