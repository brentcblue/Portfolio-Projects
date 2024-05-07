%Aperture radius analysis

%{
Participant data contains a 4 by 4 dimension matrix
Calculate average diameter size per acuity level per participant
plot average diameter size as a function of acuity level from best to worst

calculate distance of aperture origin from center of display
plot average aperture size as a function of visual degrees from center
across stimuli across acuities (3D graph)


 Obtain length of data vector
 Obtain accuracy


%}

%fake data mock up for planning graphs
dataCellsRadM=cell(4);
dataCellsRadS=cell(4);
dataCellsRadP=cell(4);



%Delete later, this is only for planning purporses.
for i = 1:4
    for j = 1:4
        for n = 1:2
            dataCellsRadM{i,j}=[dataCellsRadM{i,j},randi([60,80])];
            dataCellsRadS{i,j}=[dataCellsRadS{i,j},randi([75,130])];
            dataCellsRadP{i,j}=[dataCellsRadP{i,j},randi([110,250])];
        end
    end
end



datavectorM=[];
datavectorS=[];
datavectorP=[];
for i = 1:4
    for j = 1:4        
            datavectorM=[datavectorM,dataCellsRadM{i,j}];
            datavectorS=[datavectorS,dataCellsRadS{i,j}];
            datavectorP=[datavectorP,dataCellsRadP{i,j}];
    end
end
x=1:96;
acuity=1:3;

scatter(x,[datavectorM,datavectorS,datavectorP])
%box plot is better here. Shows average differences and extreme values
%across all participants for a given acuity.
boxplot([datavectorM;datavectorS;datavectorP]')

%instead of calculating distance to center of screen, use the distance of
%the aperutre to the nearest expert labelled task relevant geometry.

%take screen grabs of all initial aperture sizes. Paint any non gray pixel
%as pure red. Run through a truncated expert template code. Find nearest
%point and record the distance. Do this for each aperture in the grid for
%each image. This creates a 4 x 4 distance measure per image.

%take 4 x 4 measure, plot aperture size as a function of distance
%from nearest expert selected geometry.

%future note, aperture size might need conversions into visual angles. This
%might also be neccessary to do for all distance measures across the screen
%because a triangle in pixel space is not meaningful apriori.
for i=1:9
    for j = 1:1
        
    end
end


%create heatmaps of geometry by taking venn diagrams of participant
%apertures and overlap them. find the brightest locations in thos maps and
%then find the average distance from those spots to all beginning aperture
%radiuses. Should recreate previous graph?

