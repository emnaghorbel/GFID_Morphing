function nbr_intersection= shape_intersection(G,nbrp)
%G is the shape converted to complex coordinates 
  xr=real(G);
  yr=imag(G);
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
      end
    end
end
