function [ Res ] = DPCC( G1,G2,moy_G, nbrp,k )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%distance L2 BTW 2 INPUT SHAPES AFTER PSEUDO-INVERSE REGISTRATION
L2 = recalage_distancel2( G1,G2,nbrp );
for i=1:k-1
l2(i)=recalage_distancel2(moy_G(:,i),moy_G(:,i+1),nbrp);
end
%distance L2 entre la première formes et la suivante intermédiaire 

l2_first=recalage_distancel2(G1,moy_G(:,1),nbrp);

%distance L2 entre la dernère forme et la précendente intermédiaire 

l2_last=recalage_distancel2(G2,moy_G(:,k),nbrp);

%critères GPC and DPCC

V_distancel2=[l2_first, l2, l2_last];

Res=max(V_distancel2)/mean(V_distancel2);
end
