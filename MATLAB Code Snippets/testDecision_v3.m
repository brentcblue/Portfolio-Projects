%%
%Variable Set up
iterations=500000;
count=1;
nt=100;
nn=nt/5;
zugzug=1;

%Data Storage
Present=[];
Response=[];
r1=zeros(1,nt);
r=zeros(1,nt);
cor_store=[];
N_noise=[];
t=cell(iterations,1);
N_SD_RD=cell(10000,1);

%Stimuli presentation list
s=[];
for pres = 1:nn
    s=[s,randperm(5)];
end%end for
Present=[Present;s];



%%
%Machine loop
for i= 1:iterations    
    for n = 1:nt
            SUbr=BlurStims(26,:);
            SDbr=BlurStims(27,:);
            RUbr=BlurStims(28,:);
            RDbr=BlurStims(29,:);
            FLbr=BlurStims(30,:);
            
            %SUbr=SUg20;
            %SDbr=SDg20;
            %RUbr=RUg20;
            %RDbr=RDg20;
            %FLbr=FLg20;
            
            [x,y]=size(SUbr);

            noise=0+0.25*randn(x,y);
            SUbr=SUbr+noise;
            noise_sd=0+0.25*randn(x,y);
            SDbr=SDbr+noise_sd;
            noise=0+0.25*randn(x,y);
            RUbr=RUbr+noise;
            noise=0+0.25*randn(x,y);
            RDbr=RDbr+noise;
            noise=0+0.25*randn(x,y);
            FLbr=FLbr+noise;
            noise=0+0.25*randn(x,y);
            mat2=[SUbr;SDbr;RUbr;RDbr;FLbr]; 
 
        if s(n) == 1
            dat=zeros(5,1);
            for j = 1:5
                dat(j)=norm(mat(1,:)-mat2(j,:));
            end            
            [val,k]=min(dat); 
            r1(n)=k;
        elseif s(n)== 2
            for j = 1:5
                dat(j)=norm(mat(2,:)-mat2(j,:));
            end
            [val,k]=min(dat); 
            r1(n)=k;
            
            if k==4                
                [z,h]=size(SUg);
                nreshape=reshape(noise_sd,[z,h]);                
                N_SD_RD{zugzug}=nreshape;
                zugzug=zugzug+1;
            end
            
            
            
        elseif s(n)==3
            for j = 1:5
                dat(j)=norm(mat(3,:)-mat2(j,:));
            end
            [val,k]=min(dat); 
            r1(n)=k;
        elseif s(n)==4
            for j = 1:5
                dat(j)=norm(mat(4,:)-mat2(j,:));
            end
            [val,k]=min(dat); 
            r1(n)=k;
        elseif s(n)==5
            for j = 1:5
                dat(j)=norm(mat(5,:)-mat2(j,:));
            end
            [val,k]=min(dat); 
            r1(n)=k;
        end        

     end
a=confusionmat(Present,r1);      
t{count}=a;

%cm_reshape=reshape(a,[1,25]);

%cor_store=[cor_store,corr(cm_reshape',lm20reshape')];



count=count+1      
end

gg=[];
jorb=zeros(z,h);
for i = 1:(zugzug-1)
    %gg=[gg,N_SD_RD{i}];
    jorb=jorb+N_SD_RD{i};
end

jj=jorb/(zugzug-1);
figure(1);imagesc(jj); colormap gray
figure(2);imagesc(jorb);colormap gray

