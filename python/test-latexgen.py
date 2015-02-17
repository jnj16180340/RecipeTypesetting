# nate johnson attempts to use python3
# nate johnson attempts to NOT write a tokenizer/parser/compiler/whatnot NOR use regexs

'''
(3-5' 500F\nor lower/longer,
  ('fluffy,\nsize doubles',
  (cream,butter 2st,sugar 1/2C,br sug 3/4C),
   (vanilla 2t,egg 1, milk splash)),
  flour 7/4C,BS 1/4t,BP 1/2t,salt 1t,cchips 2C
)
'''
fileName = 'cccookies-reformatted'
state = 'dick breath'	# are we parsing the first element of a list, or not?

forbiddenChars = dict.fromkeys(('\n','\t','\\'), ' ')	# translate stuff that latex doesn't like to empty string
preamble = r'''\documentclass[12pt]{standalone}
\usepackage{mathtools}
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
blah = f.read().translate(forbiddenChars)
f.close()

print(blah)
for character in blah:
  



# and poop it back out
putput = open(fileName+'.tex','w')
putput.write(preamble)
# do the things
putput.write(postamble)
putput.close()

# run latex to make pdf/graphix