function PoltProfiles(shapes1,shapes2,Omega,ID)

for i = 1 : length(shapes1)
    hold on
    plot(Omega(:),(shapes1{i}.sihks(ID,:)),'b')
    title(strcat('Vertex  ',num2str(ID)))
    xlabel('\omega')
    axis square
end

for i = 1 : length(shapes2)
    hold on
    plot(Omega(:),(shapes2{i}.sihks(ID,:)),'r')
end
    
end

