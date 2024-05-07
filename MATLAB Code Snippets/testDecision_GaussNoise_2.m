
SU_A=[];
SD_A=[];
RU_A=[];
RD_A=[];
FL_A=[];

total=cell(500,1);
count=1;

s=[];
nt=500;
nn=nt/5;
for i =1:nn
    s=[s,randperm(5)];
end%end for
r=zeros(1,nt);



a=1;b=1;c=1;d=1;e=1;
for i= 1:nt
        dat=zeros(5,1);
    
        SUbr=BlurStims(1,:);
        SDbr=BlurStims(2,:);
        RUbr=BlurStims(3,:);
        RDbr=BlurStims(4,:);
        FLbr=BlurStims(5,:);
        [x,y]=size(SUbr);
     
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];  
        
        if a<=nn && s(i) == 1
            for j = 1:5
                %DEVA noise parameters
                noise=0.2+0.02*randn(x,y);
                mat2(j,:)=mat2(j,:)+noise;
                dat(j,:)=norm(mat(1,:)-mat2(j,:));
            end
            [f,k]=min(dat);
            r(i)=k;
            a=a+1;
        elseif b<=nn && s(i) == 2
            for j = 1:5
                %DEVA noise parameters
                noise=0.2+0.02*randn(x,y);
                mat2(j,:)=mat2(j,:)+noise;
                dat(j,:)=norm(mat(2,:)-mat2(j,:));
            end
            [f,k]=min(dat);
            r(i)=k;
            b=b+1;
        elseif c<=nn && s(i) == 3
            for j = 1:5
                %DEVA noise parameters
                noise=0.2+0.02*randn(x,y);
                mat2(j,:)=mat2(j,:)+noise;
                dat(j,:)=norm(mat(3,:)-mat2(j,:));
            end
            [f,k]=min(dat);
            r(i)=k;
            c=c+1;
        elseif d<=nn && s(i) == 4
            for j = 1:5
                %DEVA noise parameters
                noise=0.2+0.02*randn(x,y);
                mat2(j,:)=mat2(j,:)+noise;
                dat(j,:)=norm(mat(4,:)-mat2(j,:));
            end
            [f,k]=min(dat);
            r(i)=k;
            d=d+1;
        elseif e<=nn && s(i) == 5
            for j = 1:5
                %DEVA noise parameters
                noise= 0.5+0.1*randn(x,y);
                mat2(j,:)=mat2(j,:)+noise;
                dat(j,:)=norm(mat(5,:)-mat2(j,:));
            end
            [f,k]=min(dat);
            r(i)=k;
            e=e+1;
        end
    
    count=count+1;
end
a=confusionmat(s,r)