%Ideal Observer for LV Object Recog
%%
%Initialize data vectors
Acuity=1;
Present=[];
Response=[];
dat=zeros(1,5);
iterations=50;

t1=cell(iterations,1);
t2=cell(iterations,1);
t3=cell(iterations,1);
t4=cell(iterations,1);
t5=cell(iterations,1);
t6=cell(iterations,1);
tcount=1;

%%
bootr=[];
bootshuffle=[];
count=1;
CMreshape=reshape(CMmaster,[1,25]);
DigDug=diag(lm20s);
dood=[];
dull=[];
for sim = 1:iterations
while Acuity <= 6
%Begin simulated loop of the image matching experiment
%Create a randomized list of images to display
%Store that list
s=[];
nt=500;
nn=nt/5;
for i =1:nn
    s=[s,randperm(5)];
end%end for
Present=[Present;s];
r=zeros(1,nt);
%%
%Controls displaying the stimuli. Each letter corresponds to a stim.
%Each image should be displayed 100 times each.
a=1;b=1;c=1;d=1;e=1;

mu=0.25;
%Sigma should be constant. Previous iterations had a random deviation.
%Need to rerun the simulations.
for n = 1:nt 
    %Reset images to be the same as the blurred images.
    %This removes the added noise from previous trials.
    %On the first trial this makes stimuli equal to themselves.
 
