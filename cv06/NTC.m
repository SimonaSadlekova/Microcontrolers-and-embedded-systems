clear all;
close all;

 ntc = csvread('ntc.csv');
 t = ntc(:,1);
 ad_t=[];
 
 for i =1: length(ntc(:,2))
     ad = (ntc(i,2)./(10+ntc(i,2))).*1024;
     ad_t = [ad_t ad];
 end
 
 figure
 plot(ad_t, t, 'o')
%  ad_t = transpose(ad_t);
 p = polyfit(ad_t', t, 10);
 ad2 = 0:1023;
 t2 = round(polyval(p, ad2), 1);
 hold on, plot(ad2, t2, 'r');
 dlmwrite('data.dlm', t2*10, ',');