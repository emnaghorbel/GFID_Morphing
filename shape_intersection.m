function nbr_intersection= shape_intersection(G,nbrp)

% load('Contour_Kimia99.mat');
%  forme1=50;
% x=Contour_99{forme1}(:,1);
% y=Contour_99{forme1}(:,2);

%   close all
%   x=real(moy_G(:,8));
%   y=imag(moy_G(:,8));
  xr=real(G);
  yr=imag(G);
% nbrp= 150; % nbr de points souhaitÃ©
% xr=zeros(nbrp,1); % abs des points aprÃ¨s repar
% yr=zeros(nbrp,1); % coord des points aprÃ¨s repar
% [xr,yr,L]=Reparametrage_euclidien2(x,y,nbrp);
%         curve_rep=xr+1i*yr;
   
nbr_intersection=0;

for i=1:nbrp-3
    L1=[xr(i),yr(i); xr(i+1),yr(i+1)];
    for j=i+2:nbrp-1
    L2=[xr(j),yr(j); xr(j+1),yr(j+1)];
      [x_int, y_int] = findintersection(L1,L2);
V1=[(xr(i+1)-xr(i)), (yr(i+1)-yr(i))];
V2=[(xr(j+1)-xr(j)), (yr(j+1)-yr(j))];
V3=[x_int-xr(i), y_int-yr(i)];
V4=[x_int-xr(j), y_int-yr(j)];
A=dot(V1,V1);
B=dot(V1,V3);
D=dot(V2,V4);
C=dot(V2,V2);
      if (B>0 && B<A) && (D>0 && D<C)
        nbr_intersection=nbr_intersection+1;
%         info_du_point(i,:,:,:)=[i,i+1,j,j+1];

      end
    end
end
