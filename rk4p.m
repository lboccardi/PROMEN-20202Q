function [T Y]=rk4p(f_param,a,b,ya,M,P)

h=(b-a)/M;
T=zeros(M+1,1);
Y=zeros(M+1,length(ya));
T(1)=a;
Y(1,:)=ya;
for j=1:M
  T(j+1)=T(j)+h;
  K1=h*f_param(T(j),Y(j,:),P);
  K2=h*f_param(T(j)+h/2,Y(j,:)+K1/2,P);
  K3=h*f_param(T(j)+h/2,Y(j,:)+K2/2,P);
  K4=h*f_param(T(j)+h,Y(j,:)+K3,P);            
  Y(j+1,:)= Y(j, :)+(K1+2*K2+2*K3+K4)/6; 
end
