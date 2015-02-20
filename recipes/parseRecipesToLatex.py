# an attempt to parse s-expressions in the jankiest manner possible
import ast # use ast.literal_eval on text files, lol
import sys # for getting arguments
#fileName = "cccookies-reformatted"
fileName = sys.argv[1]

forbiddenChars = dict.fromkeys(("\n","\t","\\"), " ")	# translate stuff that latex doesn't like to empty string
#newlineChars = dict.fromkeys((r'''/'''),r'''}\\\text{''') # this is how we put multi lines in math mode

preamble = r'''\documentclass[12pt]{standalone}
\usepackage{mathtools}
\DeclareMathSizes{12}{12}{12}{12}
\begin{document}
\[
'''
postamble = r'''\]
\end{document}'''

# these hold the output
frontMatter = []	# this is going to hold the latex output
backMatter = []

# eat the input
f = open(fileName,'r')
blah = ast.literal_eval(f.read().translate(forbiddenChars))
f.close()

# digest the input
def parse_stuff(stuff):
  #print(stuff)
  if isinstance(stuff,tuple):
    #print("1")
    frontMatter.append(r'''\begin{rcases}\begin{alignedat}{3}'''+'\n')
    for item in stuff[1:]:parse_stuff(item)
    frontMatter.append(r'''\end{alignedat}\end{rcases}'''+'\n')
    frontMatter.append(r'''\substack{\text{'''+stuff[0].replace(r'''/''',r'''}\\\text{''')+r'''}}\\'''+'\n')   
  elif isinstance(stuff,str):
    #print("2")
    frontMatter.append(r'''\text{'''+stuff+r'''}\\'''+'\n')
  else:
    print("THIS SHOULD NEVER HAVE HAPPENED")
    print(type(stuff))

parse_stuff(blah)

# and poop it back out
outputFile = open(fileName+'.tex','w') #this overwrites existing tex file
outputFile.write(preamble)
# do the things that happen in the middle
for item in frontMatter: outputFile.write(item)
for item in backMatter: outputFile.write(item)
outputFile.write(postamble)
outputFile.close()

# run latex to make pdf/graphix