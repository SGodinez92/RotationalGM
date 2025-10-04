# RotationalGM
Nonlinear models used to compare the effect of rotational ground motions in structural response

-OpenSees.zip includes the OpenSees.exe used to run the models

-"14_storyBuilding" includes all the files necessary to create the 4 cases of the 14 story building. Open the run.tcl file and change the variable modelType depending on the case: Case 1 eccentricity in both directions, Case 2 eccentricity in the Y direction, Case 3 eccentricity in the X direction, Case 4 no eccentricities.

-"HR_Building_Rot" includes all the files necessary to create the high rise building model.

-Within the folders including the models, there is a GroundMotion folder with the input motions. ROT_H1_D corresponds to the rotational time history (in radians) about the X axis, ROT_H2_D corresponds to the rotational time history (in radians) about the Y axis, ROT_H3_D corresponds to the rotational time history (in radians) about the vertical axis, H1_D_KHMN corresponds to the displacement time history (in inches) in the X direction, H2_D_KHMN corresponds to the displacement time history (in inches) in the Y direction. H1_KHMN and H2_KHMN correspond to the acceleration time histories (in terms of g) for the X and Y direction respectively. See Fig. 1 of the manuscript for reference of the coordinate system.

-"Records" include the acceleration time histories of KHMN, NAR and NARp, as well as the resulting rotational time histories in radians/sec2.