%Mini control for handling the level of blur
    if Acuity == 1
        SUbr=BlurStims(1,:);
        SDbr=BlurStims(2,:);
        RUbr=BlurStims(3,:);
        RDbr=BlurStims(4,:);
        FLbr=BlurStims(5,:);
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];     
    elseif Acuity == 2
        SUbr=BlurStims(6,:);
        SDbr=BlurStims(7,:);
        RUbr=BlurStims(8,:);
        RDbr=BlurStims(9,:);
        FLbr=BlurStims(10,:);
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];
    elseif Acuity == 3
        SUbr=BlurStims(11,:);
        SDbr=BlurStims(12,:);
        RUbr=BlurStims(13,:);
        RDbr=BlurStims(14,:);
        FLbr=BlurStims(15,:);
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];
    elseif Acuity == 4
        SUbr=BlurStims(16,:);
        SDbr=BlurStims(17,:);
        RUbr=BlurStims(18,:);
        RDbr=BlurStims(19,:);
        FLbr=BlurStims(20,:);
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];
    elseif Acuity == 5
        SUbr=BlurStims(21,:);
        SDbr=BlurStims(22,:);
        RUbr=BlurStims(23,:);
        RDbr=BlurStims(24,:);
        FLbr=BlurStims(25,:);
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];
    elseif Acuity == 6
        SUbr=BlurStims(26,:);
        SDbr=BlurStims(27,:);
        RUbr=BlurStims(28,:);
        RDbr=BlurStims(29,:);
        FLbr=BlurStims(30,:);
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];        
    end
    
    dat=zeros(1,5);
    if a <= nn && s(n) == 1
        [x,y]=size(SUbr);
        noise=0+0.5*randn(x,y);
        SUbr=SUbr+noise;
        noise=0+0.5*randn(x,y);
        SDbr=SDbr+noise;
        noise=0+0.5*randn(x,y);
        RUbr=RUbr+noise;
        noise=0+0.5*randn(x,y);
        RDbr=RDbr+noise;
        noise=0+0.5*randn(x,y);
        FLbr=FLbr+noise;
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];
            for t = 1:5     
                dat(t)=norm(mat(1,:)-mat2(t,:));
            end         
        [j,k]=min(dat);     
        r(n)=k;
        a=a+1;
    elseif b<=nn && s(n)== 2
              
        [x,y]=size(SUbr);
        noise=0+0.5*randn(x,y);
        SUbr=SUbr+noise;
        noise=0+0.5*randn(x,y);
        SDbr=SDbr+noise;
        noise=0+0.5*randn(x,y);
        RUbr=RUbr+noise;
        noise=0+0.5*randn(x,y);
        RDbr=RDbr+noise;
        noise=0+0.5*randn(x,y);
        FLbr=FLbr+noise;
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];
        
            for t = 1:5
                dat(t)=norm(mat(2,:)-mat2(t,:));
            end         
        [j,k]=min(dat);
        r(n)=k;
        b=b+1;
    elseif c<=nn && s(n) == 3
                
        [x,y]=size(SUbr);
        noise=0+0.5*randn(x,y);
        SUbr=SUbr+noise;
        noise=0+0.5*randn(x,y);
        SDbr=SDbr+noise;
        noise=0+0.5*randn(x,y);
        RUbr=RUbr+noise;
        noise=0+0.5*randn(x,y);
        RDbr=RDbr+noise;
        noise=0+0.5*randn(x,y);
        FLbr=FLbr+noise;
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];
        
            for t = 1:5
                dat(t)=norm(mat(3,:)-mat2(t,:));
            end         
        [j,k]=min(dat);
        r(n)=k;
        c=c+1;
    elseif d<=nn && s(n) == 4
        
        [x,y]=size(SUbr);
        noise=0+0.5*randn(x,y);
        SUbr=SUbr+noise;
        noise=0+0.5*randn(x,y);
        SDbr=SDbr+noise;
        noise=0+0.5*randn(x,y);
        RUbr=RUbr+noise;
        noise=0+0.5*randn(x,y);
        RDbr=RDbr+noise;
        noise=0+0.5*randn(x,y);
        FLbr=FLbr+noise;
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];
        
            for t = 1:5
                dat(t)=norm(mat(4,:)-mat2(t,:));
            end         
        [j,k]=min(dat);
        r(n)=k;
        d=d+1;
    elseif e<=nn && s(n) == 5
        
        [x,y]=size(SUbr);
        noise=0+0.5*randn(x,y);
        SUbr=SUbr+noise;
        noise=0+0.5*randn(x,y);
        SDbr=SDbr+noise;
        noise=0+0.5*randn(x,y);
        RUbr=RUbr+noise;
        noise=0+0.5*randn(x,y);
        RDbr=RDbr+noise;
        noise=0+0.5*randn(x,y);
        FLbr=FLbr+noise;
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];
        
            for t = 1:5
                dat(t)=norm(mat(5,:)-mat2(t,:));
            end         
        [j,k]=min(dat);
        r(n)=k;
        e=e+1;
    end%End
end
Response=[Response;r];
Acuity=Acuity+1;
end %end master while
%%
%Analyze data
%Each row of template and response matrix represents an acuity level
%6 rows x 5000 columns: 6 acuities with 5000 stimulus/1000 of each object.
a=confusionmat(Present(1,:),Response(1,:));
b=confusionmat(Present(2,:),Response(2,:));
c=confusionmat(Present(3,:),Response(3,:));
d=confusionmat(Present(4,:),Response(4,:));
e=confusionmat(Present(5,:),Response(5,:));
f=confusionmat(Present(6,:),Response(6,:));

%Make sure that these values are in proportions
ConfMat=a+b+c+d+e+f;

t1{count}=a;
t2{count}=b;
t3{count}=c;
t4{count}=d;
t5{count}=e;
t6{count}=f;

fork=diag(f);

ConfMat=(ConfMat/600)*100;
cmr=reshape(ConfMat,[1,25]);
bootr=[bootr,corr(cmr',CMreshape')];
cmr=cmr(randperm(length(cmr)));
bootshuffle=[bootshuffle,corr(cmr',CMreshape')];

dood=[dood,corr(fork,DigDug)];
spork=fork(randperm(length(fork)));
dull=[dull,corr(spork,DigDug)];
Acuity=1;
Present=[];
Response=[];
count=count+1
end%End master for