rm(list=ls())
library(gsheet)

stimMaster = data.frame(gsheet2tbl('https://docs.google.com/spreadsheets/d/1TVXZchfLfSGJppdgHnkm8VmYA3Uzy-x_xnxszi3y8Wo/edit?usp=sharing'))


stimMaster$ItemNo = c(1:dim(stimMaster)[1])

stimMaster = subset(stimMaster, Morpheme!="notshared")

opener = "], \"Question\", {q: \"<font size=4>&quot;"
closer = "&quot;</font><br><br><i>Do you think this person ended up saying exactly what she meant?</i><br><br>\", as: [\"Yes\", \"No\"]}],"
closerF = "<br><br>\", as: [\"Yes\", \"No\"]}],"

distractor.error = paste("[[\"distractor.error\", ", 
stimMaster$ItemNo, opener, 
stimMaster[,9], closer,  
sep="")


distractor.target = paste("[[\"distractor.target\", ", 
stimMaster$ItemNo, opener, 
stimMaster[,11], closer,  
sep="")


control.error = paste("[[\"control.error\", ", 
stimMaster$ItemNo, opener, 
stimMaster[,10], closer,  
sep="")


control.target = paste("[[\"control.target\", ", 
stimMaster$ItemNo, opener, 
stimMaster[,12], closer,  
sep="")


allstims = c(control.error, control.target, distractor.error, distractor.target)

allstims = c(allstims, "[[\"intro\", 100], \"Question\", {q: \"<font size=4>&quot;When we get home, can we make a nice big pot of plit spea soup?&quot;</font><br><br><i>Do you think this person ended up saying exactly what she meant?</i><br><br>\", as: [\"Yes\", \"No\"]}],")

allstims = c(allstims, "[[\"fillers\", 101], \"Question\", {q: \"<font size=4>&quot;My friend Mike is trying to find a wife for his job.&quot;</font><br><br><i>Do you think this person ended up saying exactly what she meant?</i><br><br>\", as: [\"Yes\", \"No\"]}],")

allstims = c(allstims, "[[\"fillers\", 102], \"Question\", {q: \"<font size=4>&quot;By the time the police arrived, all they found was a hole full of floors.&quot;</font><br><br><i>Do you think this person ended up saying exactly what she meant?</i><br><br>\", as: [\"Yes\", \"No\"]}],")

allstims = c(allstims, "[[\"fillers\", 103], \"Question\", {q: \"<font size=4>&quot;The university library is a mine gold of information.&quot;</font><br><br><i>Do you think this person ended up saying exactly what she meant?</i><br><br>\", as: [\"Yes\", \"No\"]}],")

cat(allstims, sep="\n", file="~/Documents/UCSD/projects/lexex/lexex/expt/items.txt")

system("cat ~/Documents/UCSD/projects/lexex/lexex/expt/chunk1.txt ~/Documents/UCSD/projects/lexex/lexex/expt/items.txt ~/Documents/UCSD/projects/lexex/lexex/expt/chunk2.txt > ~/Documents/UCSD/projects/lexex/lexex/expt/example_data.js", intern=F)

