function [T Y]=rk4_orig(f,a,b,ya,N)
h=(b-a)/N; 
T=zeros(N+1,1); 
Y=zeros(N+1,1); 
T(1)=a; 
Y(1)=ya; 
for j=1:N
  T(j+1)=T(j)+h;
  K1=h*f(T(j),Y(j)); 
  K2=h*f(T(j)+(h/2),Y(j)+(K1/2)); 
  K3=h*f(T(j)+(h/2),Y(j)+(K2/2)); 
  K4=h*f(T(j)+h,Y(j)+K3);
  Y(j+1)=Y(j)+(1/6)*(K1+2*K2+2*K3+K4); 
end

