function [ l2 ] = recalage_distancel2( F1,F2,N )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


      
        %shape1
        
        
      Xf=real(F1);
      Yf=imag(F1); 
       
       %shape2
      Xh=real(F2);
      Yh=imag(F2);
       
      
      D=zeros(200,6);
   
       for c=1:2:199
           
             D(c,1)=Xf(fix(c/2)+1);
             D(c,2)=Yf(fix(c/2)+1);
             D(c,5)=1;
             
       end
   
   
   for c2=2:2:200
      
             D(c2,3)=Xf(fix(c2/2));
             D(c2,4)=Yf(fix(c2/2));
             D(c2,6)=1;
       
   end
%    c=1;
%    DtD=        [XfB2 XYfB 0 0 XfB 0 ; 
%                 XYfB YfB2 0 0 YfB 0 ;
%                 0 0 XfB2 XYfB 0 XfB ; 
%                 0 0 XYfB YfB2 0 YfB;
%                 XfB YfB 0 0 1 0 ;
%                 0 0 XfB YfB 0 1];
%   
Dt=D.';
DtDm=Dt*D;
DtDinv=zeros (6,6);

DtDinv= inv(DtDm);
H=zeros(200,1);           
for z=1:2:199
   H(z,1)= Xh(fix(z/2)+1);   

end 
for z2=2:2:200
    H(z2,1)= Yh(fix(z2/2));   

end 
U1=DtDinv*Dt;
U=U1*H;
A11=U(1);
A12=U(2);
A21=U(3) ;
A22=U(4);
Bx=U(5);
By=U(6);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%resultat avec f estimer%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Hxres=A11*Xf+A12*Yf+Bx;
Hyres=A21*Xf+A22*Yf+By;
l2=sqrt(sum(((Hxres-Xh).^2)+((Hyres-Yh).^2)));

end

