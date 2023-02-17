# Q1: How to retrieve OERs from multiple sources for a learning goal?
```
Select * {?learningpath ec:hasLearningGoal ?lg. ?learningpath ec:consistsOfKnowledge ?Kt. ?Kt ec:hasLearningResource ?Lo} 
```
# Q2(Q4): How to retrieve required OERs for a certain job skill?
```
Select * {?Skill requiresKnowledgeTopic ?Kt. ?Kt hasLearningResource ?Lo}
```
# Q3: How to provide an OER to a user with a specific access mode?
```
Select * {?user ec:hasProfile ?up. ?up accessibility ?ac. ?Lo accessibility ?ac}
SELECT * WHERE {
    ?userProfile            ec:accessibility              ?accessibility.
		?userProfile            ec:definesLearningPath        ?learningPath.
		?learningPath           ec:consistsOfKnowledge        ?knowledgeTopic.
		?knowledgeTopic         ec:hasEducationalResource     ?EducationalResource.
    ?EducationalResource    ec:accessibility              ?accessibility. }
```
– Q5: What is required to generate a personalized learning path?
- Q6: How to personalize a learning recommendation based on a user’s psychological state?
- Q7 UC: Learnpath according to target job:

# Q7: How to provide OERs for a specific Job? (Use case 4)
============
```
SELECT * WHERE {?job ec:hasSkill ?skill. 
	?skill ec:requiresKnowledgeTopic ?Kt. 
	?Kt ec:hasLearningResource ?Lo}
```	
	==================
	Benner’s Novice to Expert
	The five stages of proficiency in the novice to expert model are: novice, advanced beginner, competent, proficient, and expert (Benner, 1982).
	======
	LearningOutcome , LearningGoal
	###  https://github.com/tibonto/educor#LearningGoal
:LearningGoal rdf:type owl:Class ;
              rdfs:comment "The Learning Goal can vary depending on the personalisation level. For example a user might care to learn some specific topics and not all the skill set."@en ;
              rdfs:label "LearningGoal"@en ;
              <http://www.w3.org/2004/02/skos/core#definition> "The reach point of a learning path. The completion of a set of knowledge topics which can lead to mastering a skill. The learning goal in our design can be a Skill or a Knowledge Topic"@en ;
              <http://www.w3.org/2004/02/skos/core#example> "A learning goal could be the skill \"Python Programming\" or the last Knowledge Topic in this skill set the \"Virtual environments in Python\""@en .
			  
###  https://w3id.org/ccso/ccso#LearningOutcome
<https://w3id.org/ccso/ccso#LearningOutcome> rdf:type owl:Class ;
	 rdfs:label "LearningOutcome"@en ;
	 <http://www.w3.org/2004/02/skos/core#definition> "The learning outcomes and demonstrable skills or knowledge that will be acquired by a student as a result of the learning goal. It is found in text format."@en ;
	 <http://www.w3.org/2004/02/skos/core#example> "The learning outcome of \"Python Programming\" could be  \"The student understands the syntax and semantics of the basic Python language elements.\""@en .

