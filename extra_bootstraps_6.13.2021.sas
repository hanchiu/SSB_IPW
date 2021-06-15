
/*change to the path where you store the data*/
libname SSB "\\DON\hanchiu";

/*data bytimes; set ssb.ssbworkshop; */


***********************************************************************
        Creation of stablized weight, using %macro wtssb               
***********************************************************************;
%macro wtssb;

%*purpose of this macro is to spit out a data set that contains id time and sw, where sw is the stabilized weight;
%*treatlist: the variable list for treatment/exposure weight; 
	  %let treatlist0 = ; /*L0*/

	  %let treatlist1 = qssb_f1d1  qssb_f1d2     qcalor_f11     qcalor_f12   ; /*L1*/

	  %let treatlist2 =  qssb_cumavgM1 qssb_cumavgM2
                        qcalor_cumavgM1 qcalor_cumavgM2
                        qbwz1  qbwz2     
                        qcalor_ch21 qcalor_ch22  TV_3ycat_1  /*L2*/
                        ;
	  %let treatlist3 =  ssb_3ycat_1     qssb_cumavgM1 qssb_cumavgM2
                          qcalor_cumavgM1 qcalor_cumavgM2
                         qbwz1  qbwz2   qBMIZ_3y1   qBMIZ_3y2    qcalor_cumavgC1 qcalor_cumavgC2
						 qTV_cumavg_4y1 qTV_cumavg_4y2
                        ; /*L3*/

       %let treatlist4 =ssb_cumavg_4y_1
                         qssb_cumavgM1 qssb_cumavgM2
                         qcalor_cumavgM1 qcalor_cumavgM2
                         qbwz1  qbwz2   qBMIZ_3y1   qBMIZ_3y2  qcalor_cumavgC1 qcalor_cumavgC2
                           qTV_cumavg_5y1 qTV_cumavg_5y2; /*L4*/

       %let treatlist5 =ssb_cumavg_5y_1  qssb_cumavgM1 qssb_cumavgM2
                          qcalor_cumavgM1 qcalor_cumavgM2
                         qbwz1  qbwz2   qBMIZ_3y1   qBMIZ_3y2   
                          qcalor_cumavgC1 qcalor_cumavgC2
						   qTV_cumavg_6y1 qTV_cumavg_6y2  
                        ; /*L5*/
  
%*cenlist: the variable list for censoring weight ;
      %let cenlist1 =   Rt_f1    &treatlist0 ;
      %let cenlist2 =   Rt_f2    &treatlist1 ;
      %let cenlist3 =   Rt_3y    &treatlist2 ;
	  %let cenlist4 =   Rt_4y    &treatlist3 ; 
      %let cenlist5 =   Rt_5y    &treatlist4 ; 
	  %let cenlist6 =   Rt_6y    &treatlist5 ; 
 
      proc sort data=bytimesuse;
	  by id ;
	  run;

%* Fit numerator of cenoring weight models; 
        proc logistic data=bytimesuse noprint ;
	    model cen1 =  &V   Rt_f1   ;
         freq numberhits;
	    output out=cweightn1 p=pcn1;
	    run;

        proc logistic data=bytimesuse  noprint ;
		 where cen1=0;
	    model cen2 =  &V   Rt_f2  Rt_f1 ;
            freq numberhits;
	    output out=cweightn2 p=pcn2;
	    run;

		 proc logistic data=bytimesuse noprint ;
		 where cen2=0;
	    model cen3 =  &V   Rt_3y  Rt_f2 ;
            freq numberhits;
	    output out=cweightn3 p=pcn3;
	    run;

		  proc logistic data=bytimesuse  noprint ;
		  where cen3=0;
	    model cen4 =  &V    Rt_4y  Rt_3y   ;
            freq numberhits;
	    output out=cweightn4 p=pcn4;
	    run;

		  proc logistic data=bytimesuse  noprint ;
		  where cen4=0;
	    model cen5 =  &V    Rt_5y  Rt_4y   ;
            freq numberhits;
	    output out=cweightn5 p=pcn5;
	    run;

		proc logistic data=bytimesuse noprint ;
		where cen5=0;
	    model cen6 =  &V    Rt_6y  Rt_5y   ;
            freq numberhits;
	    output out=cweightn6 p=pcn6;
	    run;

