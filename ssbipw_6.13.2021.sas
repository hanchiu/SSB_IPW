


*******************************************************************
Representative Intervention Analysis: Using SSB as our exposure of interest

Variable name:
Outcomes: BMIZ_ET (BMI Z score at early teen)
Exposures: Rt_f1  (1 if SSB intake during early pregnancy <= 0.5 servings/day, 0 otherwise)
           Rt_f2  (1 if SSB intake during late pregnancy <= 0.5 servings/day, 0 otherwise)
           Rt_3y  (1 if SSB intake at 3 years <= 0.5 servings/day, 0 otherwise)
           Rt_4y  (1 if SSB intake at 4 years <= 0.5 servings/day, 0 otherwise)
           Rt_5y  (1 if SSB intake at 5 years <= 0.5 servings/day, 0 otherwise)
           Rt_6y  (1 if SSB intake at 6 years <= 0.5 servings/day, 0 otherwise)

Indicator for censoring        
cen1: 1 if censor at k+1=1, and 0 otherwise. 
cen2: 1 if censor at k+1=2, and 0 otherwise. 
cen3: 1 if censor at k+1=3, and 0 otherwise. 
cen4: 1 if censor at k+1=4, and 0 otherwise. 
cen5: 1 if censor at k+1=5, and 0 otherwise. 
cen6: 1 if censor at k+1=6, and 0 otherwise. 

Baseline covariates L0: gt70k (1 if household income>=70k, 0 otherwise)
                        pabmicat_0 pabmicat_1 pabmicat_2 (paternal BMI <25, 25-29.99, >=30 kg/m2, respectively)
                        bmicat_0   bmicat_1   bmicat_2   (maternal BMI <25, 25-29.99, >=30 kg/m2, respectively)
                        coll_grad   (1 if college graduate, 0 otherwise)
                        smoke_3     (1 if smoking during pregnancy, 0 otherwise)
                        white       (1 if white/Caucasian, 0 otherwise)

L1 : qssb_f1d0     qssb_f1d1   qssb_f1d2     (indicator of tertile variables for ssb during early preganncy)
     qcalor_f10    qcalor_f11  qcalor_f12    (indicator of tertile variables for caloric intake during early preganncy)
     
