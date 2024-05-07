%%
%Templates: Task Geo
strD_T='C:\Users\Brent\Desktop\Img_proc\E_temps\Union_all\doors';
strFWC_T='C:\Users\Brent\Desktop\Img_proc\E_temps\Intersection_2+\FloorWallsCeilng';
strO_T='C:\Users\Brent\Desktop\Img_proc\E_temps\Union_all\obs';
strS_T='C:\Users\Brent\Desktop\Img_proc\E_temps\Union_all\steps';

%Moderate Canny
strD_M_C='C:\Users\Brent\Desktop\Luminance bounds\acuity 1\Doors';
strFWC_M_C='C:\Users\Brent\Desktop\Img_proc\Canny\Stim 1\FWC';
strO_M_C='C:\Users\Brent\Desktop\Img_proc\Canny\Stim 1\Obstacles';
strS_M_C='C:\Users\Brent\Desktop\Img_proc\Canny\Stim 1\Steps';

%Severe Canny
strD_S_C='C:\Users\Brent\Desktop\Luminance bounds\acuity 2\Doors';
strFWC_S_C='C:\Users\Brent\Desktop\Img_proc\Canny\Stim 2\FWC';
strO_S_C='C:\Users\Brent\Desktop\Img_proc\Canny\Stim 2\Obstacles';
strS_S_C='C:\Users\Brent\Desktop\Img_proc\Canny\Stim 2\Steps';

%Profound Canny
strD_P_C='C:\Users\Brent\Desktop\Luminance bounds\acuity 3\Doors';
strFWC_P_C='C:\Users\Brent\Desktop\Img_proc\Canny\Stim 3\FWC';
strO_P_C='C:\Users\Brent\Desktop\Img_proc\Canny\Stim 3\Obstacles';
strS_P_C='C:\Users\Brent\Desktop\Img_proc\Canny\Stim 3\Steps';

%dat=dir
%dat(12).name

%%

dpp=0.06;
scale0=1.0;

vis_D_M_R=zeros(1,10); vis_D_M_G=zeros(1,10);
vis_D_S_R=zeros(1,10); vis_D_S_G=zeros(1,10);
vis_D_P_R=zeros(1,10); vis_D_P_G=zeros(1,10);

%vis_FWC_M=zeros(1,10);
%vis_FWC_S=zeros(1,10);
%vis_FWC_P=zeros(1,10);

%vis_O_M=zeros(1,12);
%vis_O_S=zeros(1,12);
%vis_O_P=zeros(1,12);

%vis_S_M=zeros(1,12);
%vis_S_S=zeros(1,12);
%vis_S_P=zeros(1,12);
%%
for acuity = 1 : 3
for task = 1 : 1  
    
    
    
    
    
if task == 1
    con = 10;
elseif task == 2
    con = 10;
elseif task == 3
    con = 12;
elseif task == 4
    con = 12;
end
    
%%    
count=1
while count <= con

if task == 1
    cd(strD_T);
    dat=dir;
    C=count+2;
    TGT=imread(dat(C).name);
    
   
    
end


if acuity == 1
    if task == 1
        cd(strD_M_C);
        dat=dir;
        C=count+2;
    
        Canny=imread(dat(C).name);    
    end
elseif acuity == 2
    if task == 1
        cd(strD_S_C);
        dat=dir;
        C=count+2;
    
        Canny=imread(dat(C).name);    
    end
elseif acuity == 3
    if task == 1
        cd(strD_P_C);
        dat=dir;
        C=count+2;
    
        Canny=imread(dat(C).name);    
    end
end%acuity control

[TGTx,TGTy]=find(TGT);
[Cx,Cy]=find(Canny);
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

if acuity == 1
    if task == 1
        vis_D_M_R(count)=sum(sum(z))/length(TGTx);
        vis_D_M_G(count)=sum(sum(z2))/length(TGTx);
    end
elseif acuity == 2
    if task == 1
        vis_D_S_R(count)=sum(sum(z))/length(TGTx);
        vis_D_S_G(count)=sum(sum(z2))/length(TGTx);
    end
elseif acuity == 3
    if task == 1
        vis_D_P_R(count)=sum(sum(z))/length(TGTx);
        vis_D_P_G(count)=sum(sum(z2))/length(TGTx);    
    end
end

count=count+1
end%stimuli block
end%task block
end%acuity block

vis_D_M_R
vis_D_S_R
vis_D_P_R

vis_D_M_G
vis_D_S_G
vis_D_P_G

