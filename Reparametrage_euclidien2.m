function [X1,Y1,L]=Reparametrage_euclidien2(X,Y,N)
%Contour= {X(t),Y(t)} et N:nombre de point après le réparamétrage 
n=length(X);
t=0:1/(n-1):1;  %parametrisation initiale    
x1=X; px=csapi(t,x1);
y1=Y; py=csapi(t,y1);


[L, s]=AbscisseEuclidien(t,px,py,N);
save s s;
save px px;
X1=fnval(px,s); 
Y1=fnval(py,s); 
 
X1=X1'; Y1=Y1';
function [L, out]=AbscisseEuclidien(t,p1,p2,N)
dp1=fnder(p1,1); dp2=fnder(p2,1);
X1=fnval(dp1,t); X2=fnval(dp2,t); 
X=sqrt(X1.^2+X2.^2);

pp=csapi(t,X);
I=fnint(pp);     
s=fnval(I,t);
L=max(abs(s));
s=s./max(abs(s));
[s, index] = unique(s);
out = interp1(s, t(index),0:1/(N-1):1 );