L2 : qssb_cumavgM0    qssb_cumavgM1 qssb_cumavgM2        (indicator of tertile variables for average ssb intake during early amd late preganncy)
     qcalor_cumavgM0  qcalor_cumavgM1 qcalor_cumavgM2    (indicator of tertile variables for average ssb intake during early amd late preganncy)
     qbwz0       qbwz1       qbwz2                       (indicator of tertile variables for birth weight Z score)
     qcalor_ch20 qcalor_ch21 qcalor_ch22                 (indicator of tertile variables for caloric intake at 2 years)
     TV_3ycat_1                                          (TV watching at age 3, 1 if >=1.6 hours/week , 0 if <1.6 hours/week

L3 : ssb_3ycat_1                                         (SSB intake at 3 years, 1 if >=1.5 servings/week, 0 if <1.5 servings/week)
     qssb_cumavgM0    qssb_cumavgM1   qssb_cumavgM2      (indicator of tertile variables for average ssb intake during early amd late preganncy)
     qcalor_cumavgM0  qcalor_cumavgM1 qcalor_cumavgM2    (indicator of tertile variables for average ssb intake during early amd late preganncy)
     qbwz0            qbwz1           qbwz2              (indicator of tertile variables for birth weight Z score)
     qBMIZ_3y0       qBMIZ_3y1        qBMIZ_3y2          (indicator of tertile variables for BMI Z score at age 3 years)
     qcalor_cumavgC0 qcalor_cumavgC1  qcalor_cumavgC2    (indicator of tertile variables for average caloric intake at age 2 and 3 years)
	 qTV_cumavg_4y0  qTV_cumavg_4y1   qTV_cumavg_4y2     (indicator of tertile variables for average TV watching at age 3 and 4 years)

L4:  ssb_cumavg_4y_1                                     (average SSB intake at 3,4 years, 1 if >=0.5 servings/week, 0 if <0.5 servings/week)
     qssb_cumavgM0    qssb_cumavgM1   qssb_cumavgM2      (indicator of tertile variables for average ssb intake during early amd late preganncy)
     qcalor_cumavgM0  qcalor_cumavgM1 qcalor_cumavgM2    (indicator of tertile variables for average ssb intake during early amd late preganncy)
     qbwz0            qbwz1           qbwz2              (indicator of tertile variables for birth weight Z score)
     qBMIZ_3y0       qBMIZ_3y1        qBMIZ_3y2          (indicator of tertile variables for BMI Z score at age 3 years)
     qcalor_cumavgC0 qcalor_cumavgC1  qcalor_cumavgC2    (indicator of tertile variables for average caloric intake at age 2 and 3 years)
     qTV_cumavg_5y0  qTV_cumavg_5y1 qTV_cumavg_5y2       (indicator of tertile variables for average TV watching at age 3,4 and 5 years)
     
L5:  ssb_cumavg_5y_1                                     (average SSB intake at 3,4,5,6 years, 1 if >=0.7 servings/week, 0 if <0.7 servings/week
     qssb_cumavgM1 qssb_cumavgM2 (indicator of tertile variables for average SSB intake at age 3,4 and 5 years)
     qssb_cumavgM0    qssb_cumavgM1   qssb_cumavgM2      (indicator of tertile variables for average ssb intake during early amd late preganncy)
     qcalor_cumavgM0  qcalor_cumavgM1 qcalor_cumavgM2    (indicator of tertile variables for average ssb intake during early amd late preganncy)
     qbwz0            qbwz1           qbwz2              (indicator of tertile variables for birth weight Z score)
     qBMIZ_3y0       qBMIZ_3y1        qBMIZ_3y2          (indicator of tertile variables for BMI Z score at age 3 years)
     qcalor_cumavgC0 qcalor_cumavgC1  qcalor_cumavgC2    (indicator of tertile variables for average caloric intake at age 2 and 3 years)
     qTV_cumavg_6y0  qTV_cumavg_6y1 qTV_cumavg_6y2       (indicator of tertile variables for average TV watching at age 3,4, 5 and 6 years)


*********************************************************************;


libname SSB "\\DON\hanchiu";

/*data bytimesuse; set ssb.ssbworkshop; */

data bytimesuse; set bytimesuse;
_sample_=0;
run;

%* Fit numerator of cenoring weight models; 
        proc logistic data=bytimesuse  ;
	    model cen1 =  gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white  Rt_f1   ;
	    output out=cweightn1 p=pcn1;
	    run;

        proc logistic data=bytimesuse   ;
		where cen1=0;
	    model cen2 =  gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white  Rt_f2  Rt_f1 ;
	    output out=cweightn2 p=pcn2;
	    run;

		proc logistic data=bytimesuse  ;
		where cen2=0;
	    model cen3 =  gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white   Rt_3y  Rt_f2 ;   
	    output out=cweightn3 p=pcn3;
	    run;

		proc logistic data=bytimesuse   ;
		where cen3=0;
	    model cen4 = gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white    Rt_4y  Rt_3y   ;    
	    output out=cweightn4 p=pcn4;
	    run;

		proc logistic data=bytimesuse   ;
		where cen4=0;
	    model cen5 =  gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white    Rt_5y  Rt_4y   ;    
	    output out=cweightn5 p=pcn5;
	    run;

		proc logistic data=bytimesuse  ;
		where cen5=0;
	    model cen6 =  gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white    Rt_6y  Rt_5y   ;
	    output out=cweightn6 p=pcn6;
	    run;

*Denominator for cenoring models ; 

		proc logistic data=cweightn1 (drop=_level_) ;
	    model cen1 =  gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white Rt_f1   ;   
	    output out=cweight1 p=pcd1;
        run;

        proc logistic data=cweightn2 (drop=_level_) ;
	    model cen2 = gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white  Rt_f2    qssb_f1d1  qssb_f1d2     qcalor_f11     qcalor_f12; 
	    output out=cweight2 p=pcd2;
        run;
        
        proc logistic data=cweightn3 (drop=_level_) ;
	    model cen3 = gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white  Rt_3y    qssb_cumavgM1 qssb_cumavgM2 qcalor_cumavgM1 qcalor_cumavgM2  qbwz1  qbwz2  qcalor_ch21 qcalor_ch22  TV_3ycat_1 ;
	    output out=cweight3 p=pcd3;
        run;
        
		proc logistic data=cweightn4 (drop=_level_) ;
	    model cen4 = gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white  Rt_4y    ssb_3ycat_1     qssb_cumavgM1 qssb_cumavgM2  qcalor_cumavgM1 qcalor_cumavgM2
                         qbwz1  qbwz2   qBMIZ_3y1   qBMIZ_3y2    qcalor_cumavgC1 qcalor_cumavgC2  qTV_cumavg_4y1 qTV_cumavg_4y2 ;  
	    output out=cweight4 p=pcd4;
        run;
        
		proc logistic data=cweightn5 (drop=_level_) ;
	    model cen5 = gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white  Rt_5y    ssb_cumavg_4y_1  qssb_cumavgM1 qssb_cumavgM2
                        qcalor_cumavgM1 qcalor_cumavgM2  qbwz1  qbwz2   qBMIZ_3y1   qBMIZ_3y2  qcalor_cumavgC1 qcalor_cumavgC2  qTV_cumavg_5y1 qTV_cumavg_5y2  ;
	    output out=cweight5 p=pcd5;
        run;

		proc logistic data=cweightn6 (drop=_level_) ;
	    model cen6 = gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white    Rt_6y    ssb_cumavg_5y_1  qssb_cumavgM1 qssb_cumavgM2
                         qcalor_cumavgM1 qcalor_cumavgM2 qbwz1  qbwz2   qBMIZ_3y1   qBMIZ_3y2 qcalor_cumavgC1 qcalor_cumavgC2 qTV_cumavg_6y1 qTV_cumavg_6y2 ;  
	    output out=cweight6 p=pcd6;
        run;



*Numerator of treatment/exposure weight; 
       	proc logistic descending data=bytimesuse  ;
        model Rt_f1=  gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white         ;  
        output out=tweightn0 p=ptn0;
        run;

      	proc logistic descending data=bytimesuse  ;
		where cen1=0;
        model Rt_f2=  gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white   Rt_f1       ;      
        output out=tweightn1 p=ptn1;
        run;


	 	proc logistic descending data=bytimesuse  ;
		where cen2=0;
        model Rt_3y=   gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white   Rt_f2      ;
        output out=tweightn2 p=ptn2;
        run;

	  	proc logistic descending data=bytimesuse  ;
		where cen3=0;
        model Rt_4y=   gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white   Rt_3y     ;
        output out=tweightn3 p=ptn3;
        run;

	  	proc logistic descending data=bytimesuse  ;
		where cen4=0;
        model Rt_5y=   gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white   Rt_4y     ;
        output out=tweightn4  p=ptn4;
        run;


		proc logistic descending data=bytimesuse  ;
		where cen5=0;
        model Rt_6y=   gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white   Rt_5y      ;
		output out=tweightn5 p=ptn5;
        run;


*denominator of treatment/exposure weight model;

        proc logistic descending data=tweightn0 (drop=_level_) ;
        model Rt_f1 = gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white  ;
        output out=tweight0 p=ptd0;
        run;
	
        proc logistic descending data=tweightn1 (drop=_level_) ;
        model Rt_f2 = gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white qssb_f1d1  qssb_f1d2     qcalor_f11     qcalor_f12  ;
        output out=tweight1 p=ptd1;
        run;
	

       proc logistic descending data=tweightn2 (drop=_level_) ;
       model Rt_3y =   gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white qssb_cumavgM1 qssb_cumavgM2 qcalor_cumavgM1 qcalor_cumavgM2  qbwz1  qbwz2  qcalor_ch21 qcalor_ch22  TV_3ycat_1  ;
	   output out=tweight2 p=ptd2;
       run;

		proc logistic descending data=tweightn3 (drop=_level_) ;
        model Rt_4y =   gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white ssb_3ycat_1     qssb_cumavgM1 qssb_cumavgM2  qcalor_cumavgM1 qcalor_cumavgM2
                         qbwz1  qbwz2   qBMIZ_3y1   qBMIZ_3y2    qcalor_cumavgC1 qcalor_cumavgC2  qTV_cumavg_4y1 qTV_cumavg_4y2 ;
        output out=tweight3 p=ptd3;
        run;

		proc logistic descending data=tweightn4 (drop=_level_) ;
        model Rt_5y =   gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white   ssb_cumavg_4y_1  qssb_cumavgM1 qssb_cumavgM2
                        qcalor_cumavgM1 qcalor_cumavgM2  qbwz1  qbwz2   qBMIZ_3y1   qBMIZ_3y2  qcalor_cumavgC1 qcalor_cumavgC2  qTV_cumavg_5y1 qTV_cumavg_5y2   ;
        output out=tweight4 p=ptd4;
        run;

		proc logistic descending data=tweightn5 (drop=_level_) ;
        model Rt_6y =   gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white ssb_cumavg_5y_1  qssb_cumavgM1 qssb_cumavgM2
                         qcalor_cumavgM1 qcalor_cumavgM2 qbwz1  qbwz2   qBMIZ_3y1   qBMIZ_3y2 qcalor_cumavgC1 qcalor_cumavgC2 qTV_cumavg_6y1 qTV_cumavg_6y2 ;
        output out=tweight5 p=ptd5;
        run;


%*Get stabilized weights;		
data tweight;
merge tweight0 tweight1(keep= id ptd1 ptn1)  tweight2(keep=id ptd2 ptn2) tweight3(keep=id ptd3 ptn3) tweight4(keep=id ptd4 ptn4) tweight5(keep=id ptd5 ptn5) ;
by id;
run;

data cweight;
merge  cweight1(keep=id pcn1 pcd1)  cweight2(keep=id pcn2 pcd2) cweight3(keep=id pcn3 pcd3 ) cweight4(keep=id pcn4 pcd4) cweight5(keep=id pcn5 pcd5) cweight6(keep=id pcn6 pcd6)  ;
by id;
run;


proc sort data=tweight; by id ; run;
proc sort data=cweight; by id ; run;


	data weights0;
	     merge tweight  cweight;
	     by id ;
		    _sample_ = 0;	

if ptd0 ne . then do; ptn_0=Rt_f1*ptn0+(1-Rt_f1)*(1-ptn0);ptd_0=Rt_f1*ptd0+(1-Rt_f1)*(1-ptd0); end;
if ptd1 ne . then do; ptn_1=Rt_f2*ptn1+(1-Rt_f2)*(1-ptn1);ptd_1=Rt_f2*ptd1+(1-Rt_f2)*(1-ptd1); end;
if ptd2 ne . then do; ptn_2=Rt_3y*ptn2+(1-Rt_3y)*(1-ptn2);ptd_2=Rt_3y*ptd2+(1-Rt_3y)*(1-ptd2); end;
if ptd3 ne . then do; ptn_3=Rt_4y*ptn3+(1-Rt_4y)*(1-ptn3);ptd_3=Rt_4y*ptd3+(1-Rt_4y)*(1-ptd3); end; 
if ptd4 ne . then do; ptn_4=Rt_5y*ptn4+(1-Rt_5y)*(1-ptn4);ptd_4=Rt_5y*ptd4+(1-Rt_5y)*(1-ptd4); end;  
if ptd5 ne . then do; ptn_5=Rt_6y*ptn5+(1-Rt_6y)*(1-ptn5);ptd_5=Rt_6y*ptd5+(1-Rt_6y)*(1-ptd5); end; 

twght_n= ptn_0* ptn_1* ptn_2* ptn_3* ptn_4* ptn_5;
twght_d= ptd_0* ptd_1* ptd_2* ptd_3* ptd_4* ptd_5;
cwght_n = pcn1*pcn2*pcn3*pcn4*pcn5*pcn6;
cwght_d = pcd1*pcd2*pcd3*pcd4*pcd5*pcd6;
stabw=(twght_n*cwght_n)/(twght_d*cwght_d);

     if cen6=1 then stabw=0;
     run;



    proc univariate data=weights0 ;
    var stabw ;
    output out = pctlweights
    pctlpre = wgt_
    pctlname =  ulim99
    pctlpts =   99
    ;
	run;


    data limits;
    set pctlweights;
	_sample_ = 0;
    keep   _sample_  wgt_ulim99;
    run;


    data weights;
    merge weights0 limits;
	by _sample_; 
    run;

*we truncated extreme weight to 99th ; 
     data weights;
     set weights; 
     if stabw>wgt_ulim99 then stabw=wgt_ulim99;
     run;
			
     proc univariate data=weights;
     var stabw;
     run;
	 proc means mean data=weights; var stabw; run;




data bytimesuse;
merge weights bytimesuse;
by id ;
array avar  Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white;
dimoutc=dim(avar);
call symput('dimoutc',trim(left(put(dimoutc,8.))) );
run;


  %*MSM model;
	 proc reg  data=bytimesuse outest=outc   ;
	 where cen6=0;
     model BMIZ_ET =  Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white;
     weight stabw;
     run;

%*take the coefficients of MSM model; 
    data outc2;
    set outc;
    if _type_='PARMS';
	array avar intercept   Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white;
	array abeta boutc00-boutc&dimoutc;
    do i=1 to dim(avar);
    abeta(i)=avar(i);
    end;
    _sample_ = 0;
    keep  _sample_  boutc00-boutc&dimoutc;
    run;

    proc sort data=outc2; by _sample_; run;
 
    data bytimesuse ;      
    merge bytimesuse outc2  ;
	by _sample_;
    run;


%* Arm1:  set rbar function values in MSM under "r_bar=(1,1,1,1,1,1)" ;
 data intmean ;
 set bytimesuse;
 array avar uno   Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white;
 array aboutc boutc00-boutc&dimoutc;
 uno = 1;
 Rt_f1=1;
 Rt_f2=1;
 Rt_3y=1;
 Rt_4y=1;
 Rt_5y=1;
 Rt_6y=1;
 do i=1 to dim(aboutc);
 meanbmi=sum(meanbmi,aboutc(i)*avar(i));
 end; 
keep  id Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white  meanbmi  ; 
run; 

proc means data = intmean N Nmiss ;
var  meanbmi  ;   				   
output out = intmeanm mean = meanbmifinal      ;
run;


%* Arm2: set rbar function values in MSM under "r_bar=(0,0,0,0,0,0)" ;

data intmean0 ;
set bytimesuse;
array avar uno   Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white;
array aboutc boutc00-boutc&dimoutc;
uno = 1;
 Rt_f1=0;
 Rt_f2=0;
 Rt_3y=0;
 Rt_4y=0;
 Rt_5y=0;
 Rt_6y=0;
do i=1 to dim(aboutc);
meanbmi=sum(meanbmi,aboutc(i)*avar(i));
end; 
keep  id Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white  meanbmi  ; 
run; 



proc means data = intmean0  ;
var  meanbmi  ; 				   
output out = intmeanm0 mean = meanbmifinal0     ;
run;


%* Arm3: set rbar function values in MSM under "mom=1, kid=0" ;
%* set rbar function values in MSM under "(1,1,0,0,0,0)" ;
 data intmean_mom;
 set bytimesuse;
  array avar uno Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y  gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white ;
  array aboutc boutc00-boutc&dimoutc;
  array uaboutc uboutc00-uboutc&dimoutc;
  uno = 1;
 Rt_f1=1;
 Rt_f2=1;
 Rt_3y=0;
 Rt_4y=0;
 Rt_5y=0;
 Rt_6y=0;

  do i=1 to dim(aboutc);
  meanbmi=sum(meanbmi,aboutc(i)*avar(i));
  end;
  keep  id Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white  meanbmi ;
  run; 

proc means data = intmean_mom  ;
var  meanbmi   ;
output out = intmeanm_mom mean= meanbmifinal_mom      ;
run;

%* Arm4: set rbar function values in MSM under "mom=0, kid=1" ;
%* set rbar function values in MSM under "(0,0,1,1,1,1)" ;
 data intmean_kid;
 set bytimesuse;
  array avar uno   Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white;
  array aboutc boutc00-boutc&dimoutc;
  array uaboutc uboutc00-uboutc&dimoutc;
  uno = 1;
 Rt_f1=0;
 Rt_f2=0;
 Rt_3y=1;
 Rt_4y=1;
 Rt_5y=1;
 Rt_6y=1;
  do i=1 to dim(aboutc);
  meanbmi=sum(meanbmi,aboutc(i)*avar(i));
  end;
  keep  id Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white  meanbmi   ;
  run; 


proc means data = intmean_kid  ;
var  meanbmi   ;		   				   
output out = intmeanm_kid mean(meanbmi) = meanbmifinal_kid     ;
run;



proc sort data=intmeanm; by _type_;         /*r bar=(1,1,1,1,1,1)*/
proc sort data=intmeanm0; by _type_;        /*r bar=(0,0,0,0,0,0)*/
proc sort data=intmeanm_kid; by _type_;    /*rt for mom=0 amd for kid=1*/
proc sort data=intmeanm_mom; by _type_;    /*rt for mom=1 and for kid=0*/

	 
  	 data results;
	 merge intmeanm intmeanm0   intmeanm_mom intmeanm_kid;
	 by _type_;
	 meanbmidiff=meanbmifinal-meanbmifinal0; 
	 meanbmidiff_M=meanbmifinal_mom-meanbmifinal0;
	 meanbmidiff_k=meanbmifinal_kid-meanbmifinal0; 
	 keep  meanbmifinal meanbmifinal0  meanbmidiff  meanbmidiff_M  meanbmidiff_k  ;
	 run;


proc print data=results; 
run;
