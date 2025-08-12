# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 10:26:51 2024

@author: abdel
"""
fldr="e:\\Dalia\\docu87\\"
fname=fldr+"index-en.html"
fi=open(fname,"rt",encoding="UTF8")
txt=fi.read()
fi.close()
print(len(txt))
txt=txt.replace("L L1 ","LL1")
txt=txt.replace("L L2 ","LL2")
txt=txt.replace("L L3 ","LL3")
txt=txt.replace("L L4 ","LL4")
txt=txt.replace("L L5 ","LL5")
txt=txt.replace("L L6 ","LL6")
txt=txt.replace("any U R I","any URI")
txt=txt.replace("R D M Subject Area","RDM Subject Area")
txt=txt.replace("commented O E R","commented OER")
txt=txt.replace("comment I D","comment ID")
txt=txt.replace("has Row I D","has Row ID")

fdescr=open("dalia-ontology\\documentation\\3.Description.html","rt",encoding="UTF8")
txtdescr=fdescr.read()
fdescr.close()
txt=txt.replace("""<span class="markdown">This is a placeholder text for the description of your ontology. The description should include an explanation and a diagram explaining how the classes are related, examples of usage, etc.

</span>""",txtdescr)
#problem in displaying image
import shutil

shutil.copy("dalia-ontology\\visualisations\\EducationalResourcePattern_CD.png", fldr+'resources')
#txt.replace("belongs To ","belongsTo")
print(len(txt))
#adds CR to LF 5k (Parameter newline empty inhibits addition of \r)
fo=open(fldr+"index-en.html","wt",encoding="UTF8",newline='')
fo.write(txt)
fo.close()
fo=open(fldr+"index.html","wt",encoding="UTF8",newline='')
fo.write(txt)
fo.close()
