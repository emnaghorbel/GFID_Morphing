clc;
clear all;
close all;
%%
 %%Hyperparameters to obtain different morphing sequence%%
Nc=35; %Truncation parameter
n0=7; %index parameter (different path in the shape space)
n1=n0-1; %index parameter 
p=0.001; %power parameter (interpolation speed parameter)
q=0.001; %power parameter (interpolation speed parameter)
nombreformesmoyennes=10; %number of inbetween curves
%%
  %LOADING SHAPES BELONGING TO A SAME CLASS FROM KIMIA99 TO CREATE A
  %MORPHING SEQUENCE
  
load('Contour_Kimia99.mat');

   %form 1 
   x=Contour_99{90}(:,1);
   y=Contour_99{90}(:,2);
   
   %form 2 
   x2=Contour_99{89}(:,1);
   y2=Contour_99{89}(:,2);
%%
%ARCLENGTH RESAMPLING 
nbrp=130; % nbr de points souhaitÃ©
xr=zeros(nbrp,1); % abs des points aprÃ¨s repar
yr=zeros(nbrp,1); % coord des points aprÃ¨s repar



[xr,yr,L]=Reparametrage_euclidien2(x,y,nbrp);
        curve_rep=xr+1i*yr;
   
F1=(xr+1i*yr);
F1(1)=F1(nbrp);
%form 2


 % nbr de points souhaitÃ©
xr2=zeros(nbrp,1); % abs des points aprÃ¨s repar
yr2=zeros(nbrp,1); % coord des points aprÃ¨s repar

[xr2,yr2,L2]=Reparametrage_euclidien2(x2,y2,nbrp);
        curve_rep2=xr2+1i*yr2;

F2=(xr2+1i*yr2);
%%
%GFID MORPHING 
[IA1,theta0,theta1]=invariant_ghorbel(nbrp,F1,Nc,n0,n1,p,q);
G1=reconstruct_ghorbel( nbrp,n0,n1,IA1,Nc,p,q,theta0,theta1);
[IA2,theta02,theta12]=invariant_ghorbel(nbrp,F2,Nc,n0,n1,p,q);
G2=reconstruct_ghorbel( nbrp,n0,n1,IA2,Nc,p,q,theta02,theta12);




%distance L2 BTW 2 INPUT SHAPES AFTER PSEUDO-INVERSE REGISTRATION
L2 = recalage_distancel2( G1,G2,nbrp );



%INBETween SHAPES
   m=1/(nombreformesmoyennes+1);
[ moy_IA,moy_G,k ] = moyenne_ghorbel(IA1,IA2,m,nbrp,Nc,p,q,n0,n1,theta0,theta1 );



%% GPC AND DPCC CRITERION 
%distance L2 entre les formes intermédiaires 
for i=1:k-1
l2(i)=recalage_distancel2(moy_G(:,i),moy_G(:,i+1),nbrp);
end
%distance L2 entre la première formes et la suivante intermédiaire 

l2_first=recalage_distancel2(G1,moy_G(:,1),nbrp);

%distance L2 entre la dernère forme et la précendente intermédiaire 

l2_last=recalage_distancel2(G2,moy_G(:,k),nbrp);

%critères GPC and DPCC

V_distancel2=[l2_first, l2];

New_criteria= [max(V_distancel2), sum(V_distancel2)/L2];

somme=sum(V_distancel2);

sup=max(V_distancel2);

GPC=somme/L2;

DPCC=sup/(somme/(nombreformesmoyennes));



%% PLOTTING THE MOPRHING SEQUENCE
colorspecstr = ['k','k','k','k','k','k','k','k','k','r','g','b','k','m','g','r','g','b','k','m','g','r','g','b'];
dt =1200;
t=1
kin=1


 

kin=kin+1;
% 


figure(1)
z = plot(G1+(dt*(kin-1)),'Color',colorspecstr(kin-t),'LineWidth',1); axis equal; hold on;axis equal; axis off; axis tight;  
        set(z,'LineWidth',1.5);
hold on
for j=3:k+2
    figure(2)
    hold on
    


 figure(1)
hold on

kin=kin+1;

z = plot(moy_G(:,j-2)+(dt*(kin-1)),'Color',colorspecstr(kin-t),'LineWidth',1); axis equal; hold on;axis equal; axis off; axis tight;  
        set(z,'LineWidth',1.5);
end
% 
figure(1)
hold on
kin=kin+1;
Gy2=imag(G2);
Gy2=Gy2-1000;
z = plot(G2+(dt*(kin)),'Color',colorspecstr(kin-t),'LineWidth',1); axis equal; hold on;axis equal; axis off; axis tight;  
        set(z,'LineWidth',1.5);
% 


