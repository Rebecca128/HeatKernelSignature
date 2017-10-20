clear all
close all
clc
load('.\For_Stats_Mahmoud\1_New_Imaging_data_for_34_condyles\17OA_17control_side_most_affected\Aligned_shapes\Control_meshes\shapes.mat')
shapes_control = shape;

load('.\For_Stats_Mahmoud\1_New_Imaging_data_for_34_condyles\17OA_17control_side_most_affected\Aligned_shapes\OA_meshes\shapes.mat')
shapes_Diseased = shape;

Omega = 2:20;
rng(0);
ID = randi([0 1002],1,18);
ID = sort(ID);
for i = 1 : length(ID)
    subplot(3,6,i)
    PoltProfiles(shapes_control,shapes_Diseased,Omega,ID(i))
end

    