clear all
close all
clc
addpath('.\surfstat')
Datapath = '.\For_Stats\1_OLD_Imaging_data_for_34condyles\Template\';
FileNames = dir(strcat(Datapath,'*.obj'));

for i = 1 : length(FileNames)
    Surface = SurfStatReadSurf(strcat(Datapath,FileNames(i).name));
    X = Surface.coord(1,:);
    shape{i}.X = X';
    Y = Surface.coord(2,:);
    shape{i}.Y = Y';
    Z = Surface.coord(3,:);
    shape{i}.Z = Z';
    TRIV = Surface.tri;
    shape{i}.TRIV = double(TRIV);
    Name = FileNames(i).name;
    shape{i}.name = Name(:,1:end-4);
    
    K = 100;            % number of eigenfunctions
    alpha = 2;          % log scalespace basis
    
    T1 = [5:0.5:16];    % time scales for HKS
    T2 = [1:0.2:20];    % time scales for SI-HKS
    Omega = 2:20;       % frequencies for SI-HKS
    
    % compute cotan Laplacian
    [shape{i}.W, shape{i}.A] = mshlp_matrix(shape{i});
    shape{i}.A = spdiags(shape{i}.A,0,size(shape{i}.A,1),size(shape{i}.A,1));
    
    % compute eigenvectors/values
    [shape{i}.evecs,shape{i}.evals] = eigs(shape{i}.W,shape{i}.A,K,'SM');
    shape{i}.evals = -diag(shape{i}.evals);
    
    % compute descriptors
    shape{i}.hks   = hks(shape{i}.evecs,shape{i}.evals,alpha.^T1);
    [shape{i}.sihks, shape{i}.schks] = sihks(shape{i}.evecs,shape{i}.evals,alpha,T2,Omega);
end

 save(strcat(Datapath,'shapes.mat'),'shape')
