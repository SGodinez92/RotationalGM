
#              ================================
# 				  Global Coordinate System
#              ================================
#           ____________		 _____________		   ^ Y-axis
#          |  __________|=======|___________  |		   |        
#          | |                              | |		   |        
#          | |                              | |		   |          
#          | |                              | |        o-------->  X-axis
#          | | x                          x | |        
#          | |                              | |        
#          | |                              | |        
#          | |__________          __________| |        
#          |____________|========|____________|
#          

# INITIALIZATION --------------------------------------------------------------------
model BasicBuilder -ndm 3 -ndf 6;		# define the model builder, ndm=#dimension, ndf=#dofs
set analysisType "dynamic";             # Choose between static and dynamic 

set ModelDirectory "Model";
set ModalAnalysisDirectory "ModalAnalysis";
set ModalAnalysisPreGravDirectory "Pre-gravity"
set ModalAnalysisPostGravDirectory "Post-gravity"
set MPCOdirectory "MPCO"
set ResultsDirectory "Results_$analysisType";
set SPMdirectory "SPM_Results"
set AccelDir "Accelerations"

set path ""
set pathT $path; append pathT $modelScale/$EQlevel/$RSN/Results
set outputDir $pathT

file mkdir $modelScale/$EQlevel/$RSN/$ModelDirectory
file mkdir $modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPreGravDirectory
file mkdir $modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPostGravDirectory
file mkdir $modelScale/$EQlevel/$RSN/$MPCOdirectory
file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory
file mkdir $modelScale/$EQlevel/$RSN/$SPMdirectory
file mkdir $modelScale/$EQlevel/$RSN/$AccelDir
file mkdir $outputDir

source UNITS.tcl;

# SET MODEL PARAMETERS ----------------------------------------------------------------------------------------------------------------------------------
set nPodiumStory 1;							# number of podiums
set nTypStory 13;							# number of typical stories
set podiumH [expr 16.0*$ft];				# Height of podiums
set typStoryH [expr 12.0*$ft];				# Height of office stories

set nStory [expr {$nPodiumStory + $nTypStory}];													# Total number of stories
set buildingHeight	[expr {$nPodiumStory*$podiumH + $nTypStory*$typStoryH}];	# Total building height

set eleTypeWall "forceBeamColumn";   		# "forceBeamColumn" or "dispBeamColumn"                                                         
set numIntgrPts 2;							# number of integration points
set nEleFloor 1;							# number of column elements per floor (CHANGE RECORDERS ACCORDINGLY)

# # Basement walls
# set C_dim1 		[expr 144.0*$in];		# Dimensions of Core Wall
# set C_dim2 		[expr 104.5*$in];		# Dimensions of Core Wall
# set C_dim3_b	[expr 3.75*$in];		# Dimensions of Core Wall
# set C_dim4_b	[expr 28.25*$in];		# Dimensions of Core Wall
# set C_dim5 		[expr 293.0*$in];		# Dimensions of Core Wall
# set C_dim6 		[expr 84.0*$in];		# Dimensions of Core Wall
# set Centr		[expr 33.5*$in];		# Centroid of section with respect to corner of wall
# 
# # Podium walls
# set C_dim3_p	[expr 8.*$in];			# Dimensions of Core Wall
# set C_dim4_p	[expr 45.75*$in];		# Dimensions of Core Wall
# 
# # Office walls
# set C_dim3_o	[expr 7.75*$in];		# Dimensions of Core Wall
# set C_dim4_o	[expr 28.25*$in];		# Dimensions of Core Wall
# 
# # Typical walls
# set C_dim3_t	[expr 4.75*$in];		# Dimensions of Core Wall
# set C_dim4_t	[expr 20.5*$in];		# Dimensions of Core Wall

set GravityAnalysisDone "No";
set gT "PDelta";						# Choose between Linear, PDelta, and Corotational
set pushDir "EW";						# Specify push direction, EW, or NS
set maxIters 100;
set fbtol 1e-8;
set modes 8;

set fGJ 0.1;	# Factor to multiply torsional stiffness of walls

set storyH {StoryHeights $podiumH};
for {set i 1} {$i <= [expr $nTypStory]} {incr i 1} {
	lappend storyH $typStoryH; 
}

set Nodes {}; # This will be used to store all nodeTags created. This is useful if displacement recorders for all nodes are to be set in order to plot deflected shapes.