*Denominator for cenoring models ; 

		 proc logistic data=cweightn1 (drop=_level_) noprint;
	     model cen1 =  &V  &cenlist1 ;
	      freq numberhits;
	     output out=cweight1 p=pcd1;
        run;

        proc logistic data=cweightn2 (drop=_level_) noprint;
	     model cen2 =  &V  &cenlist2 ;
	      freq numberhits;
	     output out=cweight2 p=pcd2;
        run;
        
        proc logistic data=cweightn3 (drop=_level_) noprint;
	     model cen3 = &v   &cenlist3 ;
	      freq numberhits;
	     output out=cweight3 p=pcd3;
        run;
        
		 proc logistic data=cweightn4 (drop=_level_) noprint;
	     model cen4 = &v   &cenlist4 ;
	      freq numberhits;
	     output out=cweight4 p=pcd4;
        run;
        
		 proc logistic data=cweightn5 (drop=_level_) noprint;
	     model cen5 = &v   &cenlist5 ;
	      freq numberhits;
	     output out=cweight5 p=pcd5;
        run;

		 proc logistic data=cweightn6 (drop=_level_) noprint;
	     model cen6 = &v   &cenlist6 ;
	      freq numberhits;
	     output out=cweight6 p=pcd6;
        run;



*Numerator of treatment/exposure weight; 

       	proc logistic descending data=bytimesuse  noprint;
           model Rt_f1=  &V          ;  
		     freq numberhits;
             output out=tweightn0 p=ptn0;
                run;

      	proc logistic descending data=bytimesuse  noprint;
		where cen1=0;
           model Rt_f2=  &V    Rt_f1       ; 
		     freq numberhits;
             output out=tweightn1 p=ptn1;
                run;


	 	proc logistic descending data=bytimesuse  noprint;
		where cen2=0;
                    model Rt_3y=   &V   Rt_f2      ;
		     freq numberhits;
                    output out=tweightn2 p=ptn2;
                run;

	  	proc logistic descending data=bytimesuse  noprint;
		where cen3=0;
                    model Rt_4y=   &V   Rt_3y     ;
		     freq numberhits;
                    output out=tweightn3 p=ptn3;
                run;

	  	proc logistic descending data=bytimesuse  noprint;
		where cen4=0;
                    model Rt_5y=   &V   Rt_4y     ;
		     freq numberhits;
                    output out=tweightn4  p=ptn4;
                run;


		proc logistic descending data=bytimesuse  noprint;
		where cen5=0;
                    model Rt_6y=   &V   Rt_5y      ;
		     freq numberhits;
                    output out=tweightn5 p=ptn5;
                run;


*denominator of treatment/exposure weight model;

          proc logistic descending data=tweightn0 (drop=_level_) noprint;
                    model Rt_f1 = &V &treatlist0  ;
		     freq numberhits;
                    output out=tweight0 p=ptd0;
                run;
	
        proc logistic descending data=tweightn1 (drop=_level_) noprint;
                    model Rt_f2 = &V &treatlist1  ;
		     freq numberhits;
                    output out=tweight1 p=ptd1;
                run;
	

       proc logistic descending data=tweightn2 (drop=_level_) noprint;
                    model Rt_3y =   &V &treatlist2  ;
		     freq numberhits;
                    output out=tweight2 p=ptd2;
                run;

		proc logistic descending data=tweightn3 (drop=_level_) noprint;
                    model Rt_4y =   &V &treatlist3  ;
		     freq numberhits;
                    output out=tweight3 p=ptd3;
                run;

		proc logistic descending data=tweightn4 (drop=_level_) /*noprint*/;
                    model Rt_5y =   &V &treatlist4  ;
		     freq numberhits;
                    output out=tweight4 p=ptd4;
                run;

		proc logistic descending data=tweightn5 (drop=_level_) noprint;
                    model Rt_6y =   &V &treatlist5  ;
		     freq numberhits;
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
_sample_ = &bsample;	
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


proc univariate data=weights0 /*noprint*/;
var stabw ;
freq numberhits;
output out = pctlweights
pctlpre = wgt_
pctlname =  ulim99
pctlpts =  99
;
run; 



data limits;
set pctlweights;
_sample_ = &bsample;
keep _sample_  wgt_ulim99;
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

%mend;





/***********************************************************************/
/*       Weighted Outcome Regression   */ 
/***********************************************************************/


%macro meanssb;

     %local dimoutc ;
     
     /*put function of treatment/exposure here*/
     %let tmtfunc = Rt_f1  Rt_f2   Rt_3y Rt_4y  Rt_5y Rt_6y ;

                   
data bytimesuse;
merge weights bytimesuse;
by id ;
array avar  &tmtfunc &V;
dimoutc=dim(avar);
call symput('dimoutc',trim(left(put(dimoutc,8.))) );
run;


%*MSM model;
proc reg  data=bytimesuse outest=outc   ;
where cen6=0;
model BMIZ_ET =  &tmtfunc &V;
freq numberhits;
weight stabw;
run;


    data outc2;
    set outc;
    if _type_='PARMS';
	array avar intercept   &tmtfunc &V;
	array abeta boutc00-boutc&dimoutc;
	_sample_ = &bsample;
    do i=1 to dim(avar);
    abeta(i)=avar(i);
    end;
    keep _sample_ boutc00-boutc&dimoutc;
    run;



