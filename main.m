clc;clear;
close all;

%% PART I: FUNDAMENTAL MATRIX ESTIMATION
libraryPic1 = imread('data/library/library1.jpg');
libraryPic2 = imread('data/library/library2.jpg');
library_matches=load('data/library/library_matches.txt');

[F,~] = fund_matrix(library_matches);
draw_epipolar_lines(F, libraryPic1, libraryPic2, library_matches(:,1:2), library_matches(:,3:4));

%% PART II: FUNDAMENTAL MATRIX ESTIMATION WITH RANSAC
NotreDamePic1 = imread('data/NotreDame/NotreDame1.jpg');
NotreDamePic2 = imread('data/NotreDame/NotreDame2.jpg');
[PointsPic1,PointsPic2]=find_matching_points(NotreDamePic1,NotreDamePic2);
matches = [PointsPic1,PointsPic2];

[F_recons,match_ind] = fund_matrix_RANSAC(PointsPic1,PointsPic2);
draw_epipolar_lines(F_recons, NotreDamePic1, NotreDamePic2, matches(match_ind,1:2), matches(match_ind,3:4));

%% PART III: TRIANGULATION (ALGEBRAIC SOLUTION)
P_house1=load('data/house/house1_camera.txt');
P_house2=load('data/house/house2_camera.txt');
house_matches = load('data/house/house_matches.txt');

[~] = Triangulations(house_matches, P_house1, P_house2,"house");

P_library1=load('data/library/library1_camera.txt');
P_library2=load('data/library/library2_camera.txt');
library_matches = load('data/library/library_matches.txt');

[~] = Triangulations(library_matches, P_library1, P_library2,"library");


