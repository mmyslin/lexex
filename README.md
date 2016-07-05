1. Generate stimuli for Ibex
* Run generateIbexStims.r
 	+ Line 9 restricts the stimuli to shared-morpheme items only (Items 1-32; Experiment 1). Comment it out to include non-shared-morpheme items too (Items 1-64; Experiment 2).
	+ Change lines 49-51 to the correct paths. The Ibex data file, example_data.js, is generated in line 51 by concatenating two fixed code chunks, chunk1.txt and chunk2.txt, with items.txt, which is generated above in line 49.

2. Set up Ibex experiment

	+ The process is detailed here: https://consensus.ucsd.edu/cplwiki/index.php/Ibex_on_our_own_server

	+ I've distilled that process to the list of commands below, which are needed to set up an experiment called lexex_morpheme_manip_rep:

          ln -s ~/lexex_morpheme_manip_rep/www ~/public_html/lexex_morpheme_manip_rep
          touch ~/lexex_morpheme_manip_rep/server.log
          mkdir ~/lexex_morpheme_manip_rep/cache 
          mkdir ~/lexex_morpheme_manip_rep/server_state
          mkdir ~/lexex_morpheme_manip_rep/results
          chmod    a+w ~/lexex_morpheme_manip_rep/server.log
          chmod -R a+w ~/lexex_morpheme_manip_rep/cache 
          chmod -R a+w ~/lexex_morpheme_manip_rep/server_state/
          chmod -R a+w ~/lexex_morpheme_manip_rep/results
          nano ~/lexex_morpheme_manip_rep/www/server.py
          nano ~/lexex_morpheme_manip_rep/server_conf.py
        
3. Copy the generated Ibex stimuli to the Ibex experiment:

          scp /Users/markmyslin/Documents/UCSD/projects/lexex/lexex/expt/example_data.js mmyslin@expedition.ucsd.edu:~/lexex_morpheme_manip_rep/data_includes/example_data.js
          
4. The experiment is online here:

          https://expedition.ucsd.edu/~mmyslin/lexex_morpheme_manip_rep/experiment.html
