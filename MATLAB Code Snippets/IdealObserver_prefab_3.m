%Ideal Observer for LV Object Recog
%%
%Read images
%Convert images to grayscale
SUg=rgb2gray(SU); 
SDg=rgb2gray(SD);
RUg=rgb2gray(RU);
RDg=rgb2gray(RD);
FLg=rgb2gray(FL);

%Convert to double
SUg=double(SUg); 
SDg=double(SDg);
RUg=double(RUg);
RDg=double(RDg);
FLg=double(FLg); 

%Set to 0 to 1 - 255 bit scale
%SUg=SUg ;
%SDg=SDg ;
%RUg=RUg ;
%RDg=RDg ;
%FLg=FLg ;

%Crop images to critical area
SUg=SUg(1100:1500,450:1000);
SDg=SDg(1100:1500,450:1000);
RUg=RUg(1100:1500,450:1000);
RDg=RDg(1100:1500,450:1000);
FLg=FLg(1100:1500,450:1000);
[x,y]=size(SUg);

%Create vectors of the templates
SUr=reshape(SUg,[1,x*y]);
SDr=reshape(SDg,[1,x*y]);
RUr=reshape(RUg,[1,x*y]);
RDr=reshape(RDg,[1,x*y]);
FLr=reshape(FLg,[1,x*y]);

%Orient vectors to be spread about zero

SUr=SUr-mean(SUr);
SDr=SDr-mean(SDr);
RUr=RUr-mean(RUr);
RDr=RDr-mean(RDr);
FLr=FLr-mean(FLr);

%Put template unit vectors into a matrix for later access.
mat=[SUr;SDr;RUr;RDr;FLr];

%%
%Handle all 30 of the blurred images.
%Convert images to grayscale
SUg10=double(rgb2gray(SU10)); SUg12=double(rgb2gray(SU12)) ; SUg14=double(rgb2gray(SU14)) ; SUg16=double(rgb2gray(SU16)) ; SUg18=double(rgb2gray(SU18)) ; SUg20=double(rgb2gray(SU20)) ; 
SDg10=double(rgb2gray(SD10)) ; SDg12=double(rgb2gray(SD12)) ; SDg14=double(rgb2gray(SD14)) ; SDg16=double(rgb2gray(SD16)) ; SDg18=double(rgb2gray(SD18)) ; SDg20=double(rgb2gray(SD20)) ; 
RUg10=double(rgb2gray(RU10)) ; RUg12=double(rgb2gray(RU12)) ; RUg14=double(rgb2gray(RU14)) ; RUg16=double(rgb2gray(RU16)) ; RUg18=double(rgb2gray(RU18)) ; RUg20=double(rgb2gray(RU20)) ;
RDg10=double(rgb2gray(RD10)) ; RDg12=double(rgb2gray(RD12)) ; RDg14=double(rgb2gray(RD14)) ; RDg16=double(rgb2gray(RD16)) ; RDg18=double(rgb2gray(RD18)) ; RDg20=double(rgb2gray(RD20)) ;
FLg10=double(rgb2gray(FL10)) ; FLg12=double(rgb2gray(FL12)) ; FLg14=double(rgb2gray(FL14)) ; FLg16=double(rgb2gray(FL16)) ; FLg18=double(rgb2gray(FL18)) ; FLg20=double(rgb2gray(FL20)) ;

%Crop and resize
SUr10=reshape(SUg10(1100:1500,450:1000),[1,x*y]); SUr12=reshape(SUg12(1100:1500,450:1000),[1,x*y]); SUr14=reshape(SUg14(1100:1500,450:1000),[1,x*y]); SUr16=reshape(SUg16(1100:1500,450:1000),[1,x*y]); SUr18=reshape(SUg18(1100:1500,450:1000),[1,x*y]); SUr20=reshape(SUg20(1100:1500,450:1000),[1,x*y]);
SDr10=reshape(SDg10(1100:1500,450:1000),[1,x*y]); SDr12=reshape(SDg12(1100:1500,450:1000),[1,x*y]); SDr14=reshape(SDg14(1100:1500,450:1000),[1,x*y]); SDr16=reshape(SDg16(1100:1500,450:1000),[1,x*y]); SDr18=reshape(SDg18(1100:1500,450:1000),[1,x*y]); SDr20=reshape(SDg20(1100:1500,450:1000),[1,x*y]);
RUr10=reshape(RUg10(1100:1500,450:1000),[1,x*y]); RUr12=reshape(RUg12(1100:1500,450:1000),[1,x*y]); RUr14=reshape(RUg14(1100:1500,450:1000),[1,x*y]); RUr16=reshape(RUg16(1100:1500,450:1000),[1,x*y]); RUr18=reshape(RUg18(1100:1500,450:1000),[1,x*y]); RUr20=reshape(RUg20(1100:1500,450:1000),[1,x*y]);
RDr10=reshape(RDg10(1100:1500,450:1000),[1,x*y]); RDr12=reshape(RDg12(1100:1500,450:1000),[1,x*y]); RDr14=reshape(RDg14(1100:1500,450:1000),[1,x*y]); RDr16=reshape(RDg16(1100:1500,450:1000),[1,x*y]); RDr18=reshape(RDg18(1100:1500,450:1000),[1,x*y]); RDr20=reshape(RDg20(1100:1500,450:1000),[1,x*y]);
FLr10=reshape(FLg10(1100:1500,450:1000),[1,x*y]); FLr12=reshape(FLg12(1100:1500,450:1000),[1,x*y]); FLr14=reshape(FLg14(1100:1500,450:1000),[1,x*y]); FLr16=reshape(FLg16(1100:1500,450:1000),[1,x*y]); FLr18=reshape(FLg18(1100:1500,450:1000),[1,x*y]); FLr20=reshape(FLg20(1100:1500,450:1000),[1,x*y]);

