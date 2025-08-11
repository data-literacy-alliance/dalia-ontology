# /// script
# dependencies = [
#     "rdflib",
#     "tabulate",
#     "pytest",
# ]
# ///

"""Run tests."""

import sys
import unittest
from pathlib import Path
from typing import ClassVar

import pytest
import rdflib
from tabulate import tabulate

HERE = Path(__file__).parent.resolve()
TTL_PATH = HERE.joinpath("MoDalia.ttl")

CURATION_URL = "https://docs.google.com/spreadsheets/d/e/2PACX-1vTJiqxPIfKNNvdQZWsihdwA08wpglQDiL52grzTV340Z59X3x3MXo0Qxt6gOhwdI3QR0q-87Ao33-CI/pub?gid=1983483994&single=true&output=tsv"
ALLOWED_NON_CAPS = {
    "PhD student",
    "RDM resource",
    "RDM skill",
    "RDM topic",
    "RDM subject cluster",
    "VARK auditory",
    "VARK kinesthetic",
    "VARK reading",
    "VARK visual",
    "comment has OER",
    "has DOI",
}


class TestOntology(unittest.TestCase):
    """Tests for the ontology."""

    graph: ClassVar[rdflib.Graph]

    @classmethod
    def setUpClass(cls):
        cls.graph = rdflib.Graph()
        cls.graph.parse(TTL_PATH)

    def test_names(self) -> None:
        """Test all terms have names."""
        sparql = """
            SELECT ?s ?name
            WHERE {
                ?s ?p ?o .
                OPTIONAL { 
                    ?s rdfs:label ?name . 
                    FILTER(lang(?name) = 'en')
                }
            }
        """
        #  add this english filter later!
        missing_names = []
        bad_capitalization = set()
        for subject, name in self.graph.query(sparql):
            if not isinstance(subject, str):
                continue
            if not subject.startswith("https://purl.org/ontology/modalia#"):
                continue
            luid = subject.removeprefix("https://purl.org/ontology/modalia#")
            if not luid:
                continue  # skip the ontology itself
            if not name:
                missing_names.append((luid,))
                continue
            name = str(name)
            if name.strip() != name:
                raise ValueError(f"{luid}'s label has trailing space")
            if name.casefold() != name and name not in ALLOWED_NON_CAPS:
                bad_capitalization.add((luid, name))
        if missing_names:
            self.fail(
                msg=f"\n\nthe following entities are missing english labels:\n\n{tabulate(missing_names, tablefmt='github', headers=['luid', 'type', 'type label'])}"
            )
        if bad_capitalization:
            self.fail(
                msg=f"\n\nthe following entities have incorrect capitalization:\n\n{tabulate(sorted(bad_capitalization), tablefmt='github', headers=['luid', 'name'])}"
            )


if __name__ == "__main__":
    sys.exit(pytest.main([__file__]))
