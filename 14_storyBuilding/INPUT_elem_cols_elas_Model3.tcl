
 ############################# Columns #######################################
 
 #Columns are defined as elasticBeamColumn elements in this tcl file
 
set Ec6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];	# Young's Modulus of Concrete
set nuc 0.2;													# Poisson's Ratio of Concrete
set Gc6 [expr $Ec6/(2.0*(1.0 + $nuc))];							# Shear Modulus of Concrete
 

 # 0 - 3 Basements
 for {set i 1} {$i <= $nStory} {incr i 1} {
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]
	
	#element elasticBeamColumn $eleTag $iNode $jNode $A $E $G $J $Iy $Iz $transfTag <-mass $massDens> <-cMass>
	
	#28x28 6 ksi
	set dim [expr 28.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag +  1] [expr $iNode +  1] [expr $jNode +  1] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag +  2] [expr $iNode +  2] [expr $jNode +  2] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag +  3] [expr $iNode +  3] [expr $jNode +  3] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag +  4] [expr $iNode +  4] [expr $jNode +  4] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag +  5] [expr $iNode +  5] [expr $jNode +  5] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag +  6] [expr $iNode +  6] [expr $jNode +  6] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag +  7] [expr $iNode +  7] [expr $jNode +  7] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag +  8] [expr $iNode +  8] [expr $jNode +  8] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  1] [expr $iNode +  1] [expr $jNode +  1] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  2] [expr $iNode +  2] [expr $jNode +  2] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  3] [expr $iNode +  3] [expr $jNode +  3] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  4] [expr $iNode +  4] [expr $jNode +  4] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  5] [expr $iNode +  5] [expr $jNode +  5] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  6] [expr $iNode +  6] [expr $jNode +  6] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  7] [expr $iNode +  7] [expr $jNode +  7] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  8] [expr $iNode +  8] [expr $jNode +  8] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#20x20 6 ksi
	set dim [expr 20.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 14] [expr $iNode + 14] [expr $jNode + 14] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 14] [expr $iNode + 14] [expr $jNode + 14] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
}