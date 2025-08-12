# /// script
# requires-python = ">=3.14"
# dependencies = [
#     "click",
# ]
# ///

# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 10:26:51 2024

@author: abdel
"""

import click
import shutil
from pathlib import Path

HERE = Path(__file__).parent.resolve()
OUT_FOLDER = HERE.joinpath("public")
SOURCE = OUT_FOLDER.joinpath("index-en.html")
PUT = OUT_FOLDER.joinpath("index.html")


@click.command()
def main() -> None:
    with SOURCE.open() as fi:
        txt = fi.read()

    txt = txt.replace("L L1 ", "LL1")
    txt = txt.replace("L L2 ", "LL2")
    txt = txt.replace("L L3 ", "LL3")
    txt = txt.replace("L L4 ", "LL4")
    txt = txt.replace("L L5 ", "LL5")
    txt = txt.replace("L L6 ", "LL6")
    txt = txt.replace("any U R I", "any URI")
    txt = txt.replace("R D M Subject Area", "RDM Subject Area")
    txt = txt.replace("commented O E R", "commented OER")
    txt = txt.replace("comment I D", "comment ID")
    txt = txt.replace("has Row I D", "has Row ID")

    source_img = HERE.joinpath("visualisations", "EducationalResourcePattern_CD.png")
    shutil.copy(
        source_img,
        OUT_FOLDER.joinpath("resources", "EducationalResourcePattern_CD.png"),
    )
    # txt.replace("belongs To ","belongsTo")
    # adds CR to LF 5k (Parameter newline empty inhibits addition of \r)
    with open(SOURCE, "wt", encoding="UTF8", newline="") as fo:
        fo.write(txt)
    with open(PUT, "wt", encoding="UTF8", newline="") as fo:
        fo.write(txt)


if __name__ == "__main__":
    main()
