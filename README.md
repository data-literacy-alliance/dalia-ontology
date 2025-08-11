# Dalia Ontology

## Getting started

The Ontology is in Work packages 11 and 12 in the project proposal. Initial
draft based on the six use cases in the proposal and EduCor.

- Added Job class and relations with Skill class (essentialFor and optionalFor)

## Documentation

Documentation of MoDALIA is found
[here](https://dalia.pages.rwth-aachen.de/dalia-ontology/index-en.html)

## Patterns

- A RDM pattern
- B Educational resource pattern
- C Skill pattern
- D Learning path pattern
- E Recommendation pattern
- F User profile pattern
- G Assessment pattern
- H User enrollment pattern
- I User role pattern
- J Community pattern

## Contributing

1. Install Protégé from https://protege.stanford.edu/
2. Clone this repository and make a branch
3. Open `MoDalia.ttl` in Protégé
4. Make a merge request
5. Install just with `pip install rust-just`
6. Ensure the unit tests are passing locally by running `just test` or by checking the
   automated CI/CD run on the merge request

## Linting

```shell
$ npx --yes prettier --write --prose-wrap always "**/*.md"
```

## References

- Ilkou, E. et al. (2021). EduCOR: An Educational and Career-Oriented
  Recommendation Ontology. In: Hotho, A., et al. The Semantic Web ISWC 2021.
  ISWC 2021. Lecture Notes in Computer Science(), vol 12922. Springer, Cham.
  https://doi.org/10.1007/978-3-030-88361-4_32
- Koutsomitropoulos, Dimitrios A.; Solomou, Georgia D. (2018): A learning object
  ontology repository to support annotation and discovery of educational
  resources using semantic thesauri. In IFLA journal 44 (1), pp.4–22.
