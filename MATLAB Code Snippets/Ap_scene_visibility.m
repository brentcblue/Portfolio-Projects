
Vis_moderate_R=zeros(1,12);
Vis_moderate_G=zeros(1,12);


Vis_severe_R=zeros(1,12);
Vis_severe_G=zeros(1,12);

Vis_profound_R=zeros(1,12);
Vis_profound_G=zeros(1,12);

scale0=1;
dpp=0.06;
dabu=0;
for ACC = 1:3
    if     ACC == 1
        level='moderate';
    elseif ACC == 2
        level='severe';
    elseif ACC == 3
        level='profound';
    end
    
    
    
for run = 1:12 

    
    cd('C:\Users\Brent\Desktop\apertures\TaskGeo');
    word=num2str(run);
    TGT=imread([word,'.png']);
    [x,y]=size(TGT);
    if y > 1200
        TGT=rgb2gray(TGT);
    end
    cd('C:\Users\Brent\Desktop\apertures\TaskGeo\LBs')
    
    
    
    
    if run == 1
        LB=imread(['06_17-2-',level,'-luminancebounds.png']);
    elseif run == 2
        LB=imread(['cube_2f-',level,'-luminancebounds.png']);
    elseif run == 3
        LB=imread(['f_Xr-',level,'-luminancebounds.png']);
    elseif run == 4
        LB=imread(['s2_haz6-',level,'-luminancebounds.png']);
    elseif run == 5
        LB=imread(['exp1_haz1-',level,'-luminancebounds.png']);
    elseif run == 6
        LB=imread(['2_gdFIX2-mid-',level,'-edges.png']);
    elseif run == 7
        LB=imread(['s2-b_door-',level,'-luminancebounds.png']);
    elseif run == 8
        LB=imread(['sd-i-10ftFeb2114-',level,'-luminancebounds.png']);
    elseif run == 9
        LB=imread(['06_17-4-',level,'-luminancebounds.png']);
    elseif run == 10
        LB=imread(['exp2_haz2-',level,'-luminancebounds.png']);
    elseif run == 11
        LB=imread(['good_su400-',level,'-edges.png']);
    elseif run == 12
        LB=imread(['f_X20-',level,'-luminancebounds.png']);
    end
    
    
    

[TGTx,TGTy]=find(TGT);
[Cx,Cy]=find(LB);
[Sx,Sy]=size(TGT);
z=zeros(Sx,Sy);
z2=zeros(Sx,Sy);

%%


for i = 1:Sx
    for j = 1:Sy
        
        if TGT(i,j) > 0        
           dist=sqrt((i-Cx).^2+(j-Cy).^2);
           B=sort(dist);            
           zugzug=B(1);
           z(i,j)=scale0/(dpp*zugzug+scale0);
           z2(i,j)=exp(-1*(dpp*zugzug/scale0)^2);
           
        end
    end
end
if ACC == 1
    Vis_moderate_R(run)=sum(sum(z))/length(TGTx);
    Vis_moderate_G(run)=sum(sum(z2))/length(TGTx);
elseif ACC == 2
    Vis_severe_R(run)=sum(sum(z))/length(TGTx);
    Vis_severe_G(run)=sum(sum(z2))/length(TGTx);
    
elseif ACC == 3
    Vis_profound_R(run)=sum(sum(z))/length(TGTx);
    Vis_profound_G(run)=sum(sum(z2))/length(TGTx);
end
dabu=dabu+1
end%End stim loop
end%end masterloop
Vis_moderate_R
Vis_moderate_G