%SUr10=reshape(SUg10,[1,x*y]); SUr12=reshape(SUg12,[1,x*y]); SUr14=reshape(SUg14,[1,x*y]); SUr16=reshape(SUg16,[1,x*y]); SUr18=reshape(SUg18,[1,x*y]); SUr20=reshape(SUg20,[1,x*y]);
%SDr10=reshape(SDg10,[1,x*y]); SDr12=reshape(SDg12,[1,x*y]); SDr14=reshape(SDg14,[1,x*y]); SDr16=reshape(SDg16,[1,x*y]); SDr18=reshape(SDg18,[1,x*y]); SDr20=reshape(SDg20,[1,x*y]);
%RUr10=reshape(RUg10,[1,x*y]); RUr12=reshape(RUg12,[1,x*y]); RUr14=reshape(RUg14,[1,x*y]); RUr16=reshape(RUg16,[1,x*y]); RUr18=reshape(RUg18,[1,x*y]); RUr20=reshape(RUg20,[1,x*y]);
%RDr10=reshape(RDg10,[1,x*y]); RDr12=reshape(RDg12,[1,x*y]); RDr14=reshape(RDg14,[1,x*y]); RDr16=reshape(RDg16,[1,x*y]); RDr18=reshape(RDg18,[1,x*y]); RDr20=reshape(RDg20,[1,x*y]);
%FLr10=reshape(FLg10,[1,x*y]); FLr12=reshape(FLg12,[1,x*y]); FLr14=reshape(FLg14,[1,x*y]); FLr16=reshape(FLg16,[1,x*y]); FLr18=reshape(FLg18,[1,x*y]); FLr20=reshape(FLg20,[1,x*y]);

SUr10=SUr10-mean(SUr10); SUr12=SUr12-mean(SUr12); SUr14=SUr14-mean(SUr14); SUr16=SUr16-mean(SUr16); SUr18=SUr18-mean(SUr18); SUr20=SUr20-mean(SUr20);
SDr10=SDr10-mean(SDr10); SDr12=SDr12-mean(SDr12); SDr14=SDr14-mean(SDr14); SDr16=SDr16-mean(SDr16); SDr18=SDr18-mean(SDr18); SDr20=SDr20-mean(SDr20);
RUr10=RUr10-mean(RUr10); RUr12=RUr12-mean(RUr12); RUr14=RUr14-mean(RUr14); RUr16=RUr16-mean(RUr16); RUr18=RUr18-mean(RUr18); RUr20=RUr20-mean(RUr20);
RDr10=RDr10-mean(RDr10); RDr12=RDr12-mean(RDr12); RDr14=RDr14-mean(RDr14); RDr16=RDr16-mean(RDr16); RDr18=RDr18-mean(RDr18); RDr20=RDr20-mean(RDr20);
FLr10=FLr10-mean(FLr10); FLr12=FLr12-mean(FLr12); FLr14=FLr14-mean(FLr14); FLr16=FLr16-mean(FLr16); FLr18=FLr18-mean(FLr18); FLr20=FLr20-mean(FLr20);

BlurStims=[SUr10;SDr10;RUr10;RDr10;FLr10;SUr12;SDr12;RUr12;RDr12;FLr12;...
    SUr14;SDr14;RUr14;RDr14;FLr14;SUr16;SDr16;RUr16;RDr16;FLr16;...
    SUr18;SDr18;RUr18;RDr18;FLr18;SUr20;SDr20;RUr20;RDr20;FLr20;];

        SUbr=BlurStims(1,:);
        SDbr=BlurStims(2,:);
        RUbr=BlurStims(3,:);
        RDbr=BlurStims(4,:);
        FLbr=BlurStims(5,:);
        mat1=[SUbr;SDbr;RUbr;RDbr;FLbr];     

        SUbr=BlurStims(6,:);
        SDbr=BlurStims(7,:);
        RUbr=BlurStims(8,:);
        RDbr=BlurStims(9,:);
        FLbr=BlurStims(10,:);
        mat2=[SUbr;SDbr;RUbr;RDbr;FLbr];

        SUbr=BlurStims(11,:);
        SDbr=BlurStims(12,:);
        RUbr=BlurStims(13,:);
        RDbr=BlurStims(14,:);
        FLbr=BlurStims(15,:);
        mat3=[SUbr;SDbr;RUbr;RDbr;FLbr];

        SUbr=BlurStims(16,:);
        SDbr=BlurStims(17,:);
        RUbr=BlurStims(18,:);
        RDbr=BlurStims(19,:);
        FLbr=BlurStims(20,:);
        mat4=[SUbr;SDbr;RUbr;RDbr;FLbr];

        SUbr=BlurStims(21,:);
        SDbr=BlurStims(22,:);
        RUbr=BlurStims(23,:);
        RDbr=BlurStims(24,:);
        FLbr=BlurStims(25,:);
        mat5=[SUbr;SDbr;RUbr;RDbr;FLbr];

        SUbr=BlurStims(26,:);
        SDbr=BlurStims(27,:);
        RUbr=BlurStims(28,:);
        RDbr=BlurStims(29,:);
        FLbr=BlurStims(30,:);
        mat6=[SUbr;SDbr;RUbr;RDbr;FLbr];        


