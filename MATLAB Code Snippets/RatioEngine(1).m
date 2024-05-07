
Screen('Preference', 'SkipSyncTests', 1);
%{
screenid = max(Screen('Screens'));
[win, winRect] = Screen('OpenWindow', screenid, 128);

aperture=Screen('OpenOffscreenwindow', win, 128, []);
Screen('FillOval', aperture, [255 255 255 0],[]);
Screen('FrameOval', aperture, [0 0 0 255], []);

AssertOpenGL;
%}
cd('C:\Users\Brent\Documents\Science.Projects\Dyads\pilot stims\acuity 0');

%Screen('BlendFunction', win, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

w=100;
cx1=400; cy1=600; 
objRect1=[cy1-w cx1-w cy1+w cx1+w];

%Screen('DrawTexture', win, aperture, objRect1);
%Screen('Flip',win);

limit=[0.30, 0.35];  
    w=25;
    sentA=0;
    dabu=0;
    times=0;
    word='1';
    cd('C:\Users\Brent\Desktop\TaskGeo');
       GeoTask=imread(word,'png'); 
       GTdata=imresize(GeoTask,[768,1366]);
       GTdata=rgb2gray(GTdata);
       GeoNoTask=imread(['nt',word], 'png');
       GNTdata=imresize(GeoNoTask,[768,1366]);
       GNTdata=rgb2gray(GNTdata);
       [g1,g2]=find(GTdata);
       [gn1,gn2]=find(GNTdata);
    cd('C:\Users\Brent\Documents\Science.Projects\Dyads\pilot stims\acuity 0');
    
      imdata=imread(word, 'jpg');
      imdata=imresize(imdata,[768,1366]);
      %imtex=Screen('MakeTexture', win, imdata);
      dat=[];
    sca;
    while sentA < 25 % dabu < 3
    
    %pick a random spot on the full task geometry    
    con=0;
   
    while con ~=1
        rh=randi([1, length(gn1)]);
        rx=gn1(rh);ry=gn2(rh);
        rr=randi([-w,w]);
        rx=rx+rr;ry=ry+rr; 
        
        if rx < (768-w) && ry < (1366-w)
            if rx > w && ry > w
                con=1;
            end
        end
        times=times+1;
    end
 
    
    
       
    objRand=[ry-w rx-w ry+w rx+w];
    GA =GTdata(objRand(2):objRand(4),objRand(1):objRand(3));
    GNA=GNTdata(objRand(2):objRand(4),objRand(1):objRand(3));
    GA =imbinarize(GA ,0.01);
    GNA=imbinarize(GNA,0.01);
    
    GA=GA*2;
    %GNA=GNA*.01;
    s=GA+GNA;
    
    
    %Problem with code is right here.
    %[D1,D2]=find(s<1);
    [C1,C2]=find(s==2);
    [T1,T2]=find(s);
    
    %It's letting ratios pass that shouldn't pass.
    ratio=length(C1)/length(T1);
    dat=[dat,ratio];
    
        if ratio >=  limit(1) && ratio <= limit(2)
            %RatioDat(i)=ratio;
            %RatioTotal(i)=ratio*length(s);
            sentA=sentA+1;
        end
     dabu=dabu+1
    end%end aperture loop
    sentA
    sca;
    
    figure(1);imshow(GA);figure(2);imshow(GNA);figure(3);imshow(s)