proc sort data=outc2; by _sample_; run;
 
 data bytimesuse ;      
 merge bytimesuse outc2  ;
 by _sample_;
 run;



%* set rbar function values in MSM under "r_bar=(1,1,1,1,1,1)" ;
 data intmean ;
 set bytimesuse;
  array avar uno   &tmtfunc &V;
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

keep  id _sample_ numberhits &V &tmtfunc  meanbmi  ; 
run; 



proc means data = intmean N Nmiss ;
var  meanbmi  ;
freq numberhits;			   				   
output out = intmeanm mean = meanbmifinal      ;
run;




%* set rbar function values in MSM under "r_bar=(0,0,0,0,0,0)" ;

data intmean0 ;
set bytimesuse;
array avar uno   &tmtfunc &V;
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

keep  id _sample_ numberhits &V &tmtfunc  meanbmi  ; 
run; 



proc means data = intmean0 noprint ;
var  meanbmi  ;
freq numberhits;			   				   
output out = intmeanm0 mean = meanbmifinal0     ;
run;


%* set rbar function values in MSM under "mom=1, kid=0" ;



 data intmean_mom;
 set bytimesuse;
  array avar uno &tmtfunc  &V ;
  array aboutc boutc00-boutc&dimoutc;
  array uaboutc uboutc00-uboutc&dimoutc;
  uno = 1;
%* set rbar function values in MSM under "(1,1,0,0,0,0)" ;

 Rt_f1=1;
 Rt_f2=1;
 Rt_3y=0;
 Rt_4y=0;
 Rt_5y=0;
 Rt_6y=0;
do i=1 to dim(aboutc);
meanbmi=sum(meanbmi,aboutc(i)*avar(i));
end;
keep  id _sample_ numberhits &V &tmtfunc  meanbmi  ;
run; 

        proc means data = intmean_mom noprint ;
        var  meanbmi   ;
	    freq numberhits;			   				   
        output out = intmeanm_mom mean= meanbmifinal_mom      ;
        run;

%* set rbar function values in MSM under "(0,0,1,1,1,1)" ;

 data intmean_kid;
 set bytimesuse;

  array avar uno   &tmtfunc &V;
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
    keep  id _sample_ numberhits &V &tmtfunc  meanbmi  ;
 run; 


          proc means data = intmean_kid noprint ;
          var  meanbmi   ;
	      freq numberhits;			   				   
          output out = intmeanm_kid mean(meanbmi) = meanbmifinal_kid     ;
          run;

%mend;




***********************************************************************
                      Get 95% confidence Intervals by boostraps                          
***********************************************************************;

/*bootstrap loop*/ 
%macro ipw_mean(data=, weights=,V=,nsamples=,samplesize=,resultsdata=,samplestart=, sampleend=);

%*create data set with number of hits for each individual id for bootstrap; 
data _idholders_ (index = (bsample));
     do bsample = 0 to &nsamples ;
         do _newid_ = 1 to &samplesize;
           output ;
         end;
     end;
     run;

     proc surveyselect data= _idholders_ 
         method = urs
         n= &samplesize
         seed = 1232  
         out = _idsamples (keep = bsample _newid_  numberhits  ) 
         outall    
                 ;
      strata bsample ;
      run;

      data _idsamples ; 
      set _idsamples ;
      if bsample = 0 then numberhits = 1 ;
      run;

%*add sequential newid to bytimes data set;
  proc sort data=&data nodupkey out=indiv; by id; run;


       data indiv (keep= _newid_ id);
       set indiv;
       _newid_ =_n_;
       run;

        proc sort data=indiv;
        by id;
        run;
        proc sort data=&data; by id;

        data &data;
        merge indiv &data;
        by id;
        run;



       %*bootstrap loop starts here - for now just have this;

       %do bsample = &samplestart %to &sampleend;

       %put bootstrap sample &bsample;

proc sort data=&data; by _newid_;

data bytimesuse ;
          merge &data _idsamples (keep = _newid_ numberhits bsample 
                                   where = (bsample = %eval(&bsample))
                                    );
          by _newid_  ;
		  _sample_ = &bsample;
          drop bsample ;
          run;


     %&weights;  

     %meanssb;  
  
  /*the estimate that we want to bootstraps*/  
	 proc sort data=intmeanm; by _type_;         /*r bar=(1,1,1,1,1,1)*/
	 proc sort data=intmeanm0; by _type_;        /*r bar=(0,0,0,0,0,0)*/
     proc sort data=intmeanm_mom; by _type_;    /*rt for mom=1 and for kid=0*/
     proc sort data=intmeanm_kid; by _type_;    /*rt for mom=0 amd for kid=1*/
	 
  	 data results;
	 merge intmeanm intmeanm0   intmeanm_mom intmeanm_kid;
	 by _type_;
	 meanbmidiff=meanbmifinal-meanbmifinal0; 
	 meanbmidiff_M=meanbmifinal_mom-meanbmifinal0;
	 meanbmidiff_k=meanbmifinal_kid-meanbmifinal0; 
	 _sample_ = &bsample;
	 keep _sample_ meanbmifinal meanbmifinal0  
                   meanbmidiff  meanbmidiff_M  meanbmidiff_k  ;
	 run;


	 %if &bsample=&samplestart %then %do;
    	     data resultsall;
    	     set results;
    	     run;
	     %end;

	%else %do;
              proc append base = resultsall data = results;
              run;
	      %end;



       %end; 
       

