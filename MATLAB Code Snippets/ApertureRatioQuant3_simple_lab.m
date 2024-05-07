

stim_str='C:\Users\Brent\Documents\Science.Projects\Dyads\pilot stims\acuity 3';
cd(stim_str);

prompt ='Enter ID information:';
strID = input(prompt, 's');
waitfor(strID);

Screen('Preference', 'SkipSyncTests', 1);

%Disable special function key for laptop
    DisableKeysForKbCheck(13);

%[keydown, seconds, keycode, deltaseconds]=KbCheck;
%Keycode q for correct. p for not incorrect.
    [keydown, seconds, keycode, deltaseconds]=KbCheck;
    p=KbName('p');
    q=KbName('q');
    sp=KbName('space');

%

    
screenid = max(Screen('Screens'));
[win, winRect] = Screen('OpenWindow', screenid, 128);

AssertOpenGL;


cx1=400; cx2=550; cx3=650; cx4=750;
cy1=600; cy2=700; cy3=800; cy4=1000;

w=20;
inc=20;
objRect1=[cy1-w cx1-w cy1+w cx1+w]; 

incorrect=0;
correct=0;

limit=[0.2 , 1.00];

aperture=Screen('OpenOffscreenwindow', win, 128, []);
%Screen('FillOval', aperture, [255 255 255 0],[]);
Screen('FillRect', aperture, [255 255 255 0],[]);
%Screen('FrameOval', aperture, [0 0 0 255], []);

imdata=imread('1.jpg');
imdata=imresize(imdata,[768,1366]);
[x,y]=size(imdata);
%imdata=imresize(imdata,[x*2,y*2]);
imtex=Screen('MakeTexture', win, imdata);
%resize here rather than in draw texture


Screen('BlendFunction', win, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

Screen('DrawTexture', win, aperture, objRect1);
Screen('Flip',win);

TrialOrder=[];
for j = 1:10
    TrialOrder=[TrialOrder,randperm(12)];
end

trials=length(TrialOrder);

response=zeros(1,trials);
Acc=zeros(1,trials);
TC=zeros(1,trials);
RatioDat=zeros(1,trials);
RatioTotal=zeros(1,trials);
Im75Grabs=cell(1,trials);
Tcorrect=0;

sentA=0;
respc=0;
d=1;
scale=1;
InfoDat=zeros(1,trials);
InfoRMS=zeros(1,trials);
InfoCP=zeros(1,trials);
imdats=cell(1,trials);

dcon=0;
try
for i = 1:trials
    
    if TrialOrder <= 8
        word=num2str(TrialOrder(i));
    else
        word=num2str(randi(8));
    end
    
    cd('C:\Users\Brent\Documents\Science.Projects\TaskGeo');
       GeoTask=imread(word ,'png'); 
       GTdata=imresize(GeoTask,[768,1366]);
       GTdata=rgb2gray(GTdata);
       GeoNoTask=imread(['nt',word], 'png');
       GNTdata=imresize(GeoNoTask,[768,1366]);
       GNTdata=rgb2gray(GNTdata);
       [g1,g2]=find(GTdata);
       [gn1,gn2]=find(GNTdata);
       ss=GTdata+GTdata;
       [s1,s2]=find(ss);
    cd(stim_str);
    
      imdata=imread(word, 'jpg');
      
      %imdata=imresize(imdata,scale,'bilinear','AntiAliasing',true);
      %imdata=imresize(imdata,[768,1366]);
      imdata=imresize(imdata,[768,1366]);
      
      
      imtex=Screen('MakeTexture', win, imdata);
      
            
      if mod(i, 12) == 0
          %return to this later
          
          if w < 360
            w=w+inc;
            sentA=0; 
            InfoDat(i)= (w^2)/scale;
          else
              sentA=1; dcon=1;
              InfoDat(i)= (768*1366)/scale;
          end
          
      end
      
    
    
     while sentA ~=1 % dabu < 3
    
    con=0;dabu=0;
  %pick a random spot on the full task geometry    
    times=0;
    while con ~=1
                
        if TrialOrder(i) <=8
            rh=randi([1, length(g1)]);
            rx=g1(rh);ry=g2(rh);
        else
            rh=randi([1, length(gn1)]);
            rx=gn1(rh);ry=gn2(rh);
        end
        
        rr=randi([-w,w]);
        rx=rx+rr;ry=ry+rr; 
        
        if rx < (768-w) && ry < (1366-w) || times > 500
            if rx > w && ry > w || times > 500
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
    s=GA+GNA;
    
    [C1,C2]=find(s==2);
    [T1,T2]=find(s);
    
    ratio=length(C1)/length(T1);
    if TrialOrder(i) <= 8
        if (ratio >=  limit(1) && ratio <= limit(2)) || dabu >= 25
            RatioDat(i)=ratio;
            %RatioTotal(i)=ratio*length(T1);
            sentA=1;
        end
    else
       if ratio <= 0.1 || dabu >= 25
           RatioDat(i)=ratio;
           sentA=1;
       end
    end   
        
        
     dabu=dabu+1;
    end%end aperture loop
    
    if dcon == 0
        Screen('DrawTexture', win, imtex,objRand);
        Screen('DrawTexture', win, aperture,[]);
        Screen('Flip',win);
        
        %imdata=rgb2gray(imdata);
        imgarray=imdata([objRand(2):objRand(4)],[objRand(1):objRand(3)]);
        imdats{i}=imgarray;

       
    else
        Screen('Flip',win);
        Screen('DrawTexture', win, imtex);
        Screen('Flip',win);
        %imdata=rgb2gray(imdata);
        imgarray=imdata;
        imdats{i}=imgarray;
    end
    

    
respc=0; 
while respc~=1        
    [keydown, seconds, keycode, deltaseconds]=KbCheck;
    
        if keycode(p) == 1 && mod(TrialOrder(i),2) == 1
            Tcorrect=Tcorrect+1;
            Acc(i)=1;
            response(i)=1;
            correct=correct+1;
            keycode(p) = 0;
            respc=1;
        end
        
        if keycode(p) == 1 && mod(TrialOrder(i),2) == 0
            Acc(i)=0;
            response(i)=1;
            incorrect=incorrect+1;
            keycode(p) = 0;
            respc=1;
        end
        
        if keycode(q) == 1 && mod(TrialOrder(i),2) == 0
            Tcorrect=Tcorrect+1;
            Acc(i)=1;
            response(i)=2;
            correct=correct+1;
            keycode(q) = 0;
            respc=1;
        end
        
        if keycode(q) == 1 && mod(TrialOrder(i),2) == 1
            Acc(i)=0;
            response(i)=2;
            incorrect=incorrect+1;
            keycode(q) = 0;
            respc=1;
        end
     
        if keycode(sp) == 1 && TrialOrder(i) >= 9
            Tcorrect=Tcorrect+1;
            Acc(i)=1;
            response(i)=3;
            correct=correct+1;
            keycode(sp)=0;
            respc=1;
        end
        
        if keycode(sp) == 1 && TrialOrder(i) <= 8
            Acc(i)=0;
            response(i)=3;
            incorrect=incorrect+1;
            keycode(sp)=0;
            respc=1;
        end
        
                


    
end %response loop
TC(i)=Tcorrect/i;
%d=d+1;

Screen('FillRect', win, [128 128 128 0],[]);
Screen('Flip',win);
WaitSecs(0.1);    
        

end %master loop

catch
    rethrow(lasterror)
    sca;
end


sca;
dabu=0;


%scatter(RatioDat,TC)
figure(1);scatter(log2(InfoDat),TC)