proc print data=resultsall;
title '&bsample';
run;
data &resultsdata;
set resultsall;
run;


%mend;


%*Call to ipw_mean macro to ultimately create permanent data sets with all results needed for paper  ;

***********************************************************************
        Get Final IPW estimate(%ipw_mean)         
***********************************************************************;

%ipw_mean(data=bytimes, weights=wtssb,V=gt70k   pabmicat_1 pabmicat_2  bmicat_1 bmicat_2  coll_grad   smoke_3 white, nsamples=500, samplesize=1584, resultsdata=ssbmain_0,samplestart=0,sampleend=0);





%*Call to ipw_surv macro to ultimately create permanent data sets with all results needed for paper  ;

/*
libname Jess "P:\g formula\data\bsdata";
libname Jess "\\DON\hanchiu";
/*
%ipw_mean(data=bytimes,weights=wtssb,   V=gt70k   pabmicat_1 pabmicat_2   bmicat_1 bmicat_2 coll_grad   smoke_3 white  , nsamples=500, resultsdata=jess.ssb_0_100,samplestart=0,sampleend=100);
%ipw_mean(data=bytimes,weights=wtssb,   V=gt70k   pabmicat_1 pabmicat_2   bmicat_1 bmicat_2 coll_grad   smoke_3 white  , nsamples=500, resultsdata=jess.ssb_101_200,samplestart=101,sampleend=200);
%ipw_mean(data=bytimes,weights=wtssb,   V=gt70k   pabmicat_1 pabmicat_2   bmicat_1 bmicat_2 coll_grad   smoke_3 white  , nsamples=500, resultsdata=jess.ssb_201_300,samplestart=201,sampleend=300);
%ipw_mean(data=bytimes,weights=wtssb,   V=gt70k   pabmicat_1 pabmicat_2   bmicat_1 bmicat_2 coll_grad   smoke_3 white  , nsamples=500, resultsdata=jess.ssb_301_400,samplestart=301,sampleend=400);
%ipw_mean(data=bytimes,weights=wtssb,   V=gt70k   pabmicat_1 pabmicat_2   bmicat_1 bmicat_2 coll_grad   smoke_3 white  , nsamples=500, resultsdata=jess.ssb_401_500,samplestart=401,sampleend=500);

* Bootstraps to get 95%CI. Can simply use samplestart=0 to sampleend=500; I separate 500 bs into 5 datasets and put/stack 5 dataset together *


%macro puttogether(data=);
data &data;
set jess.&data._0_100;
run;

proc append base = &data data = jess.&data._101_200; run;
proc append base = &data data = jess.&data._201_300; run;
proc append base = &data data = jess.&data._301_400; run;
proc append base = &data data = jess.&data._401_500; run;


data jess.&data;
set &data;
run;

proc print data=jess.&data;
run;

%mend puttogether;
%puttogether(data=ssb);

*/


/*************** Get 95%CI from bootstrap*********************************
data ncest;
set jess.ssb;
if _sample_=0;
run;
data estimates;
set jess.ssb;
int=0;
if _sample_ = 0; 
run;

data estimates;
merge estimates ncest;
by _sample_;
run;



data bs; set jess.ssb;
if _sample_ > 0;
run;

      proc univariate data=bs noprint;
        var meanbmidiff  meanbmidiff_M  meanbmidiff_K        ;
        output out = pctlci
            pctlpre = diff_  diff_M_ diff_k_ 
            pctlname = lbpctl ubpctl
            pctlpts = 2.5 97.5
            ; histogram ; run; 

data pctlci; set pctlci; int=0;
proc sort data=pctlci; by int;
proc sort data=estimates; by int; 
data pctlci2 ;
merge pctlci estimates;
by int;
run;

title '&intdata diff bs SW results';
proc print data=pctlci2;
var 
meanbmidiff   diff_lbpctl   diff_ubpctl  
meanbmidiff_M   diff_M_lbpctl   diff_M_ubpctl 
meanbmidiff_K   diff_K_lbpctl   diff_K_ubpctl;
